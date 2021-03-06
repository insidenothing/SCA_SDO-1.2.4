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

/* $Rev: 524004 $ $Date: 2007/08/24 15:20:20 $ */


#include "commonj/sdo/TypeDefinitions.h"
#include "commonj/sdo/TypeDefinitionsImpl.h"

namespace commonj
{
    namespace sdo
    {
        TypeDefinitions::TypeDefinitions()
        {
            typedefinitions = new TypeDefinitionsImpl();
        }
        
        TypeDefinitions::~TypeDefinitions()
        {
            if (typedefinitions != 0) delete typedefinitions;
        }

        void TypeDefinitions::copy (const TypeDefinitions& tds)
        {
            if (typedefinitions != 0) delete typedefinitions;
            typedefinitions = new TypeDefinitionsImpl(*(tds.typedefinitions));
        }
 
        TypeDefinitions::TypeDefinitions(const TypeDefinitions& tds)
        {
            copy(tds);
        }

        TypeDefinitions::TypeDefinitions(const TypeDefinitionsImpl& tds)
        {
            typedefinitions = new TypeDefinitionsImpl(tds);
        }

        void TypeDefinitions::addTypeDefinition(TypeDefinition& t)
        {
            if (typedefinitions == 0)
            {
                typedefinitions = new TypeDefinitionsImpl();
            }

            typedefinitions->types[
                typedefinitions->getTypeQName(
                     t.getUri(),t.getName())] = (TypeDefinitionImpl&)(*t.getTypeDefinition());
        }

        TypeDefinitionsImpl& TypeDefinitions::getTypeDefinitions()
        {
            if (typedefinitions == 0)
            {
                typedefinitions = new TypeDefinitionsImpl();
            }
            return *typedefinitions;
        }

        unsigned int TypeDefinitions::size()
        {
            return typedefinitions->types.size();
        }
    } // End - namespace sdo
} // End - namespace commonj
