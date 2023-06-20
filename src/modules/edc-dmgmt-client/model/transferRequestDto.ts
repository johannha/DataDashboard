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
import { DataAddress } from './dataAddress';
import { TransferType } from './transferType';


export interface TransferRequestDto { 
    assetId: string;
    connectorAddress: string;
    connectorId: string;
    contractId: string;
    dataDestination: DataAddress;
    id?: string;
    managedResources?: boolean;
    properties?: { [key: string]: string; };
}

