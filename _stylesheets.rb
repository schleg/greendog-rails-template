# Set up custom stylesheet defaults

puts "Creating default stylesheets ...".magenta

remove_file 'app/stylesheets/partials/_example.sass'
gsub_file 'app/stylesheets/style.sass', %r{//@include html5-boilerplate;}, '@include html5-boilerplate'
gsub_file 'app/stylesheets/style.sass', %r{@import partials/example}, '//@import partials/example'

remove_file 'app/stylesheets/partials/_page.sass'
file 'app/stylesheets/partials/_page.sass', <<-SASS.gsub(/^ {2}/, '')
  @import compass/css3

  //-----------------------------------
  // Basic Styles
  //-----------------------------------

  h1, h2, h3, h4, h5, h6
    font-weight: normal

  h1
    +font-size(24px)

  h2
    +font-size(20px)

  h3
    +font-size(18px)

  h4
    +font-size(15px)

  strong, th
    font-weight: bold

  small
    // Use font-size mixin to convert to percentage for YUI
    // http://developer.yahoo.com/yui/3/cssfonts/#fontsize
    // approx 85% when base-font-size eq 13px
    +font-size(11px)

  // Add the 'required' attribute on inputs if you want to use these
  input:valid, textarea:valid

  input:invalid, textarea:invalid
    +border-radius(1px)
    +box-shadow(red, 0, 0, 5px, 0)

  .no-boxshadow input:invalid,
  .no-boxshadow textarea:invalid
    background-color: #f0dddd

  //-----------------------------------
  // HTML5 Boilerplate + http://www.1kbgrid.com/ Grid Layout
  //-----------------------------------

  body
    background-color: white

  div#container

  header#header
    background-color: #cdd9e2
    border-bottom: 1px solid #4f708b
    color: #444
    padding: 15px 0
    .title
      +col(9)
      h1
        +font-size(32px)
    .logo
      +col(3)

  nav#nav
    background-color: #7599b9
    border-top: 1px solid #87abc8
    border-bottom: 1px solid #e0e8f0
    color: #fff
    padding: 10px 0
    .menu
      +col(9)
    .search
      +col(3)
      text-align: right

  div#main
    background-color: white
    color: #444
    border-top: 1px solid #c0d0e0
    padding: 15px 0
    div.content
      +col(12)
    div.main
      +col(9)
    div.aside
      +col(3)

  footer#footer
    border-top: 1px solid #c2c9cf
    border-bottom: 1px solid #c2c9cf
    background-color: #d0d9e0
    color: #333
    padding: 20px 0
    .copyright
      +col(2)
      +prepend(10)
      p
        +font-size(10px)
  
  //-----------------------------------
  // Custom Application Styles
  //-----------------------------------

SASS

append_file 'app/stylesheets/style.sass', "@import partials/buttons\n"
file 'app/stylesheets/partials/_buttons.sass', <<-SASS.gsub(/^ {2}/, '')
  // Fancy buttons from http://www.webdesignerwall.com/tutorials/css3-gradient-buttons/

  .buttons
    margin: 1em 0
    button,a.button
      display: inline-block
      vertical-align: baseline
      margin: 0 2px
      outline: none
      cursor: pointer
      text-align: center
      text-decoration: none
      font: 13px/100% Arial, Helvetica, sans-serif
      font-weight: bold
      padding: .4em 1.5em .42em
      text-shadow: 0 1px 1px rgba(0,0,0,.3)
      -webkit-border-radius: 1em
      -moz-border-radius: 1em
      border-radius: 1em
      -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2)
      -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2)
      box-shadow: 0 1px 2px rgba(0,0,0,.2)
      &:hover
        text-decoration: none
      &:active
        position: relative
        top: 1px

    .bigrounded
      -webkit-border-radius: 2em
      -moz-border-radius: 2em
      border-radius: 2em
    .large
      font-size: 14px
      padding: .5em 2em .55em
    .medium
      font-size: 12px
      padding: .4em 1.5em .42em
    .small
      font-size: 11px
      padding: .2em 1em .275em

    /* gray

    .neutral
      color: #e9e9e9
      border: solid 1px #555
      background: #6e6e6e
      background: -webkit-gradient(linear, left top, left bottom, from(#888888), to(#575757))
      background: -moz-linear-gradient(top, #888888, #575757)
      filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#888888', endColorstr='#575757')
      &:hover
        background: #616161
        background: -webkit-gradient(linear, left top, left bottom, from(#757575), to(#4b4b4b))
        background: -moz-linear-gradient(top, #757575, #4b4b4b)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#757575', endColorstr='#4b4b4b')
      &:active
        color: #afafaf
        background: -webkit-gradient(linear, left top, left bottom, from(#575757), to(#888888))
        background: -moz-linear-gradient(top, #575757, #888888)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#575757', endColorstr='#888888')

    /* white

    .white
      color: #606060
      border: solid 1px #b7b7b7
      background: #fff
      background: -webkit-gradient(linear, left top, left bottom, from(white), to(#ededed))
      background: -moz-linear-gradient(top, white, #ededed)
      filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed')
      &:hover
        background: #ededed
        background: -webkit-gradient(linear, left top, left bottom, from(white), to(#dcdcdc))
        background: -moz-linear-gradient(top, white, #dcdcdc)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#dcdcdc')
      &:active
        color: #999
        background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(white))
        background: -moz-linear-gradient(top, #ededed, white)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#ffffff')

    /* blue

    .normal
      color: #d9eef7
      border: solid 1px #0076a3
      background: #0095cd
      background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5))
      background: -moz-linear-gradient(top, #00adee, #0078a5)
      filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5')
      &:hover
        background: #007ead
        background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e))
        background: -moz-linear-gradient(top, #0095cc, #00678e)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e')
      &:active
        color: #80bed6
        background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee))
        background: -moz-linear-gradient(top, #0078a5, #00adee)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee')

    /* rosy

    .warning
      color: #fae7e9
      border: solid 1px #b73948
      background: #da5867
      background: -webkit-gradient(linear, left top, left bottom, from(#f16c7c), to(#bf404f))
      background: -moz-linear-gradient(top, #f16c7c, #bf404f)
      filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f16c7c', endColorstr='#bf404f')
      &:hover
        background: #ba4b58
        background: -webkit-gradient(linear, left top, left bottom, from(#cf5d6a), to(#a53845))
        background: -moz-linear-gradient(top, #cf5d6a, #a53845)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#cf5d6a', endColorstr='#a53845')
      &:active
        color: #dca4ab
        background: -webkit-gradient(linear, left top, left bottom, from(#bf404f), to(#f16c7c))
        background: -moz-linear-gradient(top, #bf404f, #f16c7c)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#bf404f', endColorstr='#f16c7c')

    /* green

    .positive
      color: #e8f0de
      border: solid 1px #538312
      background: #64991e
      background: -webkit-gradient(linear, left top, left bottom, from(#7db72f), to(#4e7d0e))
      background: -moz-linear-gradient(top, #7db72f, #4e7d0e)
      filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#7db72f', endColorstr='#4e7d0e')
      &:hover
        background: #538018
        background: -webkit-gradient(linear, left top, left bottom, from(#6b9d28), to(#436b0c))
        background: -moz-linear-gradient(top, #6b9d28, #436b0c)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#6b9d28', endColorstr='#436b0c')
      &:active
        color: #a9c08c
        background: -webkit-gradient(linear, left top, left bottom, from(#4e7d0e), to(#7db72f))
        background: -moz-linear-gradient(top, #4e7d0e, #7db72f)
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4e7d0e', endColorstr='#7db72f')
SASS


append_file 'app/stylesheets/style.sass', "@import partials/flashes\n"
file 'app/stylesheets/partials/_flashes.sass', <<-SASS.gsub(/^ {2}/, '')
  //
  // Fancy boxes for Rails flash messages
  //

  !flash_light_blue = #bde5f8
  !flash_dark_blue = #00529b
  !flash_light_red = #ffbaba
  !flash_dark_red = #d8000c

  .flash_notice, .flash_alert
    border: 1px solid
    margin-bottom: 15px
    margin-top: 10px
    padding: 15px 10px 15px 25px
    background-repeat: no-repeat
    background-position: 100px center
    font-size: $size_big1
    +border_radius(5px)
    +box_shadow(#666, 0 1px 4px)
    +clearfix

  .flash_notice
    color: $flash_dark_blue - #333
    border-color: $flash_dark_blue
    background-color: $flash_light_blue
    +box_gradient($flash_light_blue + #111, $flash_light_blue - #111)

  .flash_alert
    color: $flash_dark_red - #333
    border-color: $flash_dark_red
    background-color: $flash_light_red
    +box_gradient($flash_light_red + #111, $flash_light_red - #111)
SASS


append_file 'app/stylesheets/style.sass', "@import partials/forms\n"
file 'app/stylesheets/partials/_forms.sass', <<-SASS.gsub(/^ {2}/, '')
SASS

append_file 'app/stylesheets/style.sass', "@import partials/tables\n"
file 'app/stylesheets/partials/_tables.sass', <<-SASS.gsub(/^ {2}/, '')
SASS
