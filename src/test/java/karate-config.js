function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }


  var config = {
    env: env,
    app_url: 'https://app.commodityx.io/auth/login?redirect=%2Fdashboard',
    username: '',
    password: ''
  }
  if (env == 'dev') {
    config.app_url = 'http://localhost:4200/'
    config.username = "maheshglm@gmail.com"
    config.password = "12345678"
  } else if (env == 'sit') {
    config.app_url = 'https://app.commodityx.io/auth/login?redirect=%2Fdashboard'
  }
  return config;
}