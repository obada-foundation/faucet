<template>
  <v-app class="vappbackground">
    <div id="header">
      <div class="flex_contheader">
        <div class="statusheaderleft">
          <img class="mainimglogo" src="../assets/img/obada-logo-light-gradient.svg" alt="logo"/>
        </div>
        <h1 class="testnetheader">Testnet Faucet</h1>
        <div class="statusheader">
          <div class="desktopstatusdiv">
            <v-select
                class="select_chain mr-3"
                v-model="selected"
                :items="items"
                outlined
                label="Chain ID"
            ></v-select>
            <div class="faucetcompstatus">
              <h4 style="font-weight:300">Faucet Status:
                <span class="statustextcol">
                  <span style="margin-right:3px;">{{ faucet_status }}</span>
                <v-tooltip
                  top
                >
                <template v-slot:activator="{ on, attrs }">
                  <v-icon
                    v-bind="attrs"
                    v-on="on"
                    small
                    :color="faucet_status_color"
                    >
                    mdi-circle
                  </v-icon>
                </template>
                <span>{{ faucet_status }}</span>
                </v-tooltip>
                </span>
              </h4>
            </div>
          </div>
          <!--  -->
          <div class="mobilestatusdiv">
            <template>
              <div class="text-center">
                <v-dialog
                  v-model="dialog"
                  width="auto"
                >
                  <template v-slot:activator="{ on, attrs }">
                    <v-btn
                      icon
                      color="white"
                      v-bind="attrs"
                      v-on="on"
                    >
                      <v-icon>mdi-information-outline</v-icon>
                    </v-btn>
                  </template>

                  <v-card>
                    <v-card-title class="text-h5 lighten-2">
                    </v-card-title>

                    <v-card-text class="mt-2">
                      <div class="faucetcompstatus">
                        <v-select
                            class="select_chain mr-3"
                            v-model="selected"
                            :items="items"
                            outlined
                            label="Chain ID"
                        ></v-select>
                        <h4 style="font-weight:300">Faucet Status:
                          <span class="statustextcol">
                            <span style="margin-right:3px;">{{ faucet_status }}</span>
                          <v-tooltip
                            top
                          >
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              v-bind="attrs"
                              v-on="on"
                              small
                              color=""
                              >
                              mdi-circle
                            </v-icon>
                          </template>
                          <span>{{ faucet_status }}</span>
                          </v-tooltip>
                          </span>
                        </h4>
                      </div>
                    </v-card-text>

                    <v-divider></v-divider>

                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn
                        color="primary"
                        text
                        @click="dialog = false"
                      >
                        OK
                      </v-btn>
                    </v-card-actions>
                  </v-card>
                </v-dialog>
              </div>
            </template>
          </div>
          <!--  -->
        </div>
      </div>
    </div>
    <v-main>
      <v-container class="maincontainer">
        <Nuxt />
      </v-container>
    </v-main>
    <v-footer
      class="pagefooter"
      relative
    >
      <div class="social-links">
        <a href="https://www.linkedin.com/company/obada" class="social-links__icon" target="_blank"><span class="social-links__icon"><svg version="1.0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" aria-labelledby="linkedin-in3" role="img"><title id="linkedin-in3">Follow us on LinkedIn</title><g id="linkedin-in3_layer"><path d="M100.3 480H7.4V180.9h92.9V480zM53.8 140.1C24.1 140.1 0 115.5 0 85.8 0 56.1 24.1 32 53.8 32c29.7 0 53.8 24.1 53.8 53.8 0 29.7-24.1 54.3-53.8 54.3zM448 480h-92.7V334.4c0-34.7-.7-79.2-48.3-79.2-48.3 0-55.7 37.7-55.7 76.7V480h-92.8V180.9h89.1v40.8h1.3c12.4-23.5 42.7-48.3 87.9-48.3 94 0 111.3 61.9 111.3 142.3V480z"></path></g></svg></span></a>
        <a href="https://github.com/obada-foundation" class="social-links__icon" target="_blank"><span class="social-links__icon"><svg version="1.0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 480 512" aria-labelledby="github-alt4" role="img"><title id="github-alt4">Follow us on Facebook</title><g id="github-alt4_layer"><path d="M186.1 328.7c0 20.9-10.9 55.1-36.7 55.1s-36.7-34.2-36.7-55.1 10.9-55.1 36.7-55.1 36.7 34.2 36.7 55.1zM480 278.2c0 31.9-3.2 65.7-17.5 95-37.9 76.6-142.1 74.8-216.7 74.8-75.8 0-186.2 2.7-225.6-74.8-14.6-29-20.2-63.1-20.2-95 0-41.9 13.9-81.5 41.5-113.6-5.2-15.8-7.7-32.4-7.7-48.8 0-21.5 4.9-32.3 14.6-51.8 45.3 0 74.3 9 108.8 36 29-6.9 58.8-10 88.7-10 27 0 54.2 2.9 80.4 9.2 34-26.7 63-35.2 107.8-35.2 9.8 19.5 14.6 30.3 14.6 51.8 0 16.4-2.6 32.7-7.7 48.2 27.5 32.4 39 72.3 39 114.2zm-64.3 50.5c0-43.9-26.7-82.6-73.5-82.6-18.9 0-37 3.4-56 6-14.9 2.3-29.8 3.2-45.1 3.2-15.2 0-30.1-.9-45.1-3.2-18.7-2.6-37-6-56-6-46.8 0-73.5 38.7-73.5 82.6 0 87.8 80.4 101.3 150.4 101.3h48.2c70.3 0 150.6-13.4 150.6-101.3zm-82.6-55.1c-25.8 0-36.7 34.2-36.7 55.1s10.9 55.1 36.7 55.1 36.7-34.2 36.7-55.1-10.9-55.1-36.7-55.1z"></path></g></svg></span></a>
      </div>
      <p style="text-align: center; font-size: 18px;">&copy; {{ new Date().getFullYear() }} OBADA - The network for digital assets | <a href="https://www.obada.io" rel="noopener" target="_blank">Privacy policy</a></p>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  name: 'DefaultLayout',
  data () {
    return {
      fixed: false,
      title: 'OBADA Testnet faucet',
      faucet_status: '',
      faucet_status_color: 'green',
      items: ['obada-testnet'],
      selected: 'obada-testnet',
      dialog: false
    }
  },

  async mounted () {
    await this.handle_interval(this.handle_faucet_status(), 30000)
  },
  methods: {
    async handle_faucet_status () {
      try {
        const status = await this.$axios.head(
          this.$config.faucetServer,
        )
        
        this.faucet_status_color = 'green'
        this.faucet_status = 'Operational'
        return
      } catch (error) {
        console.error(error)
        this.faucet_status_color = 'red'
        this.faucet_status = 'Down'
        return
      }
    },

    async handle_interval (promise, interval) {
      while(true) {
        await new Promise(resolve => setTimeout(resolve, interval))
        await promise
      }
    },
  }
}
</script>
<style scoped>
  .vappbackground {
    background: url('../assets/img/bg.jpg');
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    font-family: 'Nunito', sans-serif;
  }
  .maincontainer {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    padding-top: 50px;
    padding-bottom: 50px;
  }
  .statustextcol {
    display: inline-flex;
    align-items:center;
  }
  .statustextcol i {
    margin-top: -1px;
  }
  /*  */
  #header {
    /* position: sticky;
    top:0; */
    width: 100%;
    display: block;
    background: rgba(48,48,48,0.8);
    padding:20px 0 10px 0;
    z-index: 100;
  }
  .flex_contheader {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width:100%;
  }
  .statusheader {
    padding-right: 15px;
    width: 250px;
  }
  .statusheaderleft {
    width: 250px;
  }
  .mainimglogo {
    width:150px;
    display: block;
    padding-left: 15px;
  }
  /*  */
  .pagefooter {
    width: 100%;
    display: block;
    background: rgba(48,48,48,0.8);
  }
  .social-links {
    width: 100%;
    align-items: center;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
  }
  .social-links__icon {
      background-color: transparent;
      border-radius: 4px;
      display: inline-block;
      margin: 0 0.7rem 0.35rem 0;
      padding: 0.7rem 0.7rem 0.2rem 0.7rem;
      cursor: pointer;
  }
  .social-links svg {
    fill: rgba(255, 255, 255,1.0);
    width: 40px;
    height: 40px;
    transition:fill 0.2s ease-in-out ;
  }
  .social-links svg:hover {
    fill: #FE5000;
  }
  .sociallinks {
      font-weight: 300;
      text-decoration: underline;
      font-family: Nunito,sans-serif;
      font-style: normal;
      color: #00c6ab;
  }
  .select_chain {
    max-width: 225px;
  }
  .faucetcompstatus {
    margin-top: -15px;
  }
  .mobilestatusdiv {
    display: none;
  }
  @media only screen and (max-width: 992px) {
    .social-links svg {
      width: 30px;
      height: 30px;
    }
    .mainimglogo{
      width: 120px;
      margin: 0 auto;
    }
    .statusheader {
      width: auto;
    }
    .statusheaderleft {
      width: auto;
    }
    .desktopstatusdiv {
      display: none;
    }
    .mobilestatusdiv {
      display: block;
      width:100px;
    }
  }
  @media only screen and (max-width: 756px) {
    .mainimglogo{
      width: 100px;
      margin: 0 auto;
    }
    .testnetheader {
      font-size: 30px;
    }
    .mobilestatusdiv {
      display: block;
    }
   }
  @media only screen and (max-width: 576px) {
    .mobilestatusdiv {
      display:block;
      width:60px;
    }
    .mainimglogo{
      width: 80px;
      margin: 0;
    }
    .testnetheader {
      font-size: 24px;
    }
    .bgdarkopacity {
      width: 100%;
      min-width: auto;
    }
    .social-links__icon {
      margin:0;
    }
  }
  @media only screen and (max-width: 480px) {
    .social-links__icon {
      padding: 0.7rem 0.4rem 0.2rem 0.4rem;
    }
    .mobilestatusdiv {
      display: block;
    }
  }
</style>
