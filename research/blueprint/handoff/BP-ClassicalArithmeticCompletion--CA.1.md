# Handoff: BP-ClassicalArithmeticCompletion--CA.1

Job: blueprint continuation of ClassicalArithmeticCompletion, stage CA.1 (Residues and reciprocity), issue #9665.
Worker: Claude (Opus 5.5), session claude-LlSjWs, 2026-10-14.

Deliverables:
- packet `research/blueprint/packets/ClassicalArithmeticCompletion--CA.1.json` (part `CA.1`, scope `[ClassicalArithmeticCompletion:CA.1]`, status `complete`)
- reader `research/blueprint/readmes/ClassicalArithmeticCompletion--CA.1.md`
- suggested Lean file `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.1.lean`

## What is done

The packet has 42 nodes: 5 definitions, 1 construction, 11 theorems, 1 comparison and 24 lemmas. It has 53 API items, 28 unit tests, 4 planets and 65 baseline declarations. `check_blueprint.py` reports 0 errors and 0 warnings. CA.1's coverage is `planned`. Every target the stage states is realised by a node of this packet or of the first-pass packet, with chains ending in the pinned libraries, in Tau Ceti roadmap layers (five requests) or in the two recorded gaps.

Each open item of the first pass's CA.1 coverage record is disposed of as follows.

1. **Degree-n norm-residue symbol (moved down from K2SymbolsBrauer T.7).** Planned as `local-norm-residue-symbol`, `archimedean-norm-residue-symbol` and `norm-residue-symbol-at-a-place` (definitions with API and tests), with four theorems: bimultiplicativity, Steinberg and skew symmetry; the norm criterion and nondegeneracy; functoriality; and the comparison with Class Field Theory's `localSymbol`. Source: Fesenko–Vostokov IV.5 (the author's free PDF), which uses exactly the pinned orientation (a, b) = Art(a)(ⁿ√b)/ⁿ√b and proves the tame formula (Theorem 5.3). This discharges the frontier of the first pass's three degree-n targets: they read (a, b)_v as `norm-residue-symbol-at-a-place`.
2. **Quartic reciprocity with its supplements.** Nine nodes on the first pass's power residue symbol with n = 4: primary Gaussian integers, the Jacobi and Gauss sums of a primary prime, reciprocity with a rational denominator, reciprocity for coprime coordinates, the law, and the supplements for i, −1 and 1 + i. Source: N. Xu's University of Chicago REU 2021 paper, §5 (public). The proofs that Xu defers to Ireland–Rosen are written out in the proof sketches. Every formula was checked by machine: all primary primes with |a|, |b| ≤ 12, 67 primary composites, and 266 coprime pairs for the law.
3. **The three inputs of Eisenstein reciprocity.** Six nodes at the contracts of the first pass's local request (Adhikari Propositions 4.2–4.6 and the relation before (25)). Stickelberger's relation comes from Katre's article in the same Bhaskaracharya proceedings (public), with the prime p = 2, which Katre omits, supplied (source issue E1102). The rest comes from Xu §6 and Adhikari §4.
4. **Koymans–Milovic items 3–4.** The completed symbol, the number-field quadratic law with μ₂ and μ_∞, μ₂ modulo 8, and periodicity modulo 8α (FIMR §2, arXiv v2). Norm compatibility of the power residue symbol is planned for every n and every finite extension.
5. **Calegari–Geraghty adapter.** `projective-zeros-of-a-binary-quadratic-form`.
6. **Independent-review frontier (12 first-pass targets).** Eight targets get 14 supporting lemma nodes, each a child (`parentStageId`) of the target it serves. The other four (the three degree-n theorems and Eisenstein reciprocity) are served by items 1 and 3.
7. **Explicit laws at the places above n.** Not planned in CA.1. No CA.1 target needs them, and HigherLocalFieldsAndHigherClassFieldTheory HL.4 owns explicit formulas for the wild Hilbert symbol, the one-dimensional case included. A `rescope` restructure entry records this; HL.4 imports `local-norm-residue-symbol`.

## For the assembly job

- In the first pass's `tame-hilbert-symbol-formula`, `hilbert-product-formula-of-degree-n` and `power-reciprocity-law`, add `ClassicalArithmeticCompletion:CA.1/norm-residue-symbol-at-a-place` as a prerequisite. Their gap "The degree-n norm-residue symbol in the Artin orientation is a CA.1-owned input" is then supplied.
- In the first pass's `eisenstein-reciprocity`, add `stickelberger-relation`, `stickelberger-unit-factor-of-a-primary-element` and `eisenstein-reciprocity-at-ideal-norms` as prerequisites. Its gap "The three unsupplied inputs of Eisenstein reciprocity belong to CA.1" is then supplied, and its request to CA.1 is answered.
- Each supporting lemma's `parentStageId` names the first-pass target it serves; add it to that target's prerequisites.
- The suggested file restates six first-pass declarations verbatim (`normEquationSymbol`, `ratSquarefreePart`, `powerResidueSymbol`, `powerResidueSymbolIdeal`, `IsPrimaryEisenstein`, `IsEisensteinPrimary`) so that it elaborates on its own. It also restates three first-pass API items under their first-pass names, now promoted to nodes: `ratSquarefreePart_mul_sq`, `isPrimaryEisenstein_add_mul_iff` and `exists_unique_associated_isPrimaryEisenstein`. Keep one copy of each.
- The packet proposes sub-layers CA.1a, CA.1b and CA.1c in `restructure`, because CA.1 now has ten candidate planets.

## What remains (precisely)

- **Gap: public proof of the 1 + i supplement.** ((1 + i)/λ)_4 = i^{(a − b − b² − 1)/4} rests on the node's own proof sketch and machine checks. Obtain Gauss's second memoir on biquadratic residues (§§68–76, public domain) or another public proof, and compare.
- **Gap: the sign ε** in `norm-residue-symbol-and-the-cohomological-symbol`. Compute it against the conventions of Class Field Theory's `kummerClass`, Tate cup product and `h2MuEquivZMod_mixed`; the unramified test pins it. Milne III Remark 4.5 settles it only for Milne's conventions.

## Requests to other roadmaps

All to Tau Ceti layers, none upward: Class Field Theory Layers 5, 6, 7 and 10, and Quadratic Form Invariants 6C. Each request names the exact declarations used.

## Moves down

The degree-n norm-residue symbol moves from K2SymbolsBrauer T.7 to CA.1, completing a move the first pass recorded. Φ, Stickelberger's relation and the residue identity are owned here, and FiniteFieldsAndCharacterSums FF.1 imports them.

## Lean

`lean-check` on the suggested file (620 lines) at Mathlib 082e2d3 and Tau Ceti f790474 exits 0, with 73 warnings, all "declaration uses `sorry`". The light definitions have real bodies: `IsPrimaryGaussian`, `archQuadFactor`, `dyadicQuadFactor`, `completedQuadSym` and `binaryQuadraticZeros`. Sorry-bodied data appears only in `stickelbergerPhi` and in the restated first-pass symbols. The norm-residue symbol and its theorems are stated in a comment block with their intended signatures, because the local Artin map is not at the pin.

## Sources read (all public; SHA-256 in the packet)

Xu (REU 2021) §§3–6; Katre (Bhaskaracharya 2000) pp. 75–92; Clausen, lectures 15–16; Fesenko–Vostokov IV.5 and VII.5 (scope); FIMR arXiv v2 §2; Koymans–Milovic arXiv v1 §§2.1 and 5; Calegari–Geraghty §8.7; Adhikari §§3–4; Shastri §§5–9; Relyea §§1.2 and 4.1; Milne CFT III.4 and VIII.5; Shoup Exercise 1.30.

Not read: Ireland–Rosen, Lemmermeyer and Washington (not public); Gauss's second memoir on biquadratic residues; Neukirch–Schmidt–Wingberg (the download from the authors' page failed).

## Source issues

E1101–E1109, all new. E1101: Xu's coordinate criterion for primary Gaussian integers is wrong as printed. E1102: Katre's gap at p = 2. E1108: Shastri's Steinberg proof covers only the full-degree case. The rest are misprints. The first pass's E203 and E204 (Relyea) are answered by `quartic-reciprocity` and `primary-gaussian-integer`.
