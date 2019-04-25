xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getUpsellingCompraBolsas1" element="ns1:getUpsellingCompraBolsas" location="../WSDLs/BSCSUpsellingBolsasService_schema.xsd" ::)
(:: pragma bea:global-element-return element="ns0:searchBalancesICC-request" location="../../../PrepaidWave/Resources/WSDL/serviceSearchPrepagoICC-request.xsd" ::)

declare namespace ns1 = "http://upselling.bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace ns0 = "http://ws.nextel.cl/schemas/searchBalanceIcc/alcatel/getAllInformation";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_SearchBalancePrepaidUpselling/";

declare function xf:IN_XQ_SearchBalancePrepaidUpselling($getUpsellingCompraBolsas1 as element(ns1:getUpsellingCompraBolsas))
    as element(ns0:searchBalancesICC-request) {
        <ns0:searchBalancesICC-request>
            <ns0:phone_number>{ data($getUpsellingCompraBolsas1/nro_cel) }</ns0:phone_number>
            <ns0:detail_bucket>Y</ns0:detail_bucket>
            <ns0:tipBucket>noBalance</ns0:tipBucket>
        </ns0:searchBalancesICC-request>
};

declare variable $getUpsellingCompraBolsas1 as element(ns1:getUpsellingCompraBolsas) external;

xf:IN_XQ_SearchBalancePrepaidUpselling($getUpsellingCompraBolsas1)