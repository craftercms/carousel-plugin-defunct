<#import "/templates/system/common/crafter.ftl" as crafter />

<#if contentModel.includeStyles_b?? && contentModel.includeStyles_b>
  <link rel="stylesheet" href="/static-assets/plugins/org/craftercms/plugin/carousel/css/tiny-slider.min.css" />
  <link rel="stylesheet" href="/static-assets/plugins/org/craftercms/plugin/carousel/css/carousel.css" />
</#if>

<#assign id = (contentModel.elementId_s?has_content)?then(contentModel.elementId_s, 'c' + contentModel.objectId?replace('-', '')) />

<div class="crafter-carousel">
  <@crafter.renderRepeatCollection
    $field="items_o"
    $containerTag="div"
    $containerAttributes={'id': id, 'class':'crafter-carousel'}
    $itemTag="div";
    item, index
  >
    <#if item.link_s?has_content>
      <a href="${item.link_s}" <#if contentModel.newTab_b>target="_blank"</#if>>
    </#if>
    <div
      class="img"
      style="background: url('${item.image_s}') no-repeat center; background-size: cover; height:<#if contentModel.fixedHeight_i??>${contentModel.fixedHeight_i}px<#else>300px</#if>">
    </div>
    <p class="item-text">${item.text_s}</p>
    <#if item.link_s?has_content>
      </a>
    </#if>
  </@crafter.renderRepeatCollection>
</div>

<script>
  if (!window.tns) {
    document.write('<script src="/static-assets/plugins/org/craftercms/plugin/carousel/js/tiny-slider.min.js"><\/script>');
  }
</script>

<script>
  ${contentModel.namespace_s}.${id} = tns({
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
    prevButton: <#if contentModel.previousButton_s?has_content>'${contentModel.previousButton_s}'<#else>false</#if>,
    nextButton: <#if contentModel.nextButton_s?has_content>'${contentModel.nextButton_s}'<#else>false</#if>,
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
    loop: ${contentModel.loop_b?then('true', 'false')},
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
  });

    // Slider methods: https://github.com/ganlanyuan/tiny-slider/tree/v2.9.3#methods
</script>