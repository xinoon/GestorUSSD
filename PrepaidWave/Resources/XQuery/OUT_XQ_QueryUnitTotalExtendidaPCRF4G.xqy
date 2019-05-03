xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:unitTotalExtendida4GResponse" location="../WSDL/PrepaidWaveService.xsd" ::)

declare namespace ns0 = "http://prepaid.wave.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/OUT_XQ_QueryUnitTotalExtendidaPCRF4G/";

declare function xf:OUT_XQ_QueryUnitTotalExtendidaPCRF4G($plan as xs:string,
    $cantidadBucketAdq as xs:string,
    $cantidadBucketPro as xs:string,
    $listBucketUnidAdq as xs:string,
    $listBucketUnidPro as xs:string,
    $totalDatos as xs:string)
    as element(ns0:unitTotalExtendida4GResponse) {
        <ns0:unitTotalExtendida4GResponse>
            <planAbonado>{ $plan }</planAbonado>
            <cantidadBucketAdq>{ $cantidadBucketAdq }</cantidadBucketAdq>
            <cantidadBucketPro>{ $cantidadBucketPro }</cantidadBucketPro>
            <listBucketUnidAdq>{ $listBucketUnidAdq }</listBucketUnidAdq>
            <listBucketUnidPro>{ $listBucketUnidPro }</listBucketUnidPro>
            <listBucketUnidTot>{ concat($listBucketUnidPro, $listBucketUnidAdq )}</listBucketUnidTot>
            <totalDatos>{ $totalDatos }</totalDatos>
            <errorCode>0</errorCode>
            <errorDescription>{
                    if ( xs:int($totalDatos) <= 0 or empty($totalDatos)) then
                        ('No se encuentran bucket PCRF para el cliente.')
                    else 
                        'Consulta Exitosa.'
                }</errorDescription>
        </ns0:unitTotalExtendida4GResponse>
};

declare variable $plan as xs:string external;
declare variable $cantidadBucketAdq as xs:string external;
declare variable $cantidadBucketPro as xs:string external;
declare variable $listBucketUnidAdq as xs:string external;
declare variable $listBucketUnidPro as xs:string external;
declare variable $totalDatos as xs:string external;

xf:OUT_XQ_QueryUnitTotalExtendidaPCRF4G($plan,
    $cantidadBucketAdq,
    $cantidadBucketPro,
    $listBucketUnidAdq,
    $listBucketUnidPro,
    $totalDatos)