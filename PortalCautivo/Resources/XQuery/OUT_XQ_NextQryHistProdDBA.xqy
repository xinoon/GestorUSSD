xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_NEXT_QRY_HIST_PROD_PRC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getNextQryHistProdResponse" location="../WSDLs/CaptivePortalService_schema1.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/NEXT_QRY_HIST_PROD_PRC/";
declare namespace ns0 = "http://captive.portal.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/OUT_XQ_NextQryHistProdDBA/";
declare function xf:formatDate($strDate as xs:string ) as xs:string
{
    if (empty($strDate) or fn-bea:trim($strDate) = '')then (
		let $strDate := ''
		return $strDate
	)
	else(
		let $shortStrDate :=  if(string-length($strDate) > 19) then (fn:substring($strDate,0,fn:string-length($strDate)-9)) else ($strDate)
		let $format:= fn:concat(fn-bea:dateTime-to-string-with-format('dd-MM-yyyy',xs:dateTime($shortStrDate)),' ',fn-bea:time-to-string-with-format("HH:mm:ss",xs:time(fn:substring($shortStrDate,12,11))))
		return $format
	)
    
};

declare function xf:OUT_XQ_NextQryHistProdDBA($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:getNextQryHistProdResponse) {
        <ns0:getNextQryHistProdResponse>
            {
                let $SV_PRODUCT_HIST_QT_LIST := $outputParameters1/ns1:SV_PRODUCT_HIST_QT_LIST
                return
                    <listProduct>
                        {
                            for $SV_PRODUCT_HIST_QT_LIST_ITEM in $SV_PRODUCT_HIST_QT_LIST/ns1:SV_PRODUCT_HIST_QT_LIST_ITEM
                            return
                                <itm_product>
                                    <name_product>{data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:NAME_PRODUCT)}</name_product>
                                    <id_prod>{ data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:ID_PROD) }</id_prod>
                                    <id_pcrf_prod>{ data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:ID_PCRF_PROD) }</id_pcrf_prod>
                                    <id_bscs_prod>{ data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:ID_BSCS_PROD) }</id_bscs_prod>
                                    <tariff_prod>{ data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:TARIFF_PROD) }</tariff_prod>
                                    <unit_free>{ data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:UNIT_FREE) }</unit_free>
                                    <promo>{ data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:PROMO)  }</promo>
                                    <category_prod>{ data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:CATEGORY_PROD) }</category_prod>
                                    <date_buy>{xf:formatDate(data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:DATE_BUY))}</date_buy>
                                    <transaction_code_buy>{ data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:TRANSACTION_CODE_BUY) }</transaction_code_buy>
                                    <unsubscribe>{ data($SV_PRODUCT_HIST_QT_LIST_ITEM/ns1:UNSUBSCRIBE) }</unsubscribe>
                                </itm_product>
                        }
                    </listProduct>
            }
            <error_code>{ data($outputParameters1/ns1:SN_COD_RETORNO) }</error_code>
            <err_description>{ data($outputParameters1/ns1:SV_MENS_RETORNO) }</err_description>
        </ns0:getNextQryHistProdResponse>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:OUT_XQ_NextQryHistProdDBA($outputParameters1)