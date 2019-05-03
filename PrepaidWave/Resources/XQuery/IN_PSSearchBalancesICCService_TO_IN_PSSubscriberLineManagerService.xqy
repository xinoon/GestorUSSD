xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$searchBalancesICC_request1" element="ns1:searchBalancesICC-request" location="../WSDL/serviceSearchPrepagoICC-request.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getAllInformation" location="../../../Alcatel-HighLevelApiWS/SubscriberLineManager/Resources/WSDL/subscriberLineManager.xsd" ::)

declare namespace ns1 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";
declare namespace ns0 = "http://implementation.web.api.icc.services.osp.in.alcatel.com";
declare namespace xf = "http://tempuri.org/HighLevelApiWS/SearchBalancesICC/Resources/XQ/IN_PSSearchBalancesICCService_TO_IN_PSSubscriberLineManagerService/";

declare function xf:IN_PSSearchBalancesICCService_TO_IN_PSSubscriberLineManagerService($searchBalancesICC_request1 as element(ns1:searchBalancesICC-request))
    as element(ns0:getAllInformation) {
        <ns0:getAllInformation>
            {
                for $phone_number in $searchBalancesICC_request1/ns1:phone_number
                return
                    <ns0:subscriberLineId>{ data($phone_number) }</ns0:subscriberLineId>
            }
            <ns0:subscriberLineIdType>3</ns0:subscriberLineIdType>
           
        </ns0:getAllInformation>
};

declare variable $searchBalancesICC_request1 as element(ns1:searchBalancesICC-request) external;

xf:IN_PSSearchBalancesICCService_TO_IN_PSSubscriberLineManagerService($searchBalancesICC_request1)