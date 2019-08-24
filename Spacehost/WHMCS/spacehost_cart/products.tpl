<link type="text/css" rel="stylesheet" href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/style.css" property="stylesheet" />
<script>
jQuery(document).ready(function () {
    jQuery('#btnShowSidebar').click(function () {
        if (jQuery(".product-selection-sidebar").is(":visible")) {
            jQuery('.row-product-selection').css('left','0');
            jQuery('.product-selection-sidebar').fadeOut();
            jQuery('#btnShowSidebar').html('<i class="fa fa-arrow-circle-right"></i> {$LANG.showMenu}');
        } else {
            jQuery('.product-selection-sidebar').fadeIn();
            jQuery('.row-product-selection').css('left','300px');
            jQuery('#btnShowSidebar').html('<i class="fa fa-arrow-circle-left"></i> {$LANG.hideMenu}');
        }
    });
});
</script>

{if $showSidebarToggle}
    <button type="button" class="btn btn-default btn-sm" id="btnShowSidebar">
        <i class="fa fa-arrow-circle-right"></i>
        {$LANG.showMenu}
    </button>
{/if}

<div id="pricing" class="row row-product-selection">
    <div class="col-xs-3 product-selection-sidebar" id="premiumComparisonSidebar">
        {include file="orderforms/standard_cart/sidebar-categories.tpl"}
    </div>
    <div class="col-xs-12">

        <div id="order-spacehost_cart" class="page-container">
            <div class="txt-center">
                <h3 id="headline">
                    {if $productGroup.headline}
                        {$productGroup.headline}
                    {else}
                        {$productGroup.name}
                    {/if}
                </h3>
                {if $productGroup.tagline}
                    <h5 id="tagline">
                        {$productGroup.tagline}
                    </h5>
                {/if}
                {if $errormessage}
                    <div class="alert alert-danger">
                        {$errormessage}
                    </div>
                {/if}
            </div>
            <div id="products" class="price-table-container">
                <ul id="sub-pricing">
                    {foreach $products as $product}
                        <li id="product{$product@iteration}">
                            <div class="pricing-box{if $product.isFeatured} best-choise{/if}">
                                <div class="pricing-content">
                                    <div id="product{$product@iteration}-name" class="pricing-title">{$product.name}</div>
                                    <div id="product{$product@iteration}-price" class="pricing-price">
                                        {if $product.bid}
                                            {$LANG.bundledeal}
                                            {if $product.displayprice}
                                                {$product.displayPriceSimple}
                                            {/if}
                                        {elseif $product.paytype eq "free"}
                                            {$LANG.orderfree}
                                        {elseif $product.paytype eq "onetime"}
                                            {$product.pricing.onetime} {$LANG.orderpaymenttermonetime}
                                        {else}
                                            {if $product.pricing.hasconfigoptions}
                                                {$LANG.from}
                                            {/if}
                                            {$product.pricing.minprice.cycleText}
                                            <br>
                                            {if $product.pricing.minprice.setupFee}
                                                <small>{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                                            {/if}
                                        {/if}
                                    </div>
                                    <div class="pricing-info">
                                        {if $product.tagLine}
                                            <p id="product{$product@iteration}-tag-line">{$product.tagLine}</p>
                                        {/if}
                                    </div>
                                    <div class="pricing-details">
                                        <ul id="productDescription{$product@iteration}">
                                            {foreach $product.features as $feature => $value}
                                                <li id="product{$product@iteration}-feature{$value@iteration}">
                                                    <span>{$value}</span> {$feature}
                                                </li>
                                            {foreachelse}
                                                <li id="product{$product@iteration}-description">
                                                    {$product.description}
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                </div>
                                <div class="pricing-link">
                                    {if $product.qty eq "0"}
                                        <span id="product{$product@iteration}-unavailable" class="order-button unavailable">
                                            {$LANG.outofstock}
                                        </span>
                                    {else}
                                        <a href="{$smarty.server.PHP_SELF}?a=add&amp;{if $product.bid}bid={$product.bid}{else}pid={$product.pid}{/if}" class="order-link" id="product{$product@iteration}-order-button">
                                            {$LANG.ordernowbutton} <i class="sphst sphst-arrow-down"></i>
                                        </a>
                                    {/if}
                                </div>
                            </div>
                        </li>
                    {/foreach}
                </ul>
            </div>

            {if count($productGroup.features) > 0}
                <div class="includes-features">
                    <div class="row clearfix">
                        <div class="col-md-12">
                            <div class="head-area">
                                <span>
                                    {$LANG.orderForm.includedWithPlans}
                                </span>
                            </div>
                            <ul class="list-features">
                                {foreach $productGroup.features as $features}
                                    <li>{$features.feature}</li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>
                </div>
            {/if}

        </div>
    </div>
</div>
