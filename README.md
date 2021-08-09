# Carousel Plugin for Crafter CMS

This is a highly configurable carousel plugin based on [Tiny Slider](https://github.com/ganlanyuan/tiny-slider/tree/v2.9.3).

# Installation

The plugin can be installed to your site from the Crafter CMS Marketplace.

# Setup

After the plugin has been installed you can add a carousel to any page or component of your site using the `Carousel` content-type.

# Configuration

Every carousel can be configured with the following properties:

- Items: The list of slides in the carousel. Each item has the following properties:

    - Image: The image to be shown in the slide.
    - Text: Slide text.
    - Link: This field can be filled to allow the slide to be a link.
    
- Open Links in New Tab: If selected, slide links will open in a new tab.
- Include Styles: Include/exclude styles bundled with the plugin.

- Options: All of the carousel options can be reviewed in [here](https://github.com/ganlanyuan/tiny-slider/tree/v2.9.3#options).

- Advanced Options: 
    
    - Namespace: Namespace to be used to store the slider object once it's initialized. Default to 'window'.
    - Element Id: Id to be used as the slider object name. If empty, a unique id will be set as the value.
    - Responsive: Defines options for different viewport widths. For more information, check in [here](https://github.com/ganlanyuan/tiny-slider/tree/v2.9.3#responsive-options).
