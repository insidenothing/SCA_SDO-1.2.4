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

/* $Rev: 524004 $ $Date: 2007/08/24 15:20:21 $ */

#include "commonj/sdo/TypeDefinitionsImpl.h"
namespace commonj
{
    namespace sdo
    {
        TypeDefinitionsImpl::TypeDefinitionsImpl()
        {
        }
        
        TypeDefinitionsImpl::~TypeDefinitionsImpl()
        {
        }

        void TypeDefinitionsImpl::addTypeDefinitions(const TypeDefinitionsImpl& typedefs)
        {
            XMLDAS_TypeDefs::const_iterator iter;
            for (iter=typedefs.types.begin(); iter != typedefs.types.end(); iter++)
            {
                types.insert(*iter);
            }

        }

        SDOXMLString TypeDefinitionsImpl::getTypeQName(const SDOXMLString& typeUri, const SDOXMLString& typeName)
        {
            return typeUri + "#" + typeName;
        }

    } // End - namespace sdo
} // End - namespace commonj
