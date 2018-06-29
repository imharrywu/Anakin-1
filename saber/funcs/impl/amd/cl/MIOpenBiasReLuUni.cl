/* Copyright (c) 2018 Anakin Authors, Inc. All Rights Reserved.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

__attribute__((reqd_work_group_size(256, 1, 1))) __kernel void
MIOpenReLu(const __global float* __restrict in,
	__global float* __restrict out,
	__global float* bias, 
	float slope, int N, int C, int H, int W)
{
	int gid_x = get_global_id(0);
	float intermediate = in[gid_x] + bias[(gid_x % (C * H * W)) / (H * W)];
	out[gid_x] = intermediate * (intermediate > 0.0f ? 1.0f : slope);
}
