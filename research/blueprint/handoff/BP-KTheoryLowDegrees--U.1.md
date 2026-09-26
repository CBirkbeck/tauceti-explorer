# Handoff: BP-KTheoryLowDegrees--U.1 (issue #764)

Author: **Codex — codex-7e92bd**, 26 September 2026. This is an own-job follow-up to the merged Milnor checkpoint #3096, under WORKERS’ correction rule. The original claim 5849435741 was confirmed by 5849436638. Fresh-main publication checks require that the issue remain available with this session as the last confirmed claimant, the outputs remain unchanged, and the review remain unclaimed. No new claim is taken concurrently with this session’s other active continuation.

## What this follow-up establishes

Four new declaration-sized nodes decompose the algebraic part of the real-circle SK₁ non-example:

1. `U.1/elementary-function-matrix-homotopy`: over continuous real functions on any topological space, elementary matrices admit a jointly continuous determinant-one matrix homotopy. Coefficient scaling, multiplication and the adjugate handle subgroup-closure induction. Neither a Banach norm nor compactness is required.
2. `U.3/circle-evaluation`: the ring map to continuous real functions on Mathlib’s `Circle`, with five API items and three tests fixing the basepoint, positive orientation and polynomial evaluation.
3. `U.3/circle-evaluation-rotation`: the entrywise image is the positive column-vector rotation, with the sign fixed explicitly.
4. `U.3/circle-trivial-class-based-contraction`: a trivial stable K₁ class forces an elementary relation at some finite N≥2, hence a contraction. Multiplying by the adjugate at the circle’s basepoint fixes that point throughout the homotopy.

The original `U.3/SK1-real-circle-nonzero` ID is retained. Its conclusion is noninjectivity of the canonical determinant, without inferring nonisomorphism of abstract groups. Its proof uses the smaller sufficient direction of K-book III.1.5. The full Banach identity-component theorem and a computation of π₁(SO) are not needed for this argument.

The remaining topological obstruction is **not closed**. Tau Ceti already supplies the compact Spin covering map and a path from 1 to its distinct scalar −1; Mathlib supplies endpoint invariance under relative homotopy lifting. The coordinate comparison of that path’s projection with the stabilized positive rotation remains explicit. With the pinned conjugation convention q v star(q), the ordered pair (e₁,e₀) gives positive rotation; using (e₀,e₁) reverses it. The requested continuous SL-to-SO retraction belongs to **LieGroups layer 9**, whose Cartan/Iwasawa decomposition explicitly includes real SL_n. No generic Lie-group or Spin theory is re-planned here.

The additional assertion that the real circle ring is Dedekind is now a separate gap for the U.4 non-example. It is not a hypothesis of the SK₁ nontriviality theorem itself. Preserve this application target and prove it before using the example to refute general Dedekind-domain vanishing.

## Preserved work and inventory

All **206 prior node identifiers** remain, and **205 prior node objects** are unchanged, including the full 17-node Milnor patching development and the Morita decomposition. All ten inherited source findings, eight existing requests and 387 previous baseline records remain unchanged. This follow-up is not an independent review of that inherited mathematics.

The packet has **210 nodes**: 16 definitions, 37 constructions, 80 lemmas, 59 theorems, 8 comparisons and 10 applications; **426 API items**, **222 unit-test specifications**, **44 planets** and **408 baseline declarations**. There are **five gaps and nine requests**. No whole stage is closed, and every implementation status remains unchecked.

## Validation

- The blueprint checker with the pinned declaration index reports **zero errors and zero warnings**. The new definition/API/test names agree with the suggested file, and the revised document states the same contracts.
- The **full suggested Lean file compiled** with Lean 4.34.0-rc2: **zero errors and 714 warnings**, all uses of proof placeholders. This is signature elaboration, not implementation.
- The 49 imported Tau Ceti modules use the isolated objects built from f790474 in the preceding Milnor pass. Their source audit is unchanged. The current compile freshly byte-compared all **8483 reached Mathlib sources** with 082e2d3 before using cached objects. The added Spin citations were read at the pin; they are not new prototype imports.
- The explicit internal dependency graph is checked for acyclicity. The inherited cross-roadmap cycle gaps remain; whole-atlas acyclicity is not claimed.
- The canonical Tau Ceti supplier-stage ID is in `unresolvedUpstreamPrerequisites`, the open request and the precise gap. The current checker treats every `tauceti:` prerequisite as a library declaration before considering stage IDs. No fictional declaration or replacement alias is used, and no closure claim depends on this workaround.
- Fresh publication guards at main `5113f14021f11cd2489575d978bf2de7d8ffd0d9` matched all 19 captured input blobs and all four output blobs; the issue body and last confirmed claim were unchanged, and review #441 remained unclaimed. Exact-file intake accepted four files with zero problems. Only the four authorized deliverables are published; no git commands were used.

## Reading and ownership

Fresh source reading: Weibel’s author-hosted combined K-book draft of 29 August 2013, PDF pp.192–193 / printed pp.184–185, III.1.5 with its proof and Examples III.1.5.1–4. Its SHA-256 is `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`; public source: https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf. Only the elementary-path direction is used. No new source error is alleged; the inherited published-errata checks retain their original scope.

The new baseline statements were read in their actual pinned Lean files, including polynomial/quotient evaluation, Circle, the matrix adjugate identities and continuity, compact Spin covering and rotation modules, the Spin action convention, and covering homotopy lifting. Exact source hashes and line locators are in `continuationAudit.pinReads`. Read accepted RS-18, the reviewed AUDIT-29 U.3 row, the source roadmap, and the relevant LieGroups and SpinRepresentations supplier text. The preceding pass read the upstream GrothendieckEulerForms and JacobianChallenge models. Generic topology and Lie-group mathematics remains with its existing owners.

## Where to resume

Preserve the completed Morita and Milnor source decompositions and the companion Z.3 packet. Resolve the following precise gaps; their full statements and consumers are in the packet:

### The finite stable rotation obstruction and the SL-to-SO comparison

The elementary-path direction is decomposed by U.1/elementary-function-matrix-homotopy and U.3/circle-trivial-class-based-contraction; the converse Banach identity-component theorem is not needed for this non-example. For every N≥2, obtain the precise continuous retraction of determinant-one real matrices onto the pinned quadratic-form SO_N carrier from LieGroups layer 9 (request). Prove that the stabilized positive rotation, parametrized by Circle.exp(2πt), is the rightHom projection of spinRotationPath for (e₁,e₀), including orthonormality, fixed complementary coordinates, and the coordinate/topology comparison. The action convention is q v star(q), so (e₀,e₁) gives the opposite orientation. The required covering map, compactness, the path endpoints 1 and negOne, their inequality, and endpoint invariance under homotopy lifting are actual pinned baseline declarations listed on the consuming theorem. No π₁ computation or Spin simple connectivity is required. The retraction and coordinate comparison have not been supplied, so this gap remains open. The canonical Tau Ceti supplier-stage ID is recorded in unresolvedUpstreamPrerequisites and requests: the current checker classifies every tauceti: prefix as a baseline declaration before considering stages; no fictitious declaration or alias is introduced.

Needed by: `KTheoryLowDegrees:U.3/SK1-real-circle-nonzero`.

### The real circle ring is Dedekind for the U.4 non-example

Prove that A=ℝ[x,y]/(x²+y²−1) is a Noetherian integrally closed integral domain of dimension at most one, with the exact IsDedekindDomain hypotheses required by the Mennicke and arithmetic non-examples. The SK₁ nontriviality theorem itself uses only the specified commutative quotient ring; its former parenthetical Dedekind assertion was not backed by a prerequisite. This application fact must be sourced and decomposed, potentially via the smooth affine real conic and complex Laurent-polynomial base change with descent. No descent theorem or geometric regularity criterion is asserted as baseline without reading it. Preserve the Dedekind-domain counterexample target in U.4; do not treat it as a proved consequence of SK₁≠1 alone.

Needed by: `KTheoryLowDegrees:U.3/SK1-real-circle-nonzero`, `KTheoryLowDegrees:U.4/sk1-mennicke-symbol`, `KTheoryLowDegrees:U.4/universal-mennicke-group`, `KTheoryLowDegrees:U.4/bass-milnor-serre`.

### The tame formula, the degree-m Hilbert product formula and the power reciprocity law (BMS (A.16), (A.19)–(A.21))

U.4's arithmetic Mennicke argument (BMS Theorem 3.5) uses (A.16) (a, b / 𝔭)_m = (a/𝔭)_m^{ord_𝔭 b} for a a unit at 𝔭 ∤ m, the product formula ∏_𝔭 (a, b / 𝔭)_m = 1 (Artin–Tate XII Theorem 13) and its consequence (A.21) (b/a)_m = ∏_{𝔭∤a}(a, b / 𝔭)_m. ClassicalArithmeticCompletion CA.1 plans exactly these (CA.1/tame-hilbert-symbol-formula, CA.1/hilbert-product-formula-of-degree-n, CA.1/power-reciprocity-law), but those nodes cite K2SymbolsBrauer:T.7 for the norm-residue symbol, and T.7 lies downstream of U.4 (CA.1 ← T.7 ← T.3:localization-comparison ← T.2:graded-map ← K3BlochGroups:V.2 ← ArithmeticKTheory:N.5 ← U.4), so U.4 cannot import them without a stage cycle; Tau Ceti ClassFieldTheory lists 'explicit power-reciprocity laws beyond quadratic reciprocity' as outside its scope. BMS's orientation of the symbol is the transpose of CA.1's. Resolution proposed in restructure.

Needed by: `KTheoryLowDegrees:U.4/power-reduction-non-totally-imaginary`, `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.

### Hilbert symbols on higher unit groups at primes above p (BMS (A.17)–(A.18))

The totally imaginary case of BMS Theorem 3.5 (Case 3, through Lemma 3.4(a)) needs (A.17): for k/ℚ_p finite containing μ_{p^n}, with e = ord_𝔭(p), (U_𝔭(h), U_𝔭 / 𝔭)_{p^n} = (U_𝔭(h+1), k^× / 𝔭)_{p^n} = μ_{p^{n−j}}, j = [h/e − 1/(p−1)]_{[0,n]}. BMS prove it (pp. 87–88) from Serre, Corps locaux, Ch. XIV Prop. 6 (p. 237) and Ch. XV Prop. 9 (p. 219), which are not freely available and were not read; no roadmap of the atlas plans the statement. Needed only for S = ∅ and F totally complex, where U.4 uses j = 0 (the pairing U_𝔭(h) × U_𝔭 → μ_{p^n} is onto).

Needed by: `KTheoryLowDegrees:U.4/power-reduction-totally-imaginary`.

### Comparison of classical relative K₁ with π₁ of the homotopy fibre (K-book IV.1.11, Ex. IV.1.15)

The source gives only a hint ('Use Ex. III.2.7 to show that π₁K(R → R/I) is isomorphic to the group K₁(R, I)'). Completing the five-lemma argument needs π₂BGL⁺ = K₂ (K2SymbolsBrauer T.1:plus) and the classical relative K₂-sequence (K2SymbolsBrauer T.6), which the helper places downstream of U.6 because K2SymbolsBrauer:T.1/k2-definition cites GeneralAlgebraicKTheory:K.2, whose combined stage requires K.2:low-degree-comparisons ← U.6. GeneralAlgebraicKTheory's decomposition node K.5/relative-K-theory-and-excision-boundary asserts the identification with the same exercise as its only source. See restructure.

Needed by: `KTheoryLowDegrees:U.6/relative-K1-homotopy-comparison`.

The nine requests are the inherited GrothendieckEulerForms, ClassFieldTheory, Chebotarev and GlobalNumberFields contracts, plus LieGroups layer 9. The historical H.3 plus-construction obstruction-theory source boundary is unchanged. Keep K₀ on left modules, K₁ automorphism classes on right modules with column vectors, finite sets of finite places for S, and the positive DVR normalization ∂(uniformizer)=1.
