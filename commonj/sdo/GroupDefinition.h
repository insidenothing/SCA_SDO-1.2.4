/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 *   
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

/* $Rev: 452786 $ $Date: 2007/08/24 15:20:21 $ */

#ifndef _GROUPDEFINITION_H_
#define _GROUPDEFINITION_H_

#include "commonj/sdo/disable_warn.h"
#include "commonj/sdo/GroupEvent.h"

#include "list"


namespace commonj
{
    namespace sdo
    {
        
       
/**
 * TypeDefinition holds information gathered from parsing the
 * XSD and used for creating Types
 */
        class GroupDefinition
        {
            
        public:
            GroupDefinition();
            virtual ~GroupDefinition();
        
    
            SDOXMLString name;
            SDOXMLString uri;
            bool isAttributeGroup;
            std::vector<GroupEvent> events;

        };
    } // End - namespace sdo
} // End - namespace commonj


#endif //_TYPEDEFINITION_H_
