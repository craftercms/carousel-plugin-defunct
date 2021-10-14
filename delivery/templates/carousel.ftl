<#--
  ~ MIT License
  ~
  ~ Copyright (c) 2018-2021 Crafter Software Corporation. All Rights Reserved.
  ~
  ~ Permission is hereby granted, free of charge, to any person obtaining a copy
  ~ of this software and associated documentation files (the "Software"), to deal
  ~ in the Software without restriction, including without limitation the rights
  ~ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  ~ copies of the Software, and to permit persons to whom the Software is
  ~ furnished to do so, subject to the following conditions:
  ~
  ~ The above copyright notice and this permission notice shall be included in all
  ~ copies or substantial portions of the Software.
  ~
  ~ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  ~ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  ~ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  ~ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  ~ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  ~ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  ~ SOFTWARE.
  -->

<#import "/templates/system/common/crafter.ftl" as crafter />
<#assign id = (contentModel.elementId_s?has_content)?then(contentModel.elementId_s, 'c' + contentModel.objectId?replace('-', '')) />
<#assign carouselHasItems = contentModel.items_o.item?has_content />

<#if carouselHasItems>
    <#if contentModel.fixedHeight_i??>
        <#assign carouselHeight = contentModel.fixedHeight_i/>
    <#else>
        <#assign carouselHeight = 300/>
    </#if>

  <div class="crafter-carousel <#if contentModel.useOverlayControls_b>overlay-controls</#if>">
    <div class="carousel-container" <#if contentModel.useOverlayControls_b>style="height: ${carouselHeight}px"</#if>>
        <@crafter.renderRepeatCollection
        $field="items_o"
        $containerTag="div"
        $containerAttributes={'id': id, 'class':'crafter-carousel'}
        $itemTag="div";
        item, index
        >
          <div style="position: relative;">
              <#if item.link_s?has_content>
            <a href="${item.link_s}" <#if contentModel.newTab_b>target="_blank"</#if>>
                </#if>
                <@crafter.img
                $field="items_o.image_s"
                $index=index
                src="${item.image_s}"
                style="height: ${carouselHeight}px; object-fit: cover; width: 100%"
                />
                <@crafter.p class="slide-text" $field="items_o.text_s" $index=index>${item.text_s}</@crafter.p>
                <#if item.link_s?has_content>
            </a>
              </#if>
          </div>
        </@crafter.renderRepeatCollection>

        <#if contentModel.useOverlayControls_b>
          <button class="crafter-back-button crafter-carousel-control" id="${id}-back">
            <span class="back-button-icon"></span>
          </button>
          <button class="crafter-next-button crafter-carousel-control" id="${id}-next">
            <span class="next-button-icon"></span>
          </button>
        </#if>
    </div>
  </div>
<#elseif modePreview>
  <style>
    .crafter-carousel-no-items {
      display: none;
    }
    .craftercms-ice-on .crafter-carousel-no-items {
      display: flex;
      justify-content: center;
      align-items: center;
      background: #808080;
      color: #fff;
      font-weight: bold;
    }
  </style>

    <#assign noItemsCarouselWidth = contentModel.fixedWidth_i?has_content?then(contentModel.fixedWidth_i + 'px', 'auto') />
    <@crafter.div $field=contentModel.items_o
    class="crafter-carousel-no-items"
    $attrs={
    'style': 'width: ${noItemsCarouselWidth}; height: ${contentModel.fixedHeight_i!300}px;'
    }
    >
      No items have been added to the carousel.
    </@crafter.div>
</#if>

<#if carouselHasItems>
  <script>
    (function () {
      const carouselOptions = {
        container: '#${id}',
        mode: '${contentModel.mode_s}',
        axis: '${contentModel.axis_s}',
        items: ${contentModel.items_i},
        gutter: ${contentModel.gutter_i},
        edgePadding: ${contentModel.edgePadding_i},
        fixedWidth: <#if contentModel.fixedWidth_i??>${contentModel.fixedWidth_i}<#else>false</#if>,
        autoWidth: ${contentModel.autoWidth_b?then('true', 'false')},
        viewportMax: <#if contentModel.viewportMax_i??>${contentModel.viewportMax_i}<#else>false</#if>,
        slideBy: <#if contentModel.slideByPage_b>'page'<#else>${contentModel.slideBy_i}</#if>,
        center: ${contentModel.center_b?then('true', 'false')},
        controls: ${contentModel.controls_b?then('true', 'false')},
        controlsPosition: '${contentModel.controlsPosition_s}',
        controlsText: ['${contentModel.previousControlText_s}', '${contentModel.nextControlText_s}'],
        controlsContainer: <#if contentModel.controlsContainer_s?has_content>'${contentModel.controlsContainer_s}'<#else>false</#if>,
        prevButton: <#if contentModel.useOverlayControls_b>'#${id}-back'<#else>false</#if>,
        nextButton: <#if contentModel.useOverlayControls_b>'#${id}-next'<#else>false</#if>,
        nav: ${contentModel.navComponents_b?then('true', 'false')},
        navPosition: '${contentModel.navPosition_s}',
        navContainer: <#if contentModel.navContainer_s?has_content>'${contentModel.navContainer_s}'<#else>false</#if>,
        navAsThumbnails: ${contentModel.navAsThumbnails_b?then('true', 'false')},
        arrowKeys: ${contentModel.arrowKeys_b?then('true', 'false')},
        speed: ${contentModel.speed_i},
        autoplay: ${contentModel.autoplay_b?then('true', 'false')},
        autoplayPosition: '${contentModel.autoplayPosition_s}',
        autoplayTimeout: ${contentModel.autoplayTimeout_i?string.computer},
        autoplayDirection: '${contentModel.autoplayDirection_s}',
        autoplayText: ['${contentModel.autoplayStartText_s}', '${contentModel.autoplayStopText_s}'],
        autoplayHoverPause: ${contentModel.autoplayHoverPause_b?then('true', 'false')},
        autoplayButton: <#if contentModel.autoplayButton_s?has_content>'${contentModel.autoplayButton_s}'<#else>false</#if>,
        autoplayButtonOutput: ${contentModel.autoplayButtonOutput_b?then('true', 'false')},
        autoplayResetOnVisibility: ${contentModel.autoplayResetOnVisibility_b?then('true', 'false')},
        animateIn: '${contentModel.animateIn_s}',
        animateOut: '${contentModel.animateOut_s}',
        animateNormal: '${contentModel.animateNormal_s}',
        animateDelay: <#if contentModel.animateDelay_i??>${contentModel.animateDelay_i}<#else>false</#if>,
        loop: false,
        rewind: ${contentModel.rewind_b?then('true', 'false')},
        autoHeight: ${contentModel.autoHeight_b?then('true', 'false')},
        responsive: <#if contentModel.responsive_t?has_content>${contentModel.responsive_t}<#else>false</#if>,
        touch: ${contentModel.touch_b?then('true', 'false')},
        mouseDrag: ${contentModel.mouseDrag_b?then('true', 'false')},
        swipeAngle: ${contentModel.swipeAngle_i},
        preventActionWhenRunning: ${contentModel.preventActionWhenRunning_b?then('true', 'false')},
        preventScrollOnTouch: <#if contentModel.preventScrollOnTouch_s == 'false'>false<#else>'${contentModel.preventScrollOnTouch_s}'</#if>,
        nested: false,
        freezable: ${contentModel.freezable_b?then('true', 'false')},
        startIndex: ${contentModel.startIndex_i},
        onInit: false,
        useLocalStorage: ${contentModel.useLocalStorage_b?then('true', 'false')},
        nonce: false
      };
      crafterCarousel.initCarousel('${contentModel.namespace_s}', '${id}', <#if modePreview>true<#else>false</#if>, carouselOptions, <#if contentModel.includeStyles_b>true<#else>false</#if>);
    }());
  </script>
</#if>