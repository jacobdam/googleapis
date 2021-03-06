// This is a generated file (see the discoveryapis_generator project).

library googleapis.androiddeviceprovisioning.v1;

import 'dart:core' as core;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client androiddeviceprovisioning/v1';

/// Automates Android zero-touch enrollment for device resellers, customers, and
/// EMMs.
class AndroiddeviceprovisioningApi {
  final commons.ApiRequester _requester;

  CustomersResourceApi get customers => new CustomersResourceApi(_requester);
  OperationsResourceApi get operations => new OperationsResourceApi(_requester);
  PartnersResourceApi get partners => new PartnersResourceApi(_requester);

  AndroiddeviceprovisioningApi(http.Client client,
      {core.String rootUrl: "https://androiddeviceprovisioning.googleapis.com/",
      core.String servicePath: ""})
      : _requester =
            new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}

class CustomersResourceApi {
  final commons.ApiRequester _requester;

  CustomersConfigurationsResourceApi get configurations =>
      new CustomersConfigurationsResourceApi(_requester);
  CustomersDevicesResourceApi get devices =>
      new CustomersDevicesResourceApi(_requester);
  CustomersDpcsResourceApi get dpcs => new CustomersDpcsResourceApi(_requester);

  CustomersResourceApi(commons.ApiRequester client) : _requester = client;

  /// Lists the user's customer accounts.
  ///
  /// Request parameters:
  ///
  /// [pageToken] - A token specifying which result page to return.
  ///
  /// [pageSize] - The maximum number of customers to show in a page of results.
  /// A number between 1 and 100 (inclusive).
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomerListCustomersResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomerListCustomersResponse> list(
      {core.String pageToken, core.int pageSize, core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = ["${pageSize}"];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/customers';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new CustomerListCustomersResponse.fromJson(data));
  }
}

class CustomersConfigurationsResourceApi {
  final commons.ApiRequester _requester;

  CustomersConfigurationsResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a new configuration. Once created, a customer can apply the
  /// configuration to devices.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer that manages the configuration. An API
  /// resource name
  /// in the format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern "^customers/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Configuration].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Configuration> create(Configuration request, core.String parent,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/configurations';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Configuration.fromJson(data));
  }

  /// Deletes an unused configuration. The API call fails if the customer has
  /// devices with the configuration applied.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The configuration to delete. An API resource name in
  /// the format
  /// `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`. If the
  /// configuration is applied to any devices, the API call fails.
  /// Value must have pattern "^customers/[^/]+/configurations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> delete(core.String name, {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "DELETE",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Gets the details of a configuration.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The configuration to get. An API resource name in the
  /// format
  /// `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`.
  /// Value must have pattern "^customers/[^/]+/configurations/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Configuration].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Configuration> get(core.String name, {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Configuration.fromJson(data));
  }

  /// Lists a customer's configurations.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer that manages the listed configurations.
  /// An API
  /// resource name in the format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern "^customers/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomerListConfigurationsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomerListConfigurationsResponse> list(core.String parent,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/configurations';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new CustomerListConfigurationsResponse.fromJson(data));
  }

  /// Updates a configuration's field values.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Output only. The API resource name in the format
  /// `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`. Assigned by
  /// the server.
  /// Value must have pattern "^customers/[^/]+/configurations/[^/]+$".
  ///
  /// [updateMask] - Required. The field mask applied to the target
  /// `Configuration` before
  /// updating the fields. To learn more about using field masks, read
  /// [FieldMask](/protocol-buffers/docs/reference/google.protobuf#fieldmask) in
  /// the Protocol Buffers documentation.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Configuration].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Configuration> patch(Configuration request, core.String name,
      {core.String updateMask, core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if (updateMask != null) {
      _queryParams["updateMask"] = [updateMask];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "PATCH",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Configuration.fromJson(data));
  }
}

class CustomersDevicesResourceApi {
  final commons.ApiRequester _requester;

  CustomersDevicesResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Applies a Configuration to the device to register the device for
  /// zero-touch
  /// enrollment. After applying a configuration to a device, the device
  /// automatically provisions itself on first boot, or next factory reset.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer managing the device. An API resource
  /// name in the
  /// format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern "^customers/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> applyConfiguration(
      CustomerApplyConfigurationRequest request, core.String parent,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/devices:applyConfiguration';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Gets the details of a device.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. The device to get. An API resource name in the format
  /// `customers/[CUSTOMER_ID]/devices/[DEVICE_ID]`.
  /// Value must have pattern "^customers/[^/]+/devices/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Device].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Device> get(core.String name, {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Device.fromJson(data));
  }

  /// Lists a customer's devices.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer managing the devices. An API resource
  /// name in the
  /// format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern "^customers/[^/]+$".
  ///
  /// [pageToken] - A token specifying which result page to return.
  ///
  /// [pageSize] - The maximum number of devices to show in a page of results.
  /// Must be between 1 and 100 inclusive.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomerListDevicesResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomerListDevicesResponse> list(core.String parent,
      {core.String pageToken, core.String pageSize, core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if (pageToken != null) {
      _queryParams["pageToken"] = [pageToken];
    }
    if (pageSize != null) {
      _queryParams["pageSize"] = [pageSize];
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/devices';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new CustomerListDevicesResponse.fromJson(data));
  }

  /// Removes a configuration from device.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer managing the device in the format
  /// `customers/[CUSTOMER_ID]`.
  /// Value must have pattern "^customers/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> removeConfiguration(
      CustomerRemoveConfigurationRequest request, core.String parent,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/devices:removeConfiguration';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Unclaims a device from a customer and removes it from zero-touch
  /// enrollment.
  ///
  /// After removing a device, a customer must contact their reseller to
  /// register
  /// the device into zero-touch enrollment again.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer managing the device. An API resource
  /// name in the
  /// format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern "^customers/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> unclaim(
      CustomerUnclaimDeviceRequest request, core.String parent,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/devices:unclaim';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }
}

class CustomersDpcsResourceApi {
  final commons.ApiRequester _requester;

  CustomersDpcsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Lists the DPCs (device policy controllers) that support zero-touch
  /// enrollment.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The customer that can use the DPCs in configurations.
  /// An API
  /// resource name in the format `customers/[CUSTOMER_ID]`.
  /// Value must have pattern "^customers/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [CustomerListDpcsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<CustomerListDpcsResponse> list(core.String parent,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/dpcs';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new CustomerListDpcsResponse.fromJson(data));
  }
}

class OperationsResourceApi {
  final commons.ApiRequester _requester;

  OperationsResourceApi(commons.ApiRequester client) : _requester = client;

  /// Gets the latest state of a long-running operation.  Clients can use this
  /// method to poll the operation result at intervals as recommended by the API
  /// service.
  ///
  /// Request parameters:
  ///
  /// [name] - The name of the operation resource.
  /// Value must have pattern "^operations/.+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> get(core.String name, {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Operation.fromJson(data));
  }
}

class PartnersResourceApi {
  final commons.ApiRequester _requester;

  PartnersCustomersResourceApi get customers =>
      new PartnersCustomersResourceApi(_requester);
  PartnersDevicesResourceApi get devices =>
      new PartnersDevicesResourceApi(_requester);

  PartnersResourceApi(commons.ApiRequester client) : _requester = client;
}

class PartnersCustomersResourceApi {
  final commons.ApiRequester _requester;

  PartnersCustomersResourceApi(commons.ApiRequester client)
      : _requester = client;

  /// Creates a customer for zero-touch enrollment. After the method returns
  /// successfully, admin and owner roles can manage devices and EMM configs
  /// by calling API methods or using their zero-touch enrollment portal. The
  /// API
  /// doesn't notify the customer that they have access.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. The parent resource ID in the format
  /// `partners/[PARTNER_ID]` that
  /// identifies the reseller.
  /// Value must have pattern "^partners/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Company].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Company> create(
      CreateCustomerRequest request, core.String parent,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (parent == null) {
      throw new core.ArgumentError("Parameter parent is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url =
        'v1/' + commons.Escaper.ecapeVariableReserved('$parent') + '/customers';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Company.fromJson(data));
  }

  /// Lists the customers that are enrolled to the reseller identified by the
  /// `partnerId` argument. This list includes customers that the reseller
  /// created and customers that enrolled themselves using the portal.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - The ID of the partner.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListCustomersResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListCustomersResponse> list(core.String partnerId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (partnerId == null) {
      throw new core.ArgumentError("Parameter partnerId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/customers';

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ListCustomersResponse.fromJson(data));
  }
}

class PartnersDevicesResourceApi {
  final commons.ApiRequester _requester;

  PartnersDevicesResourceApi(commons.ApiRequester client) : _requester = client;

  /// Claim the device identified by device identifier.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - ID of the partner.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ClaimDeviceResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ClaimDeviceResponse> claim(
      ClaimDeviceRequest request, core.String partnerId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (partnerId == null) {
      throw new core.ArgumentError("Parameter partnerId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:claim';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new ClaimDeviceResponse.fromJson(data));
  }

  /// Claim devices asynchronously.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Partner ID.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> claimAsync(
      ClaimDevicesRequest request, core.String partnerId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (partnerId == null) {
      throw new core.ArgumentError("Parameter partnerId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:claimAsync';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Operation.fromJson(data));
  }

  /// Find devices by device identifier.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - ID of the partner.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [FindDevicesByDeviceIdentifierResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<FindDevicesByDeviceIdentifierResponse> findByIdentifier(
      FindDevicesByDeviceIdentifierRequest request, core.String partnerId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (partnerId == null) {
      throw new core.ArgumentError("Parameter partnerId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:findByIdentifier';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then(
        (data) => new FindDevicesByDeviceIdentifierResponse.fromJson(data));
  }

  /// Find devices by ownership.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - ID of the partner.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [FindDevicesByOwnerResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<FindDevicesByOwnerResponse> findByOwner(
      FindDevicesByOwnerRequest request, core.String partnerId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (partnerId == null) {
      throw new core.ArgumentError("Parameter partnerId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:findByOwner';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response
        .then((data) => new FindDevicesByOwnerResponse.fromJson(data));
  }

  /// Get a device.
  ///
  /// Request parameters:
  ///
  /// [name] - Resource name in `partners/[PARTNER_ID]/devices/[DEVICE_ID]`.
  /// Value must have pattern "^partners/[^/]+/devices/[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Device].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Device> get(core.String name, {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (name == null) {
      throw new core.ArgumentError("Parameter name is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/' + commons.Escaper.ecapeVariableReserved('$name');

    var _response = _requester.request(_url, "GET",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Device.fromJson(data));
  }

  /// Update the metadata.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [metadataOwnerId] - The owner of the newly set metadata. Set this to the
  /// partner ID.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [deviceId] - ID of the partner.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [DeviceMetadata].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<DeviceMetadata> metadata(UpdateDeviceMetadataRequest request,
      core.String metadataOwnerId, core.String deviceId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (metadataOwnerId == null) {
      throw new core.ArgumentError("Parameter metadataOwnerId is required.");
    }
    if (deviceId == null) {
      throw new core.ArgumentError("Parameter deviceId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$metadataOwnerId') +
        '/devices/' +
        commons.Escaper.ecapeVariableReserved('$deviceId') +
        '/metadata';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new DeviceMetadata.fromJson(data));
  }

  /// Unclaim the device identified by the `device_id` or the
  /// `deviceIdentifier`.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - ID of the partner.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Empty].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Empty> unclaim(
      UnclaimDeviceRequest request, core.String partnerId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (partnerId == null) {
      throw new core.ArgumentError("Parameter partnerId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:unclaim';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Empty.fromJson(data));
  }

  /// Unclaim devices asynchronously.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Partner ID.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> unclaimAsync(
      UnclaimDevicesRequest request, core.String partnerId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (partnerId == null) {
      throw new core.ArgumentError("Parameter partnerId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:unclaimAsync';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Operation.fromJson(data));
  }

  /// Set metadata in batch asynchronously.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [partnerId] - Partner ID.
  /// Value must have pattern "^[^/]+$".
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Operation].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Operation> updateMetadataAsync(
      UpdateDeviceMetadataInBatchRequest request, core.String partnerId,
      {core.String $fields}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (partnerId == null) {
      throw new core.ArgumentError("Parameter partnerId is required.");
    }
    if ($fields != null) {
      _queryParams["fields"] = [$fields];
    }

    _url = 'v1/partners/' +
        commons.Escaper.ecapeVariableReserved('$partnerId') +
        '/devices:updateMetadataAsync';

    var _response = _requester.request(_url, "POST",
        body: _body,
        queryParams: _queryParams,
        uploadOptions: _uploadOptions,
        uploadMedia: _uploadMedia,
        downloadOptions: _downloadOptions);
    return _response.then((data) => new Operation.fromJson(data));
  }
}

/// Request message to claim a device on behalf of a customer.
class ClaimDeviceRequest {
  /// The customer to claim for.
  core.String customerId;

  /// The device identifier of the device to claim.
  DeviceIdentifier deviceIdentifier;

  /// The section to claim.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  ClaimDeviceRequest();

  ClaimDeviceRequest.fromJson(core.Map _json) {
    if (_json.containsKey("customerId")) {
      customerId = _json["customerId"];
    }
    if (_json.containsKey("deviceIdentifier")) {
      deviceIdentifier =
          new DeviceIdentifier.fromJson(_json["deviceIdentifier"]);
    }
    if (_json.containsKey("sectionType")) {
      sectionType = _json["sectionType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (customerId != null) {
      _json["customerId"] = customerId;
    }
    if (deviceIdentifier != null) {
      _json["deviceIdentifier"] = (deviceIdentifier).toJson();
    }
    if (sectionType != null) {
      _json["sectionType"] = sectionType;
    }
    return _json;
  }
}

/// Response message containing device id of the claim.
class ClaimDeviceResponse {
  /// The device ID of the claimed device.
  core.String deviceId;

  /// The resource name of the device in the format
  /// `partners/[PARTNER_ID]/devices/[DEVICE_ID]`.
  core.String deviceName;

  ClaimDeviceResponse();

  ClaimDeviceResponse.fromJson(core.Map _json) {
    if (_json.containsKey("deviceId")) {
      deviceId = _json["deviceId"];
    }
    if (_json.containsKey("deviceName")) {
      deviceName = _json["deviceName"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (deviceId != null) {
      _json["deviceId"] = deviceId;
    }
    if (deviceName != null) {
      _json["deviceName"] = deviceName;
    }
    return _json;
  }
}

/// Request to claim devices asynchronously in batch.
class ClaimDevicesRequest {
  /// List of claims.
  core.List<PartnerClaim> claims;

  ClaimDevicesRequest();

  ClaimDevicesRequest.fromJson(core.Map _json) {
    if (_json.containsKey("claims")) {
      claims = _json["claims"]
          .map((value) => new PartnerClaim.fromJson(value))
          .toList()
          .cast<PartnerClaim>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (claims != null) {
      _json["claims"] = claims.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// A customer resource in the zero-touch enrollment API.
class Company {
  /// Input only. Optional. Email address of customer's users in the admin role.
  /// Each email address must be associated with a Google Account.
  core.List<core.String> adminEmails;

  /// Output only. The ID of the company. Assigned by the server.
  core.String companyId;

  /// Required. The name of the company. For example _XYZ Corp_. Characters
  /// allowed are: Latin letters, numerals, hyphens, and spaces. Displayed to
  /// the
  /// customer's employees in the zero-touch enrollment portal.
  core.String companyName;

  /// Output only. The API resource name of the company in the format
  /// `partners/[PARTNER_ID]/customers/[CUSTOMER_ID]`. Assigned by the server.
  core.String name;

  /// Input only. Email address of customer's users in the owner role. At least
  /// one `owner_email` is required. Each email address must be associated with
  /// a
  /// Google Account. Owners share the same access as admins but can also add,
  /// delete, and edit your organization's portal users.
  core.List<core.String> ownerEmails;

  Company();

  Company.fromJson(core.Map _json) {
    if (_json.containsKey("adminEmails")) {
      adminEmails = _json["adminEmails"];
    }
    if (_json.containsKey("companyId")) {
      companyId = _json["companyId"];
    }
    if (_json.containsKey("companyName")) {
      companyName = _json["companyName"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("ownerEmails")) {
      ownerEmails = _json["ownerEmails"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (adminEmails != null) {
      _json["adminEmails"] = adminEmails;
    }
    if (companyId != null) {
      _json["companyId"] = companyId;
    }
    if (companyName != null) {
      _json["companyName"] = companyName;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (ownerEmails != null) {
      _json["ownerEmails"] = ownerEmails;
    }
    return _json;
  }
}

/// A configuration collects the provisioning options for Android devices. Each
/// configuration combines the following:
///
/// * The EMM device policy controller (DPC) installed on the devices.
/// * EMM policies enforced on the devices.
/// * Metadata displayed on the device to help users during setup.
///
/// Customers can add as many configurations as they need. However, zero-touch
/// enrollment works best when a customer sets a default configuration that's
/// applied to any new devices the organization purchases.
class Configuration {
  /// Required. The name of the organization. Zero-touch enrollment shows this
  /// organization name to device users during device provisioning.
  core.String companyName;

  /// Output only. The ID of the configuration. Assigned by the server.
  core.String configurationId;

  /// Required. A short name that describes the configuration's purpose. For
  /// example, _Sales team_ or _Temporary employees_. The zero-touch enrollment
  /// portal displays this name to IT admins.
  core.String configurationName;

  /// Required. The email address that device users can contact to get help.
  /// Zero-touch enrollment shows this email address to device users before
  /// device provisioning. The value is validated on input.
  core.String contactEmail;

  /// Required. The telephone number that device users can call, using another
  /// device, to get help. Zero-touch enrollment shows this number to device
  /// users before device provisioning. Accepts numerals, spaces, the plus sign,
  /// hyphens, and parentheses.
  core.String contactPhone;

  /// A message, containing one or two sentences, to help device users get help
  /// or give them more details about what’s happening to their device.
  /// Zero-touch enrollment shows this message before the device is provisioned.
  core.String customMessage;

  /// The JSON-formatted EMM provisioning extras that are passed to the DPC.
  core.String dpcExtras;

  /// Required. The resource name of the selected DPC (device policy controller)
  /// in the format `customers/[CUSTOMER_ID]/dpcs / * `. To list the supported
  /// DPCs,
  /// call
  /// `customers.dpcs.list`.
  core.String dpcResourcePath;

  /// Required. Whether this is the default configuration that zero-touch
  /// enrollment applies to any new devices the organization purchases in the
  /// future. Only one customer configuration can be the default. Setting this
  /// value to `true`, changes the previous default configuration's `isDefault`
  /// value to `false`.
  core.bool isDefault;

  /// Output only. The API resource name in the format
  /// `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`. Assigned by
  /// the server.
  core.String name;

  Configuration();

  Configuration.fromJson(core.Map _json) {
    if (_json.containsKey("companyName")) {
      companyName = _json["companyName"];
    }
    if (_json.containsKey("configurationId")) {
      configurationId = _json["configurationId"];
    }
    if (_json.containsKey("configurationName")) {
      configurationName = _json["configurationName"];
    }
    if (_json.containsKey("contactEmail")) {
      contactEmail = _json["contactEmail"];
    }
    if (_json.containsKey("contactPhone")) {
      contactPhone = _json["contactPhone"];
    }
    if (_json.containsKey("customMessage")) {
      customMessage = _json["customMessage"];
    }
    if (_json.containsKey("dpcExtras")) {
      dpcExtras = _json["dpcExtras"];
    }
    if (_json.containsKey("dpcResourcePath")) {
      dpcResourcePath = _json["dpcResourcePath"];
    }
    if (_json.containsKey("isDefault")) {
      isDefault = _json["isDefault"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (companyName != null) {
      _json["companyName"] = companyName;
    }
    if (configurationId != null) {
      _json["configurationId"] = configurationId;
    }
    if (configurationName != null) {
      _json["configurationName"] = configurationName;
    }
    if (contactEmail != null) {
      _json["contactEmail"] = contactEmail;
    }
    if (contactPhone != null) {
      _json["contactPhone"] = contactPhone;
    }
    if (customMessage != null) {
      _json["customMessage"] = customMessage;
    }
    if (dpcExtras != null) {
      _json["dpcExtras"] = dpcExtras;
    }
    if (dpcResourcePath != null) {
      _json["dpcResourcePath"] = dpcResourcePath;
    }
    if (isDefault != null) {
      _json["isDefault"] = isDefault;
    }
    if (name != null) {
      _json["name"] = name;
    }
    return _json;
  }
}

/// Request message to create a customer.
class CreateCustomerRequest {
  /// Required. The company data to populate the new customer. Must contain a
  /// value for `companyName` and at least one `owner_email` that's associated
  /// with a Google Account. The values for `companyId` and `name` must be
  /// empty.
  Company customer;

  CreateCustomerRequest();

  CreateCustomerRequest.fromJson(core.Map _json) {
    if (_json.containsKey("customer")) {
      customer = new Company.fromJson(_json["customer"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (customer != null) {
      _json["customer"] = (customer).toJson();
    }
    return _json;
  }
}

/// Request message for customer to assign a configuration to device.
class CustomerApplyConfigurationRequest {
  /// Required. The configuration applied to the device in the format
  /// `customers/[CUSTOMER_ID]/configurations/[CONFIGURATION_ID]`.
  core.String configuration;

  /// Required. The device the configuration is applied to.
  DeviceReference device;

  CustomerApplyConfigurationRequest();

  CustomerApplyConfigurationRequest.fromJson(core.Map _json) {
    if (_json.containsKey("configuration")) {
      configuration = _json["configuration"];
    }
    if (_json.containsKey("device")) {
      device = new DeviceReference.fromJson(_json["device"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (configuration != null) {
      _json["configuration"] = configuration;
    }
    if (device != null) {
      _json["device"] = (device).toJson();
    }
    return _json;
  }
}

/// Response message of customer's listing configuration.
class CustomerListConfigurationsResponse {
  /// The configurations.
  core.List<Configuration> configurations;

  CustomerListConfigurationsResponse();

  CustomerListConfigurationsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("configurations")) {
      configurations = _json["configurations"]
          .map((value) => new Configuration.fromJson(value))
          .toList()
          .cast<Configuration>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (configurations != null) {
      _json["configurations"] =
          configurations.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Response message for listing my customers.
class CustomerListCustomersResponse {
  /// The customer accounts the calling user is a member of.
  core.List<Company> customers;

  /// A token used to access the next page of results. Omitted if no further
  /// results are available.
  core.String nextPageToken;

  CustomerListCustomersResponse();

  CustomerListCustomersResponse.fromJson(core.Map _json) {
    if (_json.containsKey("customers")) {
      customers = _json["customers"]
          .map((value) => new Company.fromJson(value))
          .toList()
          .cast<Company>();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (customers != null) {
      _json["customers"] = customers.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// Response message of customer's liting devices.
class CustomerListDevicesResponse {
  /// The customer's devices.
  core.List<Device> devices;

  /// A token used to access the next page of results. Omitted if no further
  /// results are available.
  core.String nextPageToken;

  CustomerListDevicesResponse();

  CustomerListDevicesResponse.fromJson(core.Map _json) {
    if (_json.containsKey("devices")) {
      devices = _json["devices"]
          .map((value) => new Device.fromJson(value))
          .toList()
          .cast<Device>();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (devices != null) {
      _json["devices"] = devices.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// Response message of customer's listing DPCs.
class CustomerListDpcsResponse {
  /// The list of DPCs available to the customer that support zero-touch
  /// enrollment.
  core.List<Dpc> dpcs;

  CustomerListDpcsResponse();

  CustomerListDpcsResponse.fromJson(core.Map _json) {
    if (_json.containsKey("dpcs")) {
      dpcs = _json["dpcs"]
          .map((value) => new Dpc.fromJson(value))
          .toList()
          .cast<Dpc>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (dpcs != null) {
      _json["dpcs"] = dpcs.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Request message for customer to remove the configuration from device.
class CustomerRemoveConfigurationRequest {
  /// Required. The device to remove the configuration from.
  DeviceReference device;

  CustomerRemoveConfigurationRequest();

  CustomerRemoveConfigurationRequest.fromJson(core.Map _json) {
    if (_json.containsKey("device")) {
      device = new DeviceReference.fromJson(_json["device"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (device != null) {
      _json["device"] = (device).toJson();
    }
    return _json;
  }
}

/// Request message for customer to unclaim a device.
class CustomerUnclaimDeviceRequest {
  /// Required. The device to unclaim.
  DeviceReference device;

  CustomerUnclaimDeviceRequest();

  CustomerUnclaimDeviceRequest.fromJson(core.Map _json) {
    if (_json.containsKey("device")) {
      device = new DeviceReference.fromJson(_json["device"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (device != null) {
      _json["device"] = (device).toJson();
    }
    return _json;
  }
}

/// An Android device registered for zero-touch enrollment.
class Device {
  /// Output only. The provisioning claims for a device. Devices claimed for
  /// zero-touch enrollment have a claim with the type
  /// `SECTION_TYPE_ZERO_TOUCH`.
  /// Call
  /// `partners.devices.unclaim`
  /// or
  /// `partners.devices.unclaimAsync`
  /// to remove the device from zero-touch enrollment.
  core.List<DeviceClaim> claims;

  /// Not available to resellers.
  core.String configuration;

  /// Output only. The ID of the device. Assigned by the server.
  core.String deviceId;

  /// The hardware IDs that identify a manufactured device. To learn more, read
  /// [Identifiers](/zero-touch/guides/identifiers).
  DeviceIdentifier deviceIdentifier;

  /// The metadata attached to the device. Structured as key-value pairs. To
  /// learn more, read [Device metadata](/zero-touch/guides/metadata).
  DeviceMetadata deviceMetadata;

  /// Output only. The API resource name in the format
  /// `partners/[PARTNER_ID]/devices/[DEVICE_ID]`. Assigned by the server.
  core.String name;

  Device();

  Device.fromJson(core.Map _json) {
    if (_json.containsKey("claims")) {
      claims = _json["claims"]
          .map((value) => new DeviceClaim.fromJson(value))
          .toList()
          .cast<DeviceClaim>();
    }
    if (_json.containsKey("configuration")) {
      configuration = _json["configuration"];
    }
    if (_json.containsKey("deviceId")) {
      deviceId = _json["deviceId"];
    }
    if (_json.containsKey("deviceIdentifier")) {
      deviceIdentifier =
          new DeviceIdentifier.fromJson(_json["deviceIdentifier"]);
    }
    if (_json.containsKey("deviceMetadata")) {
      deviceMetadata = new DeviceMetadata.fromJson(_json["deviceMetadata"]);
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (claims != null) {
      _json["claims"] = claims.map((value) => (value).toJson()).toList();
    }
    if (configuration != null) {
      _json["configuration"] = configuration;
    }
    if (deviceId != null) {
      _json["deviceId"] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json["deviceIdentifier"] = (deviceIdentifier).toJson();
    }
    if (deviceMetadata != null) {
      _json["deviceMetadata"] = (deviceMetadata).toJson();
    }
    if (name != null) {
      _json["name"] = name;
    }
    return _json;
  }
}

/// A record of a device claimed by a reseller for a customer. Devices claimed
/// for zero-touch enrollment have a claim with the type
/// `SECTION_TYPE_ZERO_TOUCH`. To learn more, read
/// [Claim devices for customers](/zero-touch/guides/how-it-works#claim).
class DeviceClaim {
  /// The ID of the Customer that purchased the device.
  core.String ownerCompanyId;

  /// Output only. The type of claim made on the device.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  DeviceClaim();

  DeviceClaim.fromJson(core.Map _json) {
    if (_json.containsKey("ownerCompanyId")) {
      ownerCompanyId = _json["ownerCompanyId"];
    }
    if (_json.containsKey("sectionType")) {
      sectionType = _json["sectionType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (ownerCompanyId != null) {
      _json["ownerCompanyId"] = ownerCompanyId;
    }
    if (sectionType != null) {
      _json["sectionType"] = sectionType;
    }
    return _json;
  }
}

/// Encapsulates hardware and product IDs to identify a manufactured device. To
/// learn more, read [Identifiers](/zero-touch/guides/identifiers).
class DeviceIdentifier {
  /// The device’s IMEI number. Validated on input.
  core.String imei;

  /// Required. The device manufacturer’s name. Matches the device's built-in
  /// value returned from `android.os.Build.MANUFACTURER`. Allowed values are
  /// listed in [manufacturer names](/zero-touch/resources/manufacturer-names).
  core.String manufacturer;

  /// The device’s MEID number.
  core.String meid;

  /// The manufacturer's serial number for the device. This value might not be
  /// unique.
  core.String serialNumber;

  DeviceIdentifier();

  DeviceIdentifier.fromJson(core.Map _json) {
    if (_json.containsKey("imei")) {
      imei = _json["imei"];
    }
    if (_json.containsKey("manufacturer")) {
      manufacturer = _json["manufacturer"];
    }
    if (_json.containsKey("meid")) {
      meid = _json["meid"];
    }
    if (_json.containsKey("serialNumber")) {
      serialNumber = _json["serialNumber"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (imei != null) {
      _json["imei"] = imei;
    }
    if (manufacturer != null) {
      _json["manufacturer"] = manufacturer;
    }
    if (meid != null) {
      _json["meid"] = meid;
    }
    if (serialNumber != null) {
      _json["serialNumber"] = serialNumber;
    }
    return _json;
  }
}

/// Metadata entries that can be attached to a `Device`. To learn more, read
/// [Device metadata](/zero-touch/guides/metadata).
class DeviceMetadata {
  /// Metadata entries recorded as key-value pairs.
  core.Map<core.String, core.String> entries;

  DeviceMetadata();

  DeviceMetadata.fromJson(core.Map _json) {
    if (_json.containsKey("entries")) {
      entries = _json["entries"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (entries != null) {
      _json["entries"] = entries;
    }
    return _json;
  }
}

/// A `DeviceReference` is an API abstraction that lets you supply a _device_
/// argument to a method using one of the following identifier types:
///
/// * A numeric API resource ID.
/// * Real-world hardware IDs, such as IMEI number, belonging to the
/// manufactured
///   device.
///
/// Methods that operate on devices take a `DeviceReference` as a parameter type
/// because it's more flexible for the caller. To learn more about device
/// identifiers, read [Identifiers](/zero-touch/guides/identifiers).
class DeviceReference {
  /// The ID of the device.
  core.String deviceId;

  /// The hardware IDs of the device.
  DeviceIdentifier deviceIdentifier;

  DeviceReference();

  DeviceReference.fromJson(core.Map _json) {
    if (_json.containsKey("deviceId")) {
      deviceId = _json["deviceId"];
    }
    if (_json.containsKey("deviceIdentifier")) {
      deviceIdentifier =
          new DeviceIdentifier.fromJson(_json["deviceIdentifier"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (deviceId != null) {
      _json["deviceId"] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json["deviceIdentifier"] = (deviceIdentifier).toJson();
    }
    return _json;
  }
}

/// Long running operation metadata.
class DevicesLongRunningOperationMetadata {
  /// Number of devices parsed in your requests.
  core.int devicesCount;

  /// The overall processing status.
  /// Possible string values are:
  /// - "BATCH_PROCESS_STATUS_UNSPECIFIED" : Invalid code. Shouldn't be used.
  /// - "BATCH_PROCESS_PENDING" : Pending.
  /// - "BATCH_PROCESS_IN_PROGRESS" : In progress.
  /// - "BATCH_PROCESS_PROCESSED" : Processed.
  /// This doesn't mean all items were processed sucessfully, you should
  /// check the `response` field for the result of every item.
  core.String processingStatus;

  /// Processing progress from 0 to 100.
  core.int progress;

  DevicesLongRunningOperationMetadata();

  DevicesLongRunningOperationMetadata.fromJson(core.Map _json) {
    if (_json.containsKey("devicesCount")) {
      devicesCount = _json["devicesCount"];
    }
    if (_json.containsKey("processingStatus")) {
      processingStatus = _json["processingStatus"];
    }
    if (_json.containsKey("progress")) {
      progress = _json["progress"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (devicesCount != null) {
      _json["devicesCount"] = devicesCount;
    }
    if (processingStatus != null) {
      _json["processingStatus"] = processingStatus;
    }
    if (progress != null) {
      _json["progress"] = progress;
    }
    return _json;
  }
}

/// Long running operation response.
class DevicesLongRunningOperationResponse {
  /// Processing status for each device.
  /// One `PerDeviceStatus` per device. The order is the same as in your
  /// requests.
  core.List<OperationPerDevice> perDeviceStatus;

  /// Number of succeesfully processed ones.
  core.int successCount;

  DevicesLongRunningOperationResponse();

  DevicesLongRunningOperationResponse.fromJson(core.Map _json) {
    if (_json.containsKey("perDeviceStatus")) {
      perDeviceStatus = _json["perDeviceStatus"]
          .map((value) => new OperationPerDevice.fromJson(value))
          .toList()
          .cast<OperationPerDevice>();
    }
    if (_json.containsKey("successCount")) {
      successCount = _json["successCount"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (perDeviceStatus != null) {
      _json["perDeviceStatus"] =
          perDeviceStatus.map((value) => (value).toJson()).toList();
    }
    if (successCount != null) {
      _json["successCount"] = successCount;
    }
    return _json;
  }
}

/// An EMM's DPC ([device policy controller](/android/work/dpc/build-dpc)).
/// Zero-touch enrollment installs a DPC (listed in the `Configuration`) on a
/// device to maintain the customer's mobile policies. All the DPCs listed by
/// the
/// API support zero-touch enrollment and are available in Google Play.
class Dpc {
  /// Output only. The title of the DPC app in Google Play. For example, _Google
  /// Apps Device Policy_. Useful in an application's user interface.
  core.String dpcName;

  /// Output only. The API resource name in the format
  /// `customers/[CUSTOMER_ID]/dpcs/[DPC_ID]`. Assigned by
  /// the server. To maintain a reference to a DPC across customer accounts,
  /// persist and match the last path component (`DPC_ID`).
  core.String name;

  /// Output only. The DPC's Android application ID that looks like a Java
  /// package name. Zero-touch enrollment installs the DPC app onto a device
  /// using this identifier.
  core.String packageName;

  Dpc();

  Dpc.fromJson(core.Map _json) {
    if (_json.containsKey("dpcName")) {
      dpcName = _json["dpcName"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("packageName")) {
      packageName = _json["packageName"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (dpcName != null) {
      _json["dpcName"] = dpcName;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (packageName != null) {
      _json["packageName"] = packageName;
    }
    return _json;
  }
}

/// A generic empty message that you can re-use to avoid defining duplicated
/// empty messages in your APIs. A typical example is to use it as the request
/// or the response type of an API method. For instance:
///
///     service Foo {
///       rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
///     }
///
/// The JSON representation for `Empty` is empty JSON object `{}`.
class Empty {
  Empty();

  Empty.fromJson(core.Map _json) {}

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    return _json;
  }
}

/// Request to find devices.
class FindDevicesByDeviceIdentifierRequest {
  /// The device identifier to search.
  DeviceIdentifier deviceIdentifier;

  /// Number of devices to show.
  core.String limit;

  /// Page token.
  core.String pageToken;

  FindDevicesByDeviceIdentifierRequest();

  FindDevicesByDeviceIdentifierRequest.fromJson(core.Map _json) {
    if (_json.containsKey("deviceIdentifier")) {
      deviceIdentifier =
          new DeviceIdentifier.fromJson(_json["deviceIdentifier"]);
    }
    if (_json.containsKey("limit")) {
      limit = _json["limit"];
    }
    if (_json.containsKey("pageToken")) {
      pageToken = _json["pageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (deviceIdentifier != null) {
      _json["deviceIdentifier"] = (deviceIdentifier).toJson();
    }
    if (limit != null) {
      _json["limit"] = limit;
    }
    if (pageToken != null) {
      _json["pageToken"] = pageToken;
    }
    return _json;
  }
}

/// Response containing found devices.
class FindDevicesByDeviceIdentifierResponse {
  /// Found devices.
  core.List<Device> devices;

  /// Page token of the next page.
  core.String nextPageToken;

  FindDevicesByDeviceIdentifierResponse();

  FindDevicesByDeviceIdentifierResponse.fromJson(core.Map _json) {
    if (_json.containsKey("devices")) {
      devices = _json["devices"]
          .map((value) => new Device.fromJson(value))
          .toList()
          .cast<Device>();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (devices != null) {
      _json["devices"] = devices.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// Request to find devices by customers.
class FindDevicesByOwnerRequest {
  /// List of customer IDs to search for.
  core.List<core.String> customerId;

  /// The number of devices to show in the result.
  core.String limit;

  /// Page token.
  core.String pageToken;

  /// The section type.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  FindDevicesByOwnerRequest();

  FindDevicesByOwnerRequest.fromJson(core.Map _json) {
    if (_json.containsKey("customerId")) {
      customerId = _json["customerId"];
    }
    if (_json.containsKey("limit")) {
      limit = _json["limit"];
    }
    if (_json.containsKey("pageToken")) {
      pageToken = _json["pageToken"];
    }
    if (_json.containsKey("sectionType")) {
      sectionType = _json["sectionType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (customerId != null) {
      _json["customerId"] = customerId;
    }
    if (limit != null) {
      _json["limit"] = limit;
    }
    if (pageToken != null) {
      _json["pageToken"] = pageToken;
    }
    if (sectionType != null) {
      _json["sectionType"] = sectionType;
    }
    return _json;
  }
}

/// Response containing found devices.
class FindDevicesByOwnerResponse {
  /// Devices found.
  core.List<Device> devices;

  /// Page token of the next page.
  core.String nextPageToken;

  FindDevicesByOwnerResponse();

  FindDevicesByOwnerResponse.fromJson(core.Map _json) {
    if (_json.containsKey("devices")) {
      devices = _json["devices"]
          .map((value) => new Device.fromJson(value))
          .toList()
          .cast<Device>();
    }
    if (_json.containsKey("nextPageToken")) {
      nextPageToken = _json["nextPageToken"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (devices != null) {
      _json["devices"] = devices.map((value) => (value).toJson()).toList();
    }
    if (nextPageToken != null) {
      _json["nextPageToken"] = nextPageToken;
    }
    return _json;
  }
}

/// Response message of all customers related to this partner.
class ListCustomersResponse {
  /// List of customers related to this partner.
  core.List<Company> customers;

  ListCustomersResponse();

  ListCustomersResponse.fromJson(core.Map _json) {
    if (_json.containsKey("customers")) {
      customers = _json["customers"]
          .map((value) => new Company.fromJson(value))
          .toList()
          .cast<Company>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (customers != null) {
      _json["customers"] = customers.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// This resource represents a long-running operation that is the result of a
/// network API call.
class Operation {
  /// If the value is `false`, it means the operation is still in progress.
  /// If `true`, the operation is completed, and either `error` or `response` is
  /// available.
  core.bool done;

  /// This field will always be not set if the operation is created by
  /// `claimAsync`, `unclaimAsync`, or `updateMetadataAsync`. In this case,
  /// error information for each device is set in
  /// `response.perDeviceStatus.result.status`.
  Status error;

  /// This field will contain a `DevicesLongRunningOperationMetadata` object if
  /// the operation is created by `claimAsync`, `unclaimAsync`, or
  /// `updateMetadataAsync`.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> metadata;

  /// The server-assigned name, which is only unique within the same service
  /// that
  /// originally returns it. If you use the default HTTP mapping, the
  /// `name` should have the format of `operations/some/unique/name`.
  core.String name;

  /// This field will contain a `DevicesLongRunningOperationResponse` object if
  /// the operation is created by `claimAsync`, `unclaimAsync`, or
  /// `updateMetadataAsync`.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.Map<core.String, core.Object> response;

  Operation();

  Operation.fromJson(core.Map _json) {
    if (_json.containsKey("done")) {
      done = _json["done"];
    }
    if (_json.containsKey("error")) {
      error = new Status.fromJson(_json["error"]);
    }
    if (_json.containsKey("metadata")) {
      metadata = _json["metadata"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("response")) {
      response = _json["response"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (done != null) {
      _json["done"] = done;
    }
    if (error != null) {
      _json["error"] = (error).toJson();
    }
    if (metadata != null) {
      _json["metadata"] = metadata;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (response != null) {
      _json["response"] = response;
    }
    return _json;
  }
}

/// Operation the server received for every device.
class OperationPerDevice {
  /// Request to claim a device.
  PartnerClaim claim;

  /// Processing result for every device.
  PerDeviceStatusInBatch result;

  /// Request to unclaim a device.
  PartnerUnclaim unclaim;

  /// Request to set metadata for a device.
  UpdateMetadataArguments updateMetadata;

  OperationPerDevice();

  OperationPerDevice.fromJson(core.Map _json) {
    if (_json.containsKey("claim")) {
      claim = new PartnerClaim.fromJson(_json["claim"]);
    }
    if (_json.containsKey("result")) {
      result = new PerDeviceStatusInBatch.fromJson(_json["result"]);
    }
    if (_json.containsKey("unclaim")) {
      unclaim = new PartnerUnclaim.fromJson(_json["unclaim"]);
    }
    if (_json.containsKey("updateMetadata")) {
      updateMetadata =
          new UpdateMetadataArguments.fromJson(_json["updateMetadata"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (claim != null) {
      _json["claim"] = (claim).toJson();
    }
    if (result != null) {
      _json["result"] = (result).toJson();
    }
    if (unclaim != null) {
      _json["unclaim"] = (unclaim).toJson();
    }
    if (updateMetadata != null) {
      _json["updateMetadata"] = (updateMetadata).toJson();
    }
    return _json;
  }
}

/// Identifies one claim request.
class PartnerClaim {
  /// Customer ID to claim for.
  core.String customerId;

  /// Device identifier of the device.
  DeviceIdentifier deviceIdentifier;

  /// Metadata to set at claim.
  DeviceMetadata deviceMetadata;

  /// Section type to claim.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  PartnerClaim();

  PartnerClaim.fromJson(core.Map _json) {
    if (_json.containsKey("customerId")) {
      customerId = _json["customerId"];
    }
    if (_json.containsKey("deviceIdentifier")) {
      deviceIdentifier =
          new DeviceIdentifier.fromJson(_json["deviceIdentifier"]);
    }
    if (_json.containsKey("deviceMetadata")) {
      deviceMetadata = new DeviceMetadata.fromJson(_json["deviceMetadata"]);
    }
    if (_json.containsKey("sectionType")) {
      sectionType = _json["sectionType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (customerId != null) {
      _json["customerId"] = customerId;
    }
    if (deviceIdentifier != null) {
      _json["deviceIdentifier"] = (deviceIdentifier).toJson();
    }
    if (deviceMetadata != null) {
      _json["deviceMetadata"] = (deviceMetadata).toJson();
    }
    if (sectionType != null) {
      _json["sectionType"] = sectionType;
    }
    return _json;
  }
}

/// Identifies one unclaim request.
class PartnerUnclaim {
  /// Device ID of the device.
  core.String deviceId;

  /// Device identifier of the device.
  DeviceIdentifier deviceIdentifier;

  /// Section type to unclaim.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  PartnerUnclaim();

  PartnerUnclaim.fromJson(core.Map _json) {
    if (_json.containsKey("deviceId")) {
      deviceId = _json["deviceId"];
    }
    if (_json.containsKey("deviceIdentifier")) {
      deviceIdentifier =
          new DeviceIdentifier.fromJson(_json["deviceIdentifier"]);
    }
    if (_json.containsKey("sectionType")) {
      sectionType = _json["sectionType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (deviceId != null) {
      _json["deviceId"] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json["deviceIdentifier"] = (deviceIdentifier).toJson();
    }
    if (sectionType != null) {
      _json["sectionType"] = sectionType;
    }
    return _json;
  }
}

/// Stores the processing result for each device.
class PerDeviceStatusInBatch {
  /// Device ID of the device if process succeeds.
  core.String deviceId;

  /// Error identifier.
  core.String errorIdentifier;

  /// Error message.
  core.String errorMessage;

  /// Process result.
  /// Possible string values are:
  /// - "SINGLE_DEVICE_STATUS_UNSPECIFIED" : Invalid code. Shouldn't be used.
  /// - "SINGLE_DEVICE_STATUS_UNKNOWN_ERROR" : Unknown error.
  /// We don't expect this error to occur here.
  /// - "SINGLE_DEVICE_STATUS_OTHER_ERROR" : Other error.
  /// We know/expect this error, but there's no defined error code for the
  /// error.
  /// - "SINGLE_DEVICE_STATUS_SUCCESS" : Success.
  /// - "SINGLE_DEVICE_STATUS_PERMISSION_DENIED" : Permission denied.
  /// - "SINGLE_DEVICE_STATUS_INVALID_DEVICE_IDENTIFIER" : Invalid device
  /// identifier.
  /// - "SINGLE_DEVICE_STATUS_INVALID_SECTION_TYPE" : Invalid section type.
  /// - "SINGLE_DEVICE_STATUS_SECTION_NOT_YOURS" : This section is claimed by
  /// another company.
  core.String status;

  PerDeviceStatusInBatch();

  PerDeviceStatusInBatch.fromJson(core.Map _json) {
    if (_json.containsKey("deviceId")) {
      deviceId = _json["deviceId"];
    }
    if (_json.containsKey("errorIdentifier")) {
      errorIdentifier = _json["errorIdentifier"];
    }
    if (_json.containsKey("errorMessage")) {
      errorMessage = _json["errorMessage"];
    }
    if (_json.containsKey("status")) {
      status = _json["status"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (deviceId != null) {
      _json["deviceId"] = deviceId;
    }
    if (errorIdentifier != null) {
      _json["errorIdentifier"] = errorIdentifier;
    }
    if (errorMessage != null) {
      _json["errorMessage"] = errorMessage;
    }
    if (status != null) {
      _json["status"] = status;
    }
    return _json;
  }
}

/// The `Status` type defines a logical error model that is suitable for
/// different
/// programming environments, including REST APIs and RPC APIs. It is used by
/// [gRPC](https://github.com/grpc). The error model is designed to be:
///
/// - Simple to use and understand for most users
/// - Flexible enough to meet unexpected needs
///
/// # Overview
///
/// The `Status` message contains three pieces of data: error code, error
/// message,
/// and error details. The error code should be an enum value of
/// google.rpc.Code, but it may accept additional error codes if needed.  The
/// error message should be a developer-facing English message that helps
/// developers *understand* and *resolve* the error. If a localized user-facing
/// error message is needed, put the localized message in the error details or
/// localize it in the client. The optional error details may contain arbitrary
/// information about the error. There is a predefined set of error detail types
/// in the package `google.rpc` that can be used for common error conditions.
///
/// # Language mapping
///
/// The `Status` message is the logical representation of the error model, but
/// it
/// is not necessarily the actual wire format. When the `Status` message is
/// exposed in different client libraries and different wire protocols, it can
/// be
/// mapped differently. For example, it will likely be mapped to some exceptions
/// in Java, but more likely mapped to some error codes in C.
///
/// # Other uses
///
/// The error model and the `Status` message can be used in a variety of
/// environments, either with or without APIs, to provide a
/// consistent developer experience across different environments.
///
/// Example uses of this error model include:
///
/// - Partial errors. If a service needs to return partial errors to the client,
/// it may embed the `Status` in the normal response to indicate the partial
///     errors.
///
/// - Workflow errors. A typical workflow has multiple steps. Each step may
///     have a `Status` message for error reporting.
///
/// - Batch operations. If a client uses batch request and batch response, the
///     `Status` message should be used directly inside batch response, one for
///     each error sub-response.
///
/// - Asynchronous operations. If an API call embeds asynchronous operation
///     results in its response, the status of those operations should be
///     represented directly using the `Status` message.
///
/// - Logging. If some API errors are stored in logs, the message `Status` could
/// be used directly after any stripping needed for security/privacy reasons.
class Status {
  /// The status code, which should be an enum value of google.rpc.Code.
  core.int code;

  /// A list of messages that carry the error details.  There is a common set of
  /// message types for APIs to use.
  ///
  /// The values for Object must be JSON objects. It can consist of `num`,
  /// `String`, `bool` and `null` as well as `Map` and `List` values.
  core.List<core.Map<core.String, core.Object>> details;

  /// A developer-facing error message, which should be in English. Any
  /// user-facing error message should be localized and sent in the
  /// google.rpc.Status.details field, or localized by the client.
  core.String message;

  Status();

  Status.fromJson(core.Map _json) {
    if (_json.containsKey("code")) {
      code = _json["code"];
    }
    if (_json.containsKey("details")) {
      details = _json["details"];
    }
    if (_json.containsKey("message")) {
      message = _json["message"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (code != null) {
      _json["code"] = code;
    }
    if (details != null) {
      _json["details"] = details;
    }
    if (message != null) {
      _json["message"] = message;
    }
    return _json;
  }
}

/// Request message to unclaim a device.
class UnclaimDeviceRequest {
  /// The device ID returned by `ClaimDevice`.
  core.String deviceId;

  /// The device identifier you used when you claimed this device.
  DeviceIdentifier deviceIdentifier;

  /// The section type to unclaim for.
  /// Possible string values are:
  /// - "SECTION_TYPE_UNSPECIFIED" : Unspecified section type.
  /// - "SECTION_TYPE_ZERO_TOUCH" : Zero-touch enrollment section type.
  core.String sectionType;

  UnclaimDeviceRequest();

  UnclaimDeviceRequest.fromJson(core.Map _json) {
    if (_json.containsKey("deviceId")) {
      deviceId = _json["deviceId"];
    }
    if (_json.containsKey("deviceIdentifier")) {
      deviceIdentifier =
          new DeviceIdentifier.fromJson(_json["deviceIdentifier"]);
    }
    if (_json.containsKey("sectionType")) {
      sectionType = _json["sectionType"];
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (deviceId != null) {
      _json["deviceId"] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json["deviceIdentifier"] = (deviceIdentifier).toJson();
    }
    if (sectionType != null) {
      _json["sectionType"] = sectionType;
    }
    return _json;
  }
}

/// Request to unclaim devices asynchronously in batch.
class UnclaimDevicesRequest {
  /// List of devices to unclaim.
  core.List<PartnerUnclaim> unclaims;

  UnclaimDevicesRequest();

  UnclaimDevicesRequest.fromJson(core.Map _json) {
    if (_json.containsKey("unclaims")) {
      unclaims = _json["unclaims"]
          .map((value) => new PartnerUnclaim.fromJson(value))
          .toList()
          .cast<PartnerUnclaim>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (unclaims != null) {
      _json["unclaims"] = unclaims.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Request to update device metadata in batch.
class UpdateDeviceMetadataInBatchRequest {
  /// List of metadata updates.
  core.List<UpdateMetadataArguments> updates;

  UpdateDeviceMetadataInBatchRequest();

  UpdateDeviceMetadataInBatchRequest.fromJson(core.Map _json) {
    if (_json.containsKey("updates")) {
      updates = _json["updates"]
          .map((value) => new UpdateMetadataArguments.fromJson(value))
          .toList()
          .cast<UpdateMetadataArguments>();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (updates != null) {
      _json["updates"] = updates.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

/// Request to set metadata for a device.
class UpdateDeviceMetadataRequest {
  /// The metdata to set.
  DeviceMetadata deviceMetadata;

  UpdateDeviceMetadataRequest();

  UpdateDeviceMetadataRequest.fromJson(core.Map _json) {
    if (_json.containsKey("deviceMetadata")) {
      deviceMetadata = new DeviceMetadata.fromJson(_json["deviceMetadata"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (deviceMetadata != null) {
      _json["deviceMetadata"] = (deviceMetadata).toJson();
    }
    return _json;
  }
}

/// Identifies metdata updates to one device.
class UpdateMetadataArguments {
  /// Device ID of the device.
  core.String deviceId;

  /// Device identifier.
  DeviceIdentifier deviceIdentifier;

  /// The metadata to update.
  DeviceMetadata deviceMetadata;

  UpdateMetadataArguments();

  UpdateMetadataArguments.fromJson(core.Map _json) {
    if (_json.containsKey("deviceId")) {
      deviceId = _json["deviceId"];
    }
    if (_json.containsKey("deviceIdentifier")) {
      deviceIdentifier =
          new DeviceIdentifier.fromJson(_json["deviceIdentifier"]);
    }
    if (_json.containsKey("deviceMetadata")) {
      deviceMetadata = new DeviceMetadata.fromJson(_json["deviceMetadata"]);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final core.Map<core.String, core.Object> _json =
        new core.Map<core.String, core.Object>();
    if (deviceId != null) {
      _json["deviceId"] = deviceId;
    }
    if (deviceIdentifier != null) {
      _json["deviceIdentifier"] = (deviceIdentifier).toJson();
    }
    if (deviceMetadata != null) {
      _json["deviceMetadata"] = (deviceMetadata).toJson();
    }
    return _json;
  }
}
