<script setup lang="ts">
import { router } from '~/main'
import type { ListElement } from '~/types/gameTypes'
import { useBetAdd } from '~/services/withdraw'
import { ListItemMeta } from 'ant-design-vue'
const { getBetAdd } = useBetAdd()
const props = withDefaults(
  defineProps<{ show: boolean; games: ListElement[] }>(), {
    show: false,
    games: () => [],
  })

const emit = defineEmits(['close'])

const { t } = useI18n()
interface activityItem {
  name: string,
  img: string,
  type: number,
  isShow: any
}
const isShow = ref(props.show)
const appStore = useAppStore()

const route = useRoute()

const { showTopDrawer, isShowCode, isShowCheckIn, drawerTarget, drawerToggler, isContact, isShowWheelPopup } = toRefs(appStore)
const pddStore = usePddStore()

const { showPddBtn } = toRefs(pddStore)

const showGames = ref(false)
const {
  promoList, promoListExcute
} = usePromoList()
const isShowNextDay = ref([])
const isShowluckyDay = ref([])

watch(() => props.show, async() => {
  isShow.value = props.show
  if (isShow.value) {
    await promoListExcute()
    isShowNextDay.value = promoList.value.filter(item => item?.type === 11)
    isShowluckyDay.value = promoList.value.filter(item => item?.type === 12)
  }
  if (!isShow.value)
    showGames.value = isShow.value
})

const selected = ref<number>()

const userStore = useUserStore()

const anchorList = computed(() => {
  let base = [
    {
      name: t('bonusCodes'),
      img: 'bonusCodes',
      type: 10,
    },
    {
      name: 'Telegram',
      img: 'pgTg',
      type: 12,
    },
    {
      name: t('FACEBOOK'),
      img: 'pgFb',
      type: 11,
    },
    {
      name: t('INSTAGRAM'),
      img: 'pgIns',
      type: 11,
    },
    {
      name: t('contactUs'),
      img: 'pgService',
      type: 12,
    }
  ]
  return base
})



const activityList = computed(() => {
  let base = [
    {
      name: t('pddActivity'),
      img: 'pgPdd',
      type: 1,
      isShow: showPddBtn.value
    },
    {
      name: t('wheelActivity'),
      img: 'pgBigWheel',
      type: 2,
      isShow: true
    },
    {
      name: t('luckyDay'),
      img: 'pgLuckDay',
      type: 3,
      isShow: isShowluckyDay.value.length > 0 ? isShowluckyDay.value[0] : false
    },
    {
      name: t('loginInNextDay'),
      img: 'pgNextDay',
      type: 4,
      isShow: isShowNextDay.value.length  > 0 ? isShowNextDay.value[0] : false
    },
    {
      name: t('rechargeActivity'),
      img: 'pgRecharge',
      type: 5,
      isShow: true
    },
    {
      name: t('encodingActivity'),
      img: 'pgCoding',
      type: 6,
      isShow: true
    }
  ]
  return base
})

const hanleAcitivity = (item: activityItem) => {
  console.log(item)
  switch (item.type) {
    case 1:
      router.push('/pinActivities')
      break;
    case 2:
      isShowWheelPopup.value = true
      emit('close')
      break;
    case 3:
      router.push({
        path: '/promo/promo-details',
        query: { activityId: item.isShow.id },
      })
      break;
    case 4:
      router.push({
        path: '/promo/promo-details',
        query: { activityId: item.isShow.value.id },
      })
      break;
    case 5:
      router.push('/rechargeTask')
      break;
    case 6:
      router.push('/dailyTask')
      break;
  }
}

watch([() => userStore.isLogin, () => appStore.isShowWheelPopup], () => {
  if (userStore.isLogin && appStore.isShowWheelPopup)
    getBetAdd()
}, {
  immediate: true,
},
)

//  客服窗口
function onContacts(img?: string) {
  if (img === 'chat') {
    if (appStore.isApp || window.android)
      window.android.tracker('useCustomerService', appStore.configData?.customer_services)
    else if (appStore.isApp && (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.useCustomerService))
      window.webkit.messageHandlers.useCustomerService.postMessage({ url: appStore.configData?.customer_services })

    else
      window.open(appStore.configData?.customer_services, '_blank')
  }
  else if (img === 'pgTg') {
    if (appStore.isApp || window.android)
      window.android.tracker('useTelegram', appStore.configData?.telegram)
    else if (appStore.isApp && (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.useTelegram))
      window.webkit.messageHandlers.useTelegram.postMessage({ url: appStore.configData?.telegram })

    else
      window.open(appStore.configData?.telegram, '_blank')
  }

  //  客服窗口
  if (img === 'pgService') {
    isContact.value = true
    emit('close')
  }
}



function selectTarget(type: number, img?: string) {
  selected.value = type
  drawerToggler.value += 1
  switch (selected.value) {
    case 0:
      router.push('/home')
      drawerTarget.value = 'start'
      break
    case 1:
      router.push('/home')
      drawerTarget.value = 'recent'
      break
    case 2:
      router.push('/all-ranks')
      break
    case 3:
      router.push('/recommend')
      break
    case 4:
      router.push('/dailyTask')
      break
    case 5:
      router.push('/rechargeTask')
      break
    case 7:
      router.push('/cashBack')  
      break
    case 8:
      router.push('/promo?stampTime=' + new Date().getTime())
      break
    case 9:
      isShowCheckIn.value = true
      break
    case 10:
      isShowCode.value = true
      break
    case 11:
      router.push('/pinActivities')
      break
    case 12:
      onContacts(img)
      break
  }

  emit('close')
}


</script>

<template>
  <locker
    v-model:show="appStore.isShowDrawer"
    class="side-drawer-popup"
    :class="{ 'pg-side-drawer-popup': isPgSite,
    'pg-promo-side-drawer-popup': isPgSite && ['/promo'].includes(route.path),
    mini: showTopDrawer && route.name !== 'slot-play' }"
  >
    <template #content>
      <main ref="drawRef" @touchstart.stop="appStore.isShowDrawer = false">
        <main
          class="drawer-wrap"
          @touchstart.stop="() => { }"
        >
          <div class="pg-bg-img vip-banner" @click="selectTarget(2)">
            <img src="/images/drawer/pg1/pgVip/pgVip.png" alt="">
            <span class="pg-bg-text">VIP</span>
          </div>
          <div class="pg-bg-img pg-promo" @click="selectTarget(3)">
            <img src="/images/drawer/pg1/pgPromo/pgPromo-bg1.png" class="pgPromo-bg1" alt="">
            <img src="/images/drawer/pg1/pgPromo/pgPromo-bg.png" class="pgPromo-bg"  alt="">
            <img src="/images/drawer/pg1/pgPromo/pgPromo-heart.png" class="pgPromo-heart" alt="">
            <span class="pg-bg-text">推广</span>
          </div>
          <div class="pg-bg-img pg-game" @click="selectTarget(1)">
            <img src="/images/drawer/pg1/pgGame/pgGame-bg.png" class="pgGame-bg1" alt="">
            <img src="/images/drawer/pg1/pgGame/pgGame-game.png" class="pgGame-game"  alt="">
            <img src="/images/drawer/pg1/pgGame/pgGame-play.png" class="pgGame-play" alt="">
            <span class="pg-bg-text">游戏中心</span>
          </div>
          <div class="pg-bg-img pg-bg-two">
            <div class="pg-rebate"  @click="selectTarget(7)">
              <img src="/images/drawer/pg1/pgRebate/pgRebate-bg.png" class="pgRebate-bg"  alt="">
              <img src="/images/drawer/pg1/pgRebate/pgRebate-bg1.png" class="pgRebate-bg1" alt="">
              <img src="/images/drawer/pg1/pgRebate/pgRebate-icon.png" class="pgRebate-icon" alt="">
              <span class="pg-bg-text">返水</span>
            </div>
            <div class="pg-signin" @click="selectTarget(9)">
              <img src="/images/drawer/pg1/pgSignin/pgSignin-bg.png" class="pgSignin-bg"  alt="">
              <img src="/images/drawer/pg1/pgSignin/pgSignin-bg1.png" class="pgSignin-bg1" alt="">
              <img src="/images/drawer/pg1/pgSignin/pgSignin-day.png" class="pgSignin-day" alt="">
              <span class="pg-bg-text">签到</span>
            </div>
          </div>
          <div class="pg-activity">
            <div class="pg-activity-title">
              <img src="/images/drawer/pg1/pgActivity.png" alt="">
              {{ t('activityCenter') }}
            </div>
            <template  v-for="item in activityList">
              <div class="pg-activity-item" v-if="item.isShow" @click="hanleAcitivity(item)">
                <img :src="`/images/drawer/pg1/${item.img}.png`" alt="">
                <span>{{ item.name }}</span>
              </div>
            </template>
            <div
            class="btn"
            @click="selectTarget(8)"
          >
            {{ t('learnMore') }}
          </div>
          </div>
          <div class="pg-anchors-wrap">
            <div
              v-for="item in anchorList"
              :key="item.name"
              class="anchor"
              :class="{ selected: selected === item.type}"
              @click="selectTarget(item.type, item.img)"
            >
              <img :src="`/images/drawer/pg1/${item.img}.svg`" alt="">
              <span>{{ item.name }}</span>
            </div>
          </div>
        </main>
      </main>
    </template>
  </locker>
</template>

<style lang="less"></style>

<style lang="less">
.side-drawer-popup {
  width: 240px !important;
  /*padding-top: 60px !important;*/
  //width: 100vw!important;
  //transform: translateY(0) !important;
  //position: fixed;
  //left: 0;
  z-index: 340;
  height: calc(100% - 139px) !important;
  background-color: var(--bg-111923);

  &.pg-side-drawer-popup {
    //padding-top: 45px !important;
    height: calc(100% - 104px) !important;
    &.mini {
      height: calc(100% - 149px) !important;
      //padding-top: 91px !important;
    }
  }

  &.pg-promo-side-drawer-popup {
    height: calc(100% - 58px) !important;

    &.mini {
      height: calc(100% - 58px) !important;
    }
  }

  &.mini {
    height: calc(100% - 199px) !important;
    /*padding-top: 124px !important;*/
  }

}

.drawer-wrap {
  padding: 16px;
  width: 100%;
  //background-color: var(--bg-111923);
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  overflow-x: hidden;
  overflow-y: auto;
  position: relative;
  //transition: all .3s;
  user-select: none;
  z-index: 320;

  .pg-bg-img {
    position: relative;
    width: 208px;
    height: 60px;
    margin-bottom: 6px;
    font-family: Montserrat;
    font-size: 20px;
    font-weight: 800;
    line-height: 25.14px;
    text-align: left;
    img {
      width: 100%;
      height: 60px;
    }
    .pg-bg-text {
      position: absolute;
      top: 20px;
      left: 10px;

    }
  }

  .vip-banner {
    font-family: Montserrat;
    font-size: 20px;
    font-weight: 800;
    line-height: 25.14px;
    text-align: left;
   
  }
  .pg-promo {
    .pgPromo-bg1 {
      position: absolute;
    }
    .pgPromo-bg {
      position: absolute;
    }
    .pgPromo-heart {
      position: absolute;
      width: 60px;
      height: 60px;
      right: 2px;
      top:0;
    }
  }

  .pg-game {
    .pgGame-bg1 {
      position: absolute;
    }
    .pgGame-game {
      position: absolute;
      width: 72px;
      right: 0;
    }
    .pgGame-play {
      position: absolute;
      width: 24px;
      height: 24px;
      left: 45%;
      top: 20px;
    }
  }

  .pg-bg-two {
    position: relative;
    display: flex;
    justify-content: center;
    flex-direction:row;
    gap: 10px;
    .pg-bg-text {
      position: absolute;
      top: 20px;
      left: 5px;
    }
    .pg-rebate {
       flex: 1;
       img {
        width: 100px;
       }
      .pgRebate-bg1 {
        position: absolute;
      }
      .pgRebate-bg {
        position: absolute;
      }
      .pgRebate-icon {
        position: absolute;
        width: 50px;
        height: 50px;
        left: 53px;
        top: 5px;
      }
    }
    .pg-signin {
       flex: 1;
       .pg-bg-text {
        position: relative;
       }
       img {
        width: 100px;
       }
      .pgSignin-bg1 {
        position: absolute;
      }
      .pgSignin-bg {
        position: absolute;
      }
      .pgSignin-day {
        position: absolute;
        width: 50px;
        height: 50px;
        right: 0;
        top: 5px;
      }
    }
  }

  .pg-activity {
    background: #1E2531;
    width: 100%;
    border-radius: .5rem;
    padding: 10px 10px;
    .pg-activity-title {
      color: var(--text-white);
      font-size: 18px;
      margin-bottom: 15px;
      img {
        width: 20px;
        height: 20px;
      }
    }
    .pg-activity-item {
      height: 20px;
      line-height: 20px;
      margin: 20px 0;
      font-size: 16px;
      img {
        vertical-align: middle;
        width: 20px;
        height: 20px;
      }
      span {
        vertical-align: middle;
        color: #57647B;
        padding-left: 10px;

      }
    }

    .btn {
      margin-top: 30px;
      background-color: #E51D37;
      width: 184px;
      height: 32px;
      border-radius: 8px;
      text-align: center;
      line-height: 32px;
    }
  }

  .pg-anchors-wrap {
    margin-top: 10px;

    .anchor {
      display: flex;
      align-items: center;
      width: 100%;
      height: 36px;
      padding-left: 12px;
      border: 1px solid #1E2531;
      border-radius: 10px;
      color: var(--text-white);
      cursor: pointer;
      font-size: 16px;
      font-weight: 600;
      line-height: 1.5;
      transition: all .15s;
      white-space: nowrap;
      margin: 10px 0;
      background: #1E2531;
      img {
        width: 16px;
        height: 16px;
        margin-right: 11px;
      }
      &.pagcolegal {
        background: var(--bg-1E2531);
        span {
          color: var(--text-3E4D73, #fff);
        }
      }
    }
  }
}

@keyframes rotate {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(1turn);
  }
}
</style>

<style lang="less">
.lightvcraco {
  .wheel-wrap {
      background: linear-gradient(89.19deg, #9C84FD 1.43%, #FD69FF 44.9%, #7EA2F7 73.97%, #B6B4ED 98.5%) !important;
    }
}

body[data-template="gradient"] {
  .drawer-wrap {
    --text-55657e: white;
    --bg-1E2531: #43377A;
    --text-3E4D73: white;

    //border-radius: 32px !important;
    //background-image: url('/images/drawer/gradient-drawer-bg.png') !important;
    //background-position: top center !important;
    //background-size: 100% 100% !important;
    //background-repeat: no-repeat;
    .pagcolegal {
      background-color: rgba(0,0,0,0.4) !important;
    }
    //.wheel-wrap {
    //  margin-bottom: 0;
    //}

    .item {
      background-color: rgba(0,0,0,0.4) !important;
    }

    .anchors-wrap {
      margin-top: 12px;

      .anchor {
        border-width: 0;
      }

      .selected {
        --border-154fa0: white;
        border-width: 1px;
        background-color: transparent !important;
      }
    }
  }

  &.lightvcraco {
    //  这里做高度设置是因为之前的新亮暗版面下面的tabbar高度和默认的不一样，好pg的也不一样，所以对pg和新的版面重新定义一次高度
    .side-drawer-popup {
      height: calc(100% - 129px) !important;
      background-image: url('/images/drawer/gradient-drawer-bglightvcraco.png') !important;
      background-position: top center !important;
      background-size: 100% 100% !important;
      background-repeat: no-repeat;
      border-radius: 32px !important;
      &.mini {
        height: calc(100% - 189px) !important;
      }
      &.pg-side-drawer-popup {
        height: calc(100% - 103px) !important;
        &.mini {
          height: calc(100% - 149px) !important;
        }
      }
    }
    .drawer-wrap {
      --bg-1E2531: #000;
      //  locker组件需要对外层的样式做背景色和背景图的填充，因为真机的菜单会有一个上下滑动的弹性，只能把背景图和颜色放到顶级才行
      //background-image: url('/images/drawer/gradient-drawer-bglightvcraco.png') !important;
    }
  }
}
</style>
