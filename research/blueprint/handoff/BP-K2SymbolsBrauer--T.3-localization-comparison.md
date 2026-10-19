# BP-K2SymbolsBrauer--T.3-localization-comparison

Completed planning pass for #10813, by Codex, session `codex-QcGmv4`,
2026-10-19. Branch: `codex-QcGmv4-k2-localization-comparison`.
This is a completed scoped blueprint, not a checkpoint or a claim of
formalization. Only its packet, reader, suggested file and this note changed.

## Delivered

- Three new target-level nodes: all-degree product/residue comparison,
  the total Milnor residue homomorphism, and the comparison of Milnor
  unit-part specialization with Quillen product specialization. The
  construction has nine API entries and five discriminating tests.
- The four existing local, Dedekind and transfer targets in
  `K2SymbolsBrauer--T.3` retain their identifiers and ownership. Higher
  Milnor residues, specialization, finite support, product signs and norms
  remain imported from T.3:symbols and T.4. No duplicate nodes were added.
- The reader states all comparison maps, the exact Dedekind row,
  finite-transfer hypotheses, the all-finite-extension comparison proof
  interface, supplier contracts and worked acceptance values.
- Three new planets; the existing Localisation theorem for K₂ planet is
  retained, making four in this sublayer.

## Conventions that assembly and consumers must preserve

Use the ordered product map Φ₂=θ₂♮m from
`K2SymbolsBrauer:T.2/graded-map-degree-two-identification`, rather than an
unspecified Matsumoto/Quillen identification. If θ₂ is the Hurewicz
normalization and θ₂♮=θ₂∘ε, keep its constant torus sign ε explicitly.
The actual right-linear boundary satisfies D₁[π]=1 and
DₙΦₙ=(−1)ⁿ⁻¹Φₙ₋₁rₙ, so D₂ is inverse tame, while δ₂=−D₂ is the
roadmap tame symbol. With θ₂ the boundary formula is −εr₂.

Transporting the displayed exact row to the roadmap residue arrow negates
both the residue coordinate and its outgoing arrow. The Milnor unit-part
specialization uses the right [−π] formula. The K-book's left [π]
specialization has the correction rₙ(x){−1}; at π it gives −1 rather than
the multiplicative identity. Finite pushforward uses residue norms without
an extra e. Pullback residues use e; norm valuations use f.

Retain the maintainer's order T.3:symbols → T.4 →
T.3:localization-comparison and the earlier text move for higher residues
and finite support. S.3 and E.3 consume this comparison; no reverse
dependency is introduced. Their normalization notes and the stage changes
are recorded in the packet; their files were outside this job's scope.

## Closure boundary

Every target in the sole scoped stage is planned. The packet is `complete`
with coverage `planned`, not `closed`. Two precise requests remain:

- K.3's torsion Serre quotient for Dedekind domains, with its localization
  and finite-transfer naturality. The abstract localization theorem and
  named index/product/base-change nodes already exist as plans and are
  imported directly.
- The inherited K.7 degree-(1,1) comparison of the biexact and plus products
  requested by T.2. T.2 owns the unit-symbol theorem and its torus sign.

The two inherited gap records retain T.2:symbols' finite-classical and
stable-witness inputs and T.4's arbitrary-residue complete-DVR support
brief (Local Fields and Ramification, Part II, proposed DVR.0–DVR.3).
No unregistered proposed supplier id is an executable prerequisite. The
latter gap belongs to the earlier Milnor norm/residue chain; the finite
Dedekind Quillen square and the two-transfer comparison by arbitrary field
base change do not require it. The full routing brief remains in the
existing T.3 packet and is not duplicated here.

## Sources and libraries checked

Read the relevant K-book III.6–7 and V.3–6 statements and proofs, including
the index/right-product exercises, V.6.6.1's boundary calculation and
V.6.6.4's specialization paragraph. All repository statements are in our
own words. The official author-hosted 29 August 2013 PDF has SHA-256
`a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
No new source error is asserted; existing E9/E11 conventions are imported.

Read AUDIT-29 / REV-AUDIT-29 and the eleven cited baseline declarations at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular, the pinned
Dedekind Support.finite theorem controls poles: nonzero-order support needs
its application to both a and a⁻¹.

Checked the current read-only AlgebraicCurves and LocalFieldsRamification
reader/suggested interfaces and the current Tau Ceti source tree, including
the roadmap directions newer than the atlas snapshot. Current commits are
recorded in the packet's audit. Existing place/divisor, norm and local-field
infrastructure is imported; no such target was replanned and neither
read-only tree was built or changed.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.3-localization-comparison.json`
  with the shared pinned declaration index: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/K2SymbolsBrauer--T.3-localization-comparison.lean`:
  **exit 0**, only nine proof-placeholder warnings. Available memory was
  83 GB before the check. The file has 96 lines and no data definitions.
- The compact Lean file contains calibration statements over existing
  units, dependent direct sums and determinant norms. The actual
  Milnor/Quillen targets and total-residue API/tests are explicitly
  README-only because their carriers are absent at the pins.

All four deliverables are self-contained; no scratch file is needed by the
next worker. Independent review should focus on the all-degree product
sign, the two specialization formulas and the normalization transport of
the imported exact row.
