<template>
    <span class="num">
<!--        <a>111 {{ $t("days") }} </a>-->
        <a v-if="tlsInfo.certInfo">{{ tlsInfo.certInfo.daysRemaining }} {{ $t("days") }} </a>
        <a v-else> -- {{ $t("days") }}</a>
    </span>
</template>

<script>
export default {
    props: {
        monitorId: {
            type: Number,
            required: true,
        },
    },
    computed: {
        tlsInfo() {
            /**
             * 设置返回默认值“--”，返回null可能会出现error信息
             * error信息会导致页面停止渲染，后执行的程序获取到数据后，数据并不会渲染到页面上
             */
            return this.$root.tlsInfoList[this.monitorId] ? this.$root.tlsInfoList[this.monitorId] : "--";
        },
        color() {
            if (this.lastHeartBeat.status === 0) {
                return "danger";
            }

            if (this.lastHeartBeat.status === 1) {
                return "primary";
            }

            if (this.lastHeartBeat.status === 2) {
                return "warning";
            }

            return "secondary";
        },

        className() {
            if (this.pill) {
                return `badge rounded-pill bg-${this.color}`;
            }

            return "";
        },
    },
};
</script>


<style lang="scss" scoped>
@import "../assets/vars.scss";

.wrap {
    overflow: hidden;
    width: 100%;
    white-space: nowrap;
}

/*.beat {*/
/*    display: inline-block;*/
/*    background-color: $primary;*/
/*    border-radius: $border-radius;*/
/*}*/

/*&.empty {*/
/*     background-color: aliceblue;*/
/* }*/

/*&.down {*/
/*     background-color: $danger;*/
/* }*/

/*&.pending {*/
/*     background-color: $warning;*/
/* }*/

/*&:not(.empty):hover {*/
/*     transition: all ease-in-out 0.15s;*/
/*     opacity: 0.8;*/
/*     transform: scale(var(--hover-scale));*/
/* }*/
/*}*/
/*}*/

/*.dark{*/
/*    .hp-bar-big .beat.empty {*/
/*    background-color: #848484;*/
/*}*/
/*}*/

</style>
