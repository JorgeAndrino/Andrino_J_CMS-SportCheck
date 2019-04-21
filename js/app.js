// All Components

import ComponentAddProducts from './components/ComponentAddProducts.js';
import ComponentHome from './components/ComponentHome.js';
import ComponentLogin from './components/user/ComponentLogin.js';
import ComponentEditProducts from './components/ComponentEditProducts.js';
import ComponentSoloProduct from './components/ComponentSoloProduct.js';
import ComponentNothingHere from './components/ComponentNothingHere.js';

const routes = [

    { path: '/login', name: "log", component: ComponentLogin },
    { path: '/', name: "home", component: ComponentHome },
    { path: '/product_id:id', name: "solo-product", component: ComponentSoloProduct },
    { path: 'add-product', name:"product-adding", component: ComponentAddProducts },
    { path: 'edit-product-id:id', name:"product-editing", component: ComponentEditProducts },
    { path: "/404*", name: "empty", component: ComponentNothingHere },
    { path: '*', redirect: '/404'}
    
];

const router = new VueRouter({
    routes
});

const router = new Vue({

    data() {

        return {
             requestSearch: '',
             productSearched: []
        }
    },

    methods: {

        searchFilter() {

            this.$router.push("/");
            let that = this;

            Axios.get(`admin/search.php?requestSearch=${this.requestSearch}`)
                .then(function (response) {

                    that.prtoductSearched = response.data;
                    that.$emit('productSearched', that.productSearched);
                })
                .catch(function (error) {
                    console.log(error);
                });
        }
    },

    components: {
    },
    
    routes: router
}).$mount('#app');