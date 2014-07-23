Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login', { path: '/' }
  @route 'chat', { layoutTemplate: 'layout_with_nav' }
  @route 'event', { path: '/events', layoutTemplate: 'layout_with_nav' }
