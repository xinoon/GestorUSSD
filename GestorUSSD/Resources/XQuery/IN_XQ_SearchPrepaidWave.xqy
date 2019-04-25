xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:searchBalancesICC-request" location="../../../PrepaidWave/Resources/WSDL/serviceSearchPrepagoICC-request.xsd" ::)

declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_SearchPrepaidWave/";

declare function xf:IN_XQ_SearchPrepaidWave($nroCelular as xs:string)
    as element(ns0:searchBalancesICC-request) {
        <ns0:searchBalancesICC-request>
            <ns0:phone_number>{ $nroCelular }</ns0:phone_number>
            <ns0:detail_bucket>Y</ns0:detail_bucket>
            <ns0:tipBucket>NOBALANCE</ns0:tipBucket>
        </ns0:searchBalancesICC-request>
};

declare variable $nroCelular as xs:string external;

xf:IN_XQ_SearchPrepaidWave($nroCelular)