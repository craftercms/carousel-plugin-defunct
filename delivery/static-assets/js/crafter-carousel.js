/*
 * MIT License
 *
 * Copyright (c) 2018-2021 Crafter Software Corporation. All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

const crafterCarousel = {
  initCarousel: function (namespace, id, isPreview, options, includeStyles) {
    // Validation to include css files
    if (includeStyles && !document.querySelector('#crafterCarouselStyles')) {
      const linkPlugin = document.createElement('link');
      linkPlugin.id = 'crafterCarouselStyles';
      linkPlugin.rel = 'stylesheet';
      linkPlugin.href= '/static-assets/plugins/org/craftercms/plugin/carousel/css/tiny-slider.min.css';

      const linkCrafterCarousel = document.createElement('link');
      linkCrafterCarousel.rel = 'stylesheet';
      linkCrafterCarousel.href= '/static-assets/plugins/org/craftercms/plugin/carousel/css/carousel.css';

      document.body.appendChild(linkPlugin);
      document.body.appendChild(linkCrafterCarousel);
    }

    if (namespace === 'window') {
      window[id] = tns(options);
    } else {
      if (!window[namespace]) {
        window[namespace] = {};
      }
      window[namespace][id] = tns(options);
    }
    // Slider methods: https://github.com/ganlanyuan/tiny-slider/tree/v2.9.3#methods

    if (isPreview && options.autoplay) {
      document.addEventListener('craftercms.editMode', (e) => {
        const isIceOn = e.detail;
        if (namespace === 'window') {
          window[id].destroy();
        } else {
          window[namespace][id].destroy();
        }
        this.initCarousel(namespace, id, isPreview, { ...options, autoplay: !isIceOn }, includeStyles);
      });
    }
  }
};