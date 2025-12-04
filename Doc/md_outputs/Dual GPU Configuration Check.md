# Dual GPU Configuration Check

Extracted from PDF: Dual GPU Configuration Check.pdf

---

Dual GPU Configuration Check (ASRock B450 Steel
Legend)
Gemini

1. ASRock B450 Steel Legend (AM4)
•

•

•

Best Slot: Use the Ultra M.2 slot (usually labeled M2_1) which is connected directly to
the CPU's PCIe lanes. This slot fully supports NVMe (PCIe 3.0 x4) and will give you the
full, fast speed of a PCIe 3.0 drive.
Speed Note: A newer, faster PCIe 4.0 drive will work in this slot, but its speed will be
limited to the maximum of PCIe 3.0 (around MB/s). Since you are coming from an HDD,
this will still be a massive performance leap.
Compatibility Warning: This board is known to be picky with some specific NVMe
models (especially newer Gen4 drives) in the M.2 slots, even if they are technically
compatible. I strongly recommend checking ASRock's QVL (Qualified Vendor List)
or sticking to a popular, widely compatible PCIe 3.0 NVMe model.

💾 NVMe Compatibility and Installation Details
1. ASRock B450 Steel Legend (AMD B450 Chipset)
Feature
Primary
NVMe Slot
Max Speed
Key
Installation
Notes

Details
Ultra M.2 (M2_1)

PCIe 3.0 x4 (Up to MB/s)
⚠ Compatibility Risk: This board is notorious in the community for being
picky with M.2 NVMe drives that are not on its official Qualified Vendor List
(QVL), especially some newer Gen4 models.
Install into the M2_1 slot. Update the BIOS to the latest version, as ASRock
frequently releases updates to improve M.2 compatibility. Consider a popular,
Best Practice
reliable PCIe 3.0 drive like the Crucial P3 or WD Blue SN570 (often cited as
working well).
Bandwidth
Installing a drive in the M2_1 slot may disable the bottom PCIe x16 slot
Warning
(PCIE4), as they share bandwidth.

However, your specific motherboard, the ASRock B450 Steel Legend, has a critical limitation
concerning the PCIe lanes that you must manage carefully to successfully run two GPUs.

⚠ Dual GPU Configuration Check (ASRock B450 Steel
Legend)
Your motherboard has two large PCIe x16 slots:
1. PCIE1: The top slot, which is the fast one ().
2. PCIE4: The bottom slot, which is much slower ().
Here is the crucial constraint you must be aware of:
The primary NVMe M.2 slot (M2_1) and the second PCIe slot (PCIE4) share the same
limited PCIe lanes from the CPU.

The Conflict and the Solution
Current State
1. The 512GB NVMe SSD is
in the M2_1 slot.
2. The PCIE4 slot is disabled
while the NVMe is in M2_1.

Action Required
Resulting Configuration
MOVE the NVMe
The PCIE4 slot becomes available for
SSD.
your second 1080 Ti.
Move the NVMe to the Your two 1080 Ti GPUs can now be
slower M2_2 slot.
used in slots PCIE1 and PCIE4.

🛠 The Installation Plan
To run both 1080 Ti cards, you must move your NVMe drive:
1. Move NVMe SSD: Take the existing 512GB NVMe SSD out of the M2_1 (Ultra M.2)
slot and put it into the M2_2 slot.
o Result: Your OS drive speed will drop from ( MB/s) to ( MB/s). This is still
incredibly fast and a worthwhile trade-off to enable the second GPU.
2. Install GPUs:
o Install your first 1080 Ti into the top slot PCIE1 ().
o Install your second 1080 Ti into the bottom slot PCIE4 ().
3. VRAM Bonding: Both cards will combine their VRAM into a single, massive 22GB
pool for ComfyUI using strategies like MultiGPU offloading (where one GPU holds the
UNet, and the other holds CLIP/VAE, or they both share the latent space).

Dual GPU Speeds
Your final configuration for the GPUs will be:

•
•

GPU 1 (Top): (Full speed)
GPU 2 (Bottom): (Slower, but the speed is sufficient for ComfyUI's Multi-GPU
workflow where data transfer is less important than VRAM capacity).

Once the machine arrives, I can walk you through the software setup to ensure ComfyUI utilizes
both 1080 Ti cards to give you that incredible 22GB VRAM pool.
Would you like me to find the specific BIOS setting you'll need to enable for running the second
GPU or for optimizing the M.2 slots on the ASRock B450 Steel Legend?

CLAUDE:

Based on the official ASRock specifications and community discussions, the information is
MOSTLY TRUE but contains some important nuances and errors:

✅ What's Correct:
1. M.2/PCIe Conflict is TRUE: If M2_1 is occupied, PCIE4 will be disabled Vortez
ASRock
• . This is the critical constraint.
• M2_1 Specifications: The Ultra M.2 Socket (M2_1) supports PCIe Gen3 x4 (32 Gb/s)
ASRock
• - this is your fastest M.2 slot.
• PCIe Slot Configuration: PCIE1 is PCIe 3.0 x16, while PCIE4 is PCIe 3.0 x16 physical but
only runs at x4 lane width ManualsLib
3. .
4. The Workaround Works: Moving your NVMe from M2_1 to M2_2 will free up PCIE4
for your second GPU.

⚠ Important Corrections:

1. M2_2 Speed is WRONG: The document says M2_2 runs at PCIe 2.0 speeds, but M2_2
supports PCIe Gen3 x2 (16 Gb/s) ASRock
• - that's PCIe 3.0 x2, not 2.0. Still slower than M2_1's x4, but better than stated.
• M2_2 Trade-off: M2_2, SATA3_3 and SATA3_4 share lanes - if M2_2 is used, those two
SATA ports will be disabled Tom's Hardware Forum
• . Make sure you're not using SATA ports 3 and 4.
• Dual GPU Performance Expectations: The B450 chipset doesn't support PCIe bifurcation,
so PCIE4 runs at x4 mode and isn't CPU-direct but shared over the chipset with other
components Tom's Hardware Forum
3. . This means the second GPU will have limited bandwidth and may not perform
optimally for all dual-GPU workloads.

🎯 Bottom Line:
The proposed solution will work for enabling both GPUs, but the second GPU on PCIE4 will
only have x4 bandwidth through the chipset (not x8 CPU-direct like on higher-end boards). For
ComfyUI's VRAM pooling this may be acceptable, but be aware of the bandwidth limitations.
But the physcial movement/placement of the existing nvme and the two gpus is accurate?
Yes, the physical placement instructions are accurate:

Current State:
•
•
•

M2_1 slot: 512GB NVMe (currently installed)
PCIE1 (top x16 slot): First GPU
PCIE4 (bottom x16 slot): Disabled due to M2_1 being occupied

Required Physical Changes:
1. Remove NVMe from M2_1 → Install it in M2_2 ✅
2. Install GPU #1 in PCIE1 (top slot) ✅
3. Install GPU #2 in PCIE4 (bottom slot) ✅
This will work because moving the NVMe out of M2_1 releases the PCIe lanes that PCIE4
needs.

One Caution:
When you move the NVMe to M2_2, remember that SATA ports 3 and 4 will be disabled Tom's
Hardware Forum

. If you have any SATA drives connected to those specific ports, you'll need to move them to
SATA ports 0, 1, 2, or 5.
The physical installation plan is solid - it's the correct solution for your board's lane-sharing
limitation.

