﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppPersona.ServiceReference {
    using System.Runtime.Serialization;
    using System;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Persona", Namespace="http://schemas.datacontract.org/2004/07/WcfService1")]
    [System.SerializableAttribute()]
    public partial class Persona : object, System.Runtime.Serialization.IExtensibleDataObject, System.ComponentModel.INotifyPropertyChanged {
        
        [System.NonSerializedAttribute()]
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string apellidoField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string cedulaField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string edadField;
        
        [System.Runtime.Serialization.OptionalFieldAttribute()]
        private string nombreField;
        
        [global::System.ComponentModel.BrowsableAttribute(false)]
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData {
            get {
                return this.extensionDataField;
            }
            set {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string apellido {
            get {
                return this.apellidoField;
            }
            set {
                if ((object.ReferenceEquals(this.apellidoField, value) != true)) {
                    this.apellidoField = value;
                    this.RaisePropertyChanged("apellido");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string cedula {
            get {
                return this.cedulaField;
            }
            set {
                if ((object.ReferenceEquals(this.cedulaField, value) != true)) {
                    this.cedulaField = value;
                    this.RaisePropertyChanged("cedula");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string edad {
            get {
                return this.edadField;
            }
            set {
                if ((object.ReferenceEquals(this.edadField, value) != true)) {
                    this.edadField = value;
                    this.RaisePropertyChanged("edad");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string nombre {
            get {
                return this.nombreField;
            }
            set {
                if ((object.ReferenceEquals(this.nombreField, value) != true)) {
                    this.nombreField = value;
                    this.RaisePropertyChanged("nombre");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReference.IPersonaWS")]
    public interface IPersonaWS {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPersonaWS/GetPersona", ReplyAction="http://tempuri.org/IPersonaWS/GetPersonaResponse")]
        AppPersona.ServiceReference.Persona GetPersona(string cedula, string nombre, string apellido, string edad);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPersonaWS/GetPersona", ReplyAction="http://tempuri.org/IPersonaWS/GetPersonaResponse")]
        System.Threading.Tasks.Task<AppPersona.ServiceReference.Persona> GetPersonaAsync(string cedula, string nombre, string apellido, string edad);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IPersonaWSChannel : AppPersona.ServiceReference.IPersonaWS, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class PersonaWSClient : System.ServiceModel.ClientBase<AppPersona.ServiceReference.IPersonaWS>, AppPersona.ServiceReference.IPersonaWS {
        
        public PersonaWSClient() {
        }
        
        public PersonaWSClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public PersonaWSClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public PersonaWSClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public PersonaWSClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public AppPersona.ServiceReference.Persona GetPersona(string cedula, string nombre, string apellido, string edad) {
            return base.Channel.GetPersona(cedula, nombre, apellido, edad);
        }
        
        public System.Threading.Tasks.Task<AppPersona.ServiceReference.Persona> GetPersonaAsync(string cedula, string nombre, string apellido, string edad) {
            return base.Channel.GetPersonaAsync(cedula, nombre, apellido, edad);
        }
    }
}
