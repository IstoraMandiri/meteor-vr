AccountsEntry.config
  dashboardRoute: '/'
  homeRoute: '/'

Router.route '/',
  template: 'world'
  onBeforeAction: ->
    AccountsEntry.signInRequired @