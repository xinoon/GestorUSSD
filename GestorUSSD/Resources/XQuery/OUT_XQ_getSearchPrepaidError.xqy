xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$searchBalancesICC_response1" element="ns0:searchBalancesICC-response" location="../../../PrepaidWave/Resources/WSDL/serviceSearchPrepagoICC-response.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns1 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_getSearchPrepaidError/";

declare function xf:OUT_XQ_getSearchPrepaidError($searchBalancesICC_response1 as element(ns0:searchBalancesICC-response))
    as element(ns1:ussdOperacionResponse) {
        <ns1:ussdOperacionResponse>
            {
                for $error_code in $searchBalancesICC_response1/ns0:error_code
                return
                    <errorCode>{ $error_code/text() }</errorCode>
            }
            {
                for $err_description in $searchBalancesICC_response1/ns0:err_description
                return
                    <errorDescription>{ $err_description/text() }</errorDescription>
            }
        </ns1:ussdOperacionResponse>
};

declare variable $searchBalancesICC_response1 as element(ns0:searchBalancesICC-response) external;

xf:OUT_XQ_getSearchPrepaidError($searchBalancesICC_response1)