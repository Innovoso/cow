Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login', { path: '/' }
  @route 'chat', { layoutTemplate: 'layout_with_nav' }
