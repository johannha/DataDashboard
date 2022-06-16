/**
 * EDC REST API
 * All files merged by open api merger
 *
 * The version of the OpenAPI document: 1.0.0-SNAPSHOT
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */
import { Policy } from './policy';
import { Asset } from './asset';


export interface ContractOffer { 
    id?: string;
    policy?: Policy;
    asset?: Asset;
    policyId?: string;
    assetId?: string;
    provider?: string;
    consumer?: string;
    offerStart?: string;
    offerEnd?: string;
    contractStart?: string;
    contractEnd?: string;
}

