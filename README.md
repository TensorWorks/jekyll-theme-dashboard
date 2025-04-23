# Dashboard theme for Jekyll

This is a [Jekyll](https://jekyllrb.com/) theme designed primarily for creating dashboards that display large numbers of hyperlinks. It is used at TensorWorks for our internal dashboards.

This theme is designed to be highly configurable, whilst providing sensible defaults for most options in order to make it as easy as possible to get up and running quickly. The configuration mechanisms are largely derived from [jekyll-theme-gitbook](https://github.com/adamrehn/jekyll-theme-gitbook) and should feel familiar to users of that theme. See the [Configuration](#configuration) section for details of the available settings.

**You can view a [live demo of this theme here](https://tensorworks.github.io/jekyll-theme-dashboard-demo) and view the [source code for the demo site here](https://github.com/TensorWorks/jekyll-theme-dashboard-demo).**


## Contents

- [Installation](#installation)
- [Configuration](#configuration)
  - [Theme configuration](#theme-configuration)
  - [Dashboard contents](#dashboard-contents)
  - [Dashboard related links](#dashboard-related-links)
  - [Site structure](#site-structure)
  - [CSS styles](#css-styles)
  - [Hooks](#hooks)
- [Legal](#legal)


## Installation

Add the following line to your site's `Gemfile`:

```ruby
gem "jekyll-theme-dashboard"
```

Also add the following line to your site's `_config.yml` file:

```yaml
theme: "jekyll-theme-dashboard"
```


## Configuration

### Theme configuration

All configuration data for this theme is stored under a top-level YAML key called `theme-settings`, which has the following structure:

```yaml
theme-settings:
  
  
  # Logo settings (OPTIONAL, only needed if you want to override the defaults)
  logo:
    
    # Override the path to the site's logo image (OPTIONAL, defaults to "/assets/images/logo.svg")
    default: "/assets/images/logo.svg"
    
    # Specify an alternative version of the site's logo image to use in dark mode (OPTIONAL, defaults to the light mode logo)
    dark: "/assets/images/logo-dark.svg"
  
  
  # Favicon settings (OPTIONAL, only needed if you want to override the defaults)
  favicon:
    
    # Override the PNG version of the favicon (OPTIONAL, defaults to "/assets/images/favicon.png")
    png: "/path/to/favicon.png"
    
    # Override the SVG version of the favicon (OPTIONAL, defaults to "/assets/images/favicon.svg")
    svg: "/path/to/favicon.svg"
  
  
  # Font Awesome icon settings (OPTIONAL, only needed if you want to override the defaults)
  fontawesome:
    
    # Specify that you are providing Font Awesome through your own CSS (OPTIONAL, defaults to false)
    local: true
    
    # Specify a Font Awesome Kit URL to provide icons (OPTIONAL, defaults to none, takes precedence over "local" if both are specified)
    kit: "https://kit.fontawesome.com/xxxxxxxxxx.js"
```

### Dashboard contents

The theme displays information as a series of grouped cards, which must be specified in `_data/cards.yml` with the following structure:

```yaml
# The top-level element is a list of groups
-
  
  # (OPTIONAL: the title for the box that displays the group of cards, defaults to no title)
  group: "Group Title"
  
  # (OPTIONAL: an icon to display next to the group title, defaults to no icon)
  icon: group.svg
  
  # (OPTIONAL: a dark mode icon to display next to the group title, defaults to the light mode icon)
  icon-dark: group-dark.svg
  
  # (OPTIONAL: the background colour of the box that displays the group of cards, defaults to transparent)
  background: "#ddd"
  
  # (OPTIONAL: the dark mode background colour of the box that displays the group of cards, defaults to transparent)
  background-dark: "#777"
  
  # (OPTIONAL: the text colour of the group title, defaults to "#000")
  text: "#000"
  
  # (OPTIONAL: the dark mode text colour of the group title, defaults to "#fff")
  text-dark: "#fff"
  
  # The list of cards in the group
  cards:
    
    -
      
      # The card title
      name: My Card
      
      # The card type (one of "link-list", "icon-grid" or "custom")
      type: link-list
      
      
      # (ONLY USED WHEN TYPE IS "link-list": the list of links to display on the card)
      links:
        
        -
          
          # The text to display for the link
          name: "Very Helpful Link"
          
          # The URL for the link
          url: "https://some.helpful/website"
          
          # The description for the link
          description: "This is a very helpful link."
          
          # (OPTIONAL: an icon to display for the link, defaults to no icon)
          icon: helpful.svg
          
          # (OPTIONAL: a dark mode icon to display for the link, defaults to the light mode icon)
          icon-dark: helpful-dark.svg
          
          # (OPTIONAL: whether to display the link description by default, defaults to false)
          expanded: false
      
      
      # (ONLY USED WHEN TYPE IS "icon-grid": the list of icons to display on the card)
      icons:
        
        -
          # The name of the link, which is used as the alternate text for the image
          name: "Another Helpful Link"
          
          # The icon to display for the link
          icon: another-helpful.svg
          
          # (OPTIONAL: a dark mode icon to display for the link, defaults to the light mode icon)
          icon-dark: another-helpful-dark.svg
          
          # The URL for the link
          url: "https://another.helpful/website"
      
      
      # (ONLY USED WHEN TYPE IS "custom": the HTML file from the `_include` directory that provides the card body contents)
      include: custom-card-body.html
      
      # (OPTIONAL, AND ONLY USED WHEN TYPE IS "custom": a custom CSS class to add to the card body, defaults to no class)
      body-class: my-custom-class
```

### Dashboard related links

The theme optionally supports displaying a set of related links at the top of the page, which is useful when you have multiple related dashboard sites and want to quickly jump between them. These related links are specified in the optional file `_data/related.yml` with the following structure:

```yaml
# (OPTIONAL: the title for the box that displays the related links, defaults to "Related Dashboards")
title: "Related Dashboards"

# (OPTIONAL: the background colour of the box that displays the related links, defaults to transparent)
background: "#f0f0f0"

# (OPTIONAL: the dark mode background colour of the box that displays the related links, defaults to transparent)
background-dark: "#323232"

# (OPTIONAL: the text colour of the related links, defaults to "#000")
text: "#000"

# (OPTIONAL: the dark mode text colour of the related links, defaults to "#fff")
text-dark: "#fff"

# The list of related links
links:
  
  -
      # The text to display for the link
      name: "Some Other Dashboard"
      
      # The URL for the link
      url: "https://some.other/dashboard"
      
      # (OPTIONAL: an icon to display for the link, defaults to no icon)
      icon: other-dashboard.svg
      
      # (OPTIONAL: a dark mode icon to display for the link, defaults to the light mode icon)
      icon-dark: other-dashboard-dark.svg
```

### Site structure

The intended use case for the theme is a single index page that uses the default layout. The simplest way to implement this is to create a file called `index.html` in the root of your site's filesystem directory with the following contents:

```
---
layout: default
---
```

The theme assumes that all images are stored in `/assets/images/`, and in particular assumes that all icons referenced in `cards.yml` and `related.yml` are stored in `/assets/images/icons/`.

### CSS styles

If you use the theme's default settings then your site is expected to have an `assets/css/style.scss` file with the following contents as a minimum:

```scss
---
---
@import '{{ site.theme }}';
```

You can change the list of CSS files that get included in the site's `<head>` tag by providing your own `_includes/hooks/head-posthook.html` file, as described in the [Hooks](#hooks) section below. Irrespective of whether you use the default CSS filesystem path or a custom list of paths, at least one CSS file will need to include the theme's CSS styles using the code above. You can then add your own CSS rules to augment or override the default theme styles.

### Hooks

In addition to the configuration options discussed in the sections above, you can control the HTML output of your site by using a set of supported include files that the theme refers to as "hooks". The default contents of these hooks are located in the theme's [`_includes/hooks`](https://github.com/TensorWorks/jekyll-theme-dashboard/tree/main/_includes/hooks) subdirectory, and are used throughout the theme's default layout. To replace the contents of a given hook, simply create a file in your site's filesystem directory with the same filename (e.g. `_includes/hooks/head-posthook.html`) and Jekyll will automatically use your version of the file instead of the default version from the theme.

The following hooks are currently supported:

- `head-posthook.html`: included at the end of the site's `<head>` tag. This hook is typically used for providing additional `<meta>` tags, CSS files or Javascript files. The default version of this hook simply includes the CSS file `/assets/css/style.css`.

- `body-prehook.html`: included at the start of the site's `<body>` tag. The default version of this hook is empty.

- `body-posthook.html`: included at the end of the site's `<body>` tag. This hook is typically used for providing additional Javascript files or code. The default version of this hook is empty.


## Legal

Copyright &copy; 2025, TensorWorks Pty Ltd. Licensed under the MIT License, see the file [LICENSE](./LICENSE) for details.

The following third-party libraries are bundled in the theme's source tree and are covered by their respective licenses:

- [Bootstrap](https://getbootstrap.com/) ([MIT License](https://github.com/twbs/bootstrap/blob/main/LICENSE))
- [jQuery](https://jquery.com/) ([MIT License](https://github.com/jquery/jquery/blob/master/LICENSE.txt))
- [Popper](https://popper.js.org/) ([MIT License](https://github.com/floating-ui/floating-ui/blob/v2.x/LICENSE.md))
