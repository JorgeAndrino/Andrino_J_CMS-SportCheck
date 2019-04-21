import Axios from "axios";

export default {

    name: 'product',

    template:

    `

        <div v-if="product">

            <img v-bind:src="price" v-if="product.product_img" v-bind:alt= "product.product_name">

            <h2>{{product.product_name}}</h2>

            <p>{{product.product_price}}</p>
            
            <p>{{product.product_desc}}</p>

            <router-link v-bind:to="'edit-product_id' + product.product_id" v-bind:key="product.product_id" v-if="authenticated"><button>Edit Product</button></router-link>
            
            <button v-on:click="productErase">Delete Product</button>

        </div>
    `,

    data() {

        return {

            authenticated: false,
            product: ''
        }
    },

    methods: {

        getSoloData() {

            let that = this;

            axios.get(`admin/fetch_solo.php?product_id=${this.$route.params.id}`)

                .them(function (response) {

                    that.product = response.data[0];
                })

                .catch(function (error) {
                    
                    console.log(error);
                });
        },

        sessionCheck() {

            let that = this;

            let sessionData = new FormData();

            sessionData.append("user_id", storageLock.getItem('current_user_id'));

            sessionData.append("user_token", storageLock,getItem('user_token'));

            axios({

                method: 'post',
                url: 'admin/user/session.php',
                data: seesionData
            })

            .then(function (response) {

                if(response.data) {

                    that.authenticated = true;
                } else {

                    storageLock.clear();
                }
            })

            .catch(function (error) {

                console.log(error);
            });
        },

        productErase() {

            let that = this;

            let eraseQuery = new FormData();

            eraseQuery.append("product_id", this.product.product_id);

            axios({

                method: 'post',
                url: 'admin/products_delete.php',
                data: eraseQuery
            })
            
            .then(function (response) {

                that.$router.push("/");
            })

            .catch(function (error) {

                console.log(error);
            });
        }

    },

    mounted() {
        this.getSoloData();

        if(storageLock.getItem('current_user_id') && storageLock.getItem('user_token')) {

            this. sessionCheck();
        }

    }

}