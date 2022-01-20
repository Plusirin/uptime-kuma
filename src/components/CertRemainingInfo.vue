<template>
    <span class="num">
<!--        <a>111 {{ $t("days") }} </a>-->
        <a >{{ tlsInfo.certInfo.daysRemaining }} {{ $t("days") }} </a>
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
            // Add: this.$root.tlsInfoList[this.monitor.id].certInfo
            // Fix: TypeError: Cannot read properties of undefined (reading 'validTo')
            // Reason: TLS Info object format is changed in 1.8.0, if for some reason, it cannot connect to the site after update to 1.8.0, the object is still in the old format.
            // eslint-disable-next-line no-debugger
            
            if (this.$root.tlsInfoList[this.monitorId] && this.$root.tlsInfoList[this.monitorId].certInfo) {
                console.log(this.$root.tlsInfoList[this.monitorId])
                return this.$root.tlsInfoList[this.monitorId];
            }
            
            return null
        },
        // tlsInfo() {
        //     // Add: this.$root.tlsInfoList[this.monitor.id].certInfo
        //     // Fix: TypeError: Cannot read properties of undefined (reading 'validTo')
        //     // Reason: TLS Info object format is changed in 1.8.0, if for some reason, it cannot connect to the site after update to 1.8.0, the object is still in the old format.
        //     if (this.$root.tlsInfoList[this.monitorId] && this.$root.tlsInfoList[this.monitorId].certInfo) {
        //         return this.$root.tlsInfoList[this.monitorId];
        //     }
        //     // console.log("monitorId"+monitorId);
        //     console.log("this.monitorId"+this.monitorId);
        //     // console.log(this.$root.tlsInfoList[monitorId]);
        //     console.log(this.$root.tlsInfoList[this.monitorId]);
        //     return null;
        // },

        color() {
            if (this.lastHeartBeat.status === 0) {
                return "danger"
            }

            if (this.lastHeartBeat.status === 1) {
                return "primary"
            }

            if (this.lastHeartBeat.status === 2) {
                return "warning"
            }

            return "secondary"
        },

        className() {
            if (this.pill) {
                return `badge rounded-pill bg-${this.color}`;
            }

            return "";
        },
    },
}
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
