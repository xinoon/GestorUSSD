xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getOffersResponse1" element="ns0:getOffersResponse" location="../WSDL/CONT.0010013.WOM.NEG.CampaignFunnelManagement.CampaignManagementService_2.0.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://cm.mobilytix.comviva.com";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_GetOfferUssd/";

declare function xf:OUT_XQ_GetOfferUssd($getOffersResponse1 as element(ns0:getOffersResponse))
    as element(ns1:ussdOperacionResponse) {
        <ns1:ussdOperacionResponse>
            <segmento>
                {
                    if (not(empty($getOffersResponse1/ns0:getOffersReturn/ns0:offers[1]/ns0:offerID/text()))) then
                        ($getOffersResponse1/ns0:getOffersReturn/ns0:offers[1]/ns0:offerID/text())
                    else 
                        ()
                }
            </segmento>
            <errorCode>{ data($getOffersResponse1/ns0:getOffersReturn/ns0:statusCode) }</errorCode>
            <errorDescription>{ if (not(empty($getOffersResponse1/ns0:getOffersReturn/ns0:offers[1]/ns0:offerShortName/text())) and $getOffersResponse1/ns0:getOffersReturn/ns0:statusCode/text() = '0' ) then
            						($getOffersResponse1/ns0:getOffersReturn/ns0:offers[1]/ns0:offerShortName/text())
                    else 
                        ($getOffersResponse1/ns0:getOffersReturn/ns0:statusMessage/text()) }
            </errorDescription>
        </ns1:ussdOperacionResponse>
};

declare variable $getOffersResponse1 as element(ns0:getOffersResponse) external;

xf:OUT_XQ_GetOfferUssd($getOffersResponse1)