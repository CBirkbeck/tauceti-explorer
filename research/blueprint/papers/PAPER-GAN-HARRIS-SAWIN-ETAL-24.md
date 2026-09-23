# Gan–Harris–Sawin–Beuzart-Plessis: extraction after independent review

**Partial extraction; independent verdict: revise.** Codex `codex-7e92bd` reviewed [issue #1357](https://github.com/CBirkbeck/tauceti-explorer/issues/1357) on 23 September 2026. The [complete review](../reviews/REV-PAPER-GAN-HARRIS-SAWIN-ETAL-24.md) records the item-by-item checks, exact library declarations, source findings, source hashes and executable diagnostics.

The [published article](https://doi.org/10.1017/fmp.2024.10), Forum of Mathematics, Pi 12 (2024), e13, pp.1–41, was read in full. It studies essentially tempered refinements of semisimple local parameters, ramification of pure supercuspidal parameters, controlled function-field globalizations, base change, and conditional close-fields applications. These remain formalization targets with the source gates below.

The corrected inventory has **90 items: 4 library, 10 planned and 76 missing**. Every missing item is independently searched and routed exactly once. All 14 original source findings and 12 additions are recorded with independent verdicts. The 11 open gaps prevent a completion claim. Only route 7, the narrow coalesced request for real-indexed reductive filtrations, is accepted. Rejected routes are held for revision and are not instructions to begin design.

## Main statement boundaries

The WD dictionary requires finite inertia, semisimple Frobenius, the prescribed L-group action, and an algebraic SL₂ restriction. For geometric Frobenius the relation is Ad(Fr)N=q^{-1}N. Purity for arbitrary faithful realizations is not representation independent: the G_m parameter Fr↦q is pure in its standard representation, but its direct sum with the trivial representation has two different weights. A correct intrinsic central-weight convention is an open supplier. The main theorems cannot import the false “some/every faithful” equivalence.

The equal-characteristic ramification targets keep G unramified and not a torus, q>5, and the exact compact-induction or small-subgroup hypothesis. Theorem 7.2’s restriction-of-scalars character isolation remains open when the effective character order is at most four. The matrix-entry proof requires repairs in characteristic p and for multipliable relative roots. The rank-one trace lemma requires tameness at both boundary points. GL_n ramification requires n≥2 and the appropriate case-dependent residue bound. The principal-series endpoint after base change remains distinct from loss of supercuspidality for GL₁.

Depth-zero purity retains the motivic/comparison and generic weight inputs. The no-incorrigibility assertion excludes tori and requires the hypotheses throughout the base-change tower. The p-adic consequences retain a positive integer n, the A_n domain and Conjecture 11.7. Integer cutoff and real depth are separate notions. Questions 11.10–11.11 are recorded as questions, not dependencies available to proofs.

## Existing imports

The pinned libraries already supply finite cyclic Kummer theory, continuous Kummer classes and their injection, finite abelian character extension and character orthogonality. Their infinite/topological and representation-theoretic adapters remain explicit. Linear WD objects belong to ArithmeticGaloisRepresentations:R01.2; geometric monodromy and its filtration to LefschetzPencilsAndVanishingCycles:LPV.1; weights to DeligneWeightsAndPurity:DWP.5. The existing Fintzen candidate imports mixed-characteristic GL_m type theory from EndoscopicTransferAndUnitaryTraceComparison:ET.6. No second version of any of these foundations is authorized.

## Route instructions and decisions

### 1. Global shtukas and Langlands over function fields, Part II: tempered local parameters and the ramification of supercuspidal parameters — reject

Reject: the main Part II still lacks intrinsic purity, a valid matrix-bound proof, the nonsplit orthogonality argument and several essential source suppliers. Reusable globalization/close-fields pieces need shared ownership and full APIs before design. Corrected target statements and open questions are retained without claiming proof closure.

Import Global shtukas and Langlands over function fields (GlobalShtukasAndFunctionFieldLanglands:GS.5–7), Global function fields, reciprocity and automorphic foundations (FunctionFieldArithmetic:FA.4–6), Deligne weights, purity and the Weil bounds (DeligneWeightsAndPurity:DWP.5), Smooth representations of local groups (SmoothRepresentationsOfLocalGroups:SR.0–4), Arithmetic Galois representations (ArithmeticGaloisRepresentations:R01.2), and Reductive groups, Part II (ReductiveGroupsPartII:RG2.1–4). This candidate is held for revision. Its targets are the corrected item statements: unique essentially tempered refinement for discrete series, ramification of pure compactly induced supercuspidals for unramified non-tori over F_q((t)) with q>5, wild ramification under the precise small-subgroup condition, and the unramified principal-series conclusion under Levi compact-induction hypotheses. The GL_n ramification statements require n≥2 and the case-dependent residue bounds; the principal-series-after-base-change endpoint retains n=1. The no-incorrigibility statement excludes tori and quantifies hypotheses along the tower. Depth-zero purity and the p-adic consequences retain their comparison assumptions; Conjecture 11.7 and Questions 11.10–11.11 are open. Before design, close the intrinsic purity convention, matrix-bound proof, Weil-restriction character isolation, HNY/XZ and globalization suppliers. Extract each Poincaré-series, pseudo-coefficient, elliptic-orthogonality and close-fields carrier with its own API and proof dependencies; assess which reusable pieces belong to the shared owners rather than this consumer. Do not interpret the present route as permission to duplicate Kummer or finite-character infrastructure.

### 2. Kloosterman sheaves and Bessel F-isocrystals for reductive groups — reject

Reject: the current candidate is the appropriate coalescing lead, but the general all-prime application and automorphic comparison are not source-closed. HNY gives zero Ad invariants, not the false linear irreducibility demanded by the input.

Coalesce with Kloosterman sheaves and Bessel F-isocrystals for reductive groups (KloostermanSheavesAndBesselIsocrystals), proposed by PAPER-XU-ZHU-22. Import its existing automorphic data, Hecke eigen local systems, group-valued monodromy and companion constructions, together with Global shtukas and Langlands over function fields (GlobalShtukasAndFunctionFieldLanglands:GS.0–1,GS.5,GS.7). In the split almost-simple HNY setting the verified target is zero adjoint inertia invariants and Swan∞(Ad Kl)=rank(Ĝ) under the source prime restrictions, plus its simple-wild description under p∤|W|. The GHS application needs a separately verified all-prime Xu–Zhu extension and the transfer from its automorphic construction to the Genestier–Lafforgue parameter. Do not require linear irreducibility of Ad, which is false for product groups. Resolve those exact supplier contracts before this general application is activated.

### 3. Smooth representations of local groups, Part II: types, depth and the construction of supercuspidal representations — reject

Reject this addition: the existing Fintzen candidate is already independently accepted; its reviewed work is not rejected here. The added Stevens/BK equal-characteristic contracts are unread, and mixed-characteristic GL_m must be imported from ET.6. Do not activate a second classification from this paper.

Coalesce with Smooth representations of local groups, Part II: types, depth and the construction of supercuspidal representations (SmoothRepresentationsPartII), proposed and independently reviewed in PAPER-FINTZEN-21. Import its existing tame-group data, types, covers, compact induction and exhaustion. For connected reductive G splitting tamely over F with p∤|W|, the final Fintzen endpoint is that every smooth complex supercuspidal is a Yu compact induction from an open subgroup compact modulo the center. Import smooth categories, induction and Bernstein theory from SmoothRepresentationsOfLocalGroups:SR.0–3, and valued roots/buildings/Moy–Prasad refinements from ReductiveGroupsPartII:RG2.1–3. Import mixed-characteristic GL_m simple type and segment theory from EndoscopicTransferAndUnitaryTraceComparison:ET.6. The GHS additions must separately read Stevens’s odd-residue-characteristic classical-group contract and the equal-characteristic Bushnell–Kutzko supplier, then construct only the missing comparisons. Do not rebuild ET.6, or identify the paper’s compact-inducing data with the definition of every Bernstein s-type.

### 4. Global shtukas and Langlands over function fields, Part II: Ramanujan and Arthur weight constraints — reject

Reject: the cited weight input combines the local unitary-spherical and global propagation suppliers. Match the exact updated Ciubotaru–Harris theorem before adding this application to the global Part II.

Coalesce the global application with Global shtukas and Langlands over function fields, Part II: Ramanujan and Arthur weight constraints (GlobalShtukasPartIIRamanujanArthur), proposed by PAPER-CIUBOTARU-HARRIS-26. Import GlobalShtukasAndFunctionFieldLanglands:GS.5–7 and DeligneWeightsAndPurity:DWP.5 for the parameter and its local weights. Import the local generic-unitary complementary-series and root-system tests from the distinct candidate Smooth representations of local groups, Part II: unitary spherical representations (SmoothRepresentationsPartIIUnitarySpherical). Before activation, derive the exact inequality used in GHS §9 from the current Ciubotaru–Harris source, including relative root system, central normalization, genericity, unitarity and geometricity. The one-line claim that any two integral weights cannot differ by two is not a substitute for that contract. The global propagation and local classification are different suppliers and must not be reconstructed twice.

### 5. Smooth representations of local groups, Part II: mod p Bernstein centers, the Brauer homomorphism and local cyclic base change — reject

Reject: Feng’s mod-p coefficient base change does not supply the characteristic-zero tempered BFHKT/Henniart–Lemaire assertions. Split the latter and establish an exact common-owner contract.

Hold this coefficient-sensitive base-change route for redesign. The proposed Smooth representations of local groups, Part II: mod p Bernstein centers, the Brauer homomorphism and local cyclic base change (ModPBernsteinCentersAndLocalBaseChange), from PAPER-FENG-24, has characteristic-p coefficients with residue characteristic different from p and explicit prime restrictions. GHS §10 invokes characteristic-zero tempered base-change sets, a large-prime-degree Böckle–Feng–Harris–Khare–Thorne theorem and Henniart–Lemaire for GL_n. These are not the same theorem. Import the existing Hecke, smooth-category and Bernstein-center foundations from SmoothRepresentationsOfLocalGroups and the global excursion suppliers from GlobalShtukasAndFunctionFieldLanglands. Read the two cited characteristic-zero contracts separately, check the Labesse and ML.5 ownership boundaries and design a shared exact supplier. No mod-p-to-characteristic-zero equivalence is inferred from a similar title.

### 6. LanglandsParameterStacks — reject

Reject: LP0 currently plans continuous Weil cocycles, not an arbitrary nilpotent/SL₂ WD object or the central-weight purity comparison. Import the linear carrier from R01.2 and the filtration from LPV.1, and establish the group-valued extension boundary.

LP0 owns L-parameters of W_E valued in the L-group (continuous cocycles and their conjugacy). The Weil–Deligne form (ρ, N), the Gross–Reeder dictionary with parameters of W_F × SL_2 and the tempered and essentially tempered conditions are the same objects with the monodromy recorded, and are used by every local Langlands roadmap. PAPER-GAN-SAVIN-23-B routed Φ(G) with component groups for G_2 to ExceptionalThetaCorrespondencesForG2; LP0 is the better owner of the general definition, and that item should import it from here. Independent review: import linear WD objects from Arithmetic Galois representations (ArithmeticGaloisRepresentations:R01.2) and monodromy filtrations from Lefschetz pencils and vanishing cycles (LefschetzPencilsAndVanishingCycles:LPV.1). LP0 does not yet own the nilpotent/SL₂ extension, and the central-weight convention remains open.

### 7. ReductiveGroupsPartII — accept

Accept the narrow source request: RG2.1–3 owns valued roots, buildings and parahorics. Coalesce the real-indexed filtration request with the already reviewed Fintzen request. This is no new supercuspidal classification and does not accept Lemma 5.1’s invalid lifting or nonreduced-root arguments.

Coalesce with the accepted Fintzen source request for valued roots, buildings and real-indexed Moy–Prasad refinements. The matrix-entry theorem remains a consumer target, not an already proved generic root-group fact.

### 8. AdelicAlgebraicGroups — reject

Reject pending source verification: AA.4 is the correct approximation owner, but generic weak approximation does not certify the stated open finite-index closure for all connected reductive function-field groups. The positive-characteristic source proof must be supplied.

Request the exact finite-index closure theorem used in Appendix A within the approximation owner. The positive-characteristic source contract must be established; the current generic AA.4 description does not certify it.

## Open gaps

| Gap | Required resolution |
| --- | --- |
| G1: Intrinsic purity | Resolve E15, the central-weight convention and its compatibility with the main results; fixed-faithful purity is not representation independent. Read Taylor–Yoshida/Arthur at the actual hypotheses. |
| G2: The matrix-entry bound | Give a characteristic-p proof of Lemma 5.1 with coherent affine-root signs, all nonreduced root groups, torus filtration and a correct degree-zero coefficient. E19–E21 refute steps of the current proof. |
| G3: Restriction-of-scalars character isolation | Repair E1 for n>1 and d≤4; neither proposed reduction to k_n nor a new character has been proved compatible with the GL parameter here. |
| G4: Kloosterman and global purity suppliers | Read the all-prime Xu–Zhu extension and Sawin–Templier/Gan–Lomelí source proofs; zero Ad invariants is not linear Ad irreducibility. |
| G5: Trace-formula globalization | Read BDK, DKV, the elliptic-orthogonality manuscript or a public replacement, and the positive-characteristic approximation proof. Correct the regular-character coefficients and invariant-vector construction. |
| G6: Depth-zero comparison | Close the motivic FS_mot and Li–Huerta comparison input, check the hyperspecial-induced globalization domain and exact Ciubotaru–Harris weight consequence. |
| G7: Types and base change | Verify Stevens and BK in the exact equal-characteristic scope, split BFHKT from Henniart–Lemaire, and keep characteristic-zero tempered base change separate from Feng’s mod-p construction. |
| G8: Close-fields carrier and endpoints | Read Deligne’s full comparison, match non-split actions if used, establish the depth-zero I₁ adapter, and preserve conjectural landing/commutativity and both open questions. |
| G9: Complete extraction closure | Split the remaining bundled inputs (including global/local parametrization properties, uniqueness/equivalence, field CFT/density, the two base-change suppliers and spectral/induction/Satake foundations). Extract omitted carriers: global L-group local systems and irreducibility, cuspidal support, generic/Whittaker data, pseudo-coefficient/test-function spaces, central characters, orbital integrals and the precise small-subgroup models. Every new definition needs source-derived API, tests and one supplier; the current 90 items are not a complete no-gap inventory. |
| G10: Finite and Kummer adapters | Prove the infinite exponent-bounded compositum/continuous character equivalence from existing Kummer leaves, the geometric Frobenius reciprocity normalization and the constrained character extension on the actual repeated-coordinate S. |
| G11: Torus-containment inference | Resolve E26 using an actual additional property of the global automorphic parameter; an abelian semisimple subgroup of PGL₂ need not be toral. |

## Source corrections

| Finding | Locator | Kind / effect | Correction |
| --- | --- | --- | --- |
| E1 | §7.1, proof of Theorem 7.2, (7.5)–(7.7), p. 21 | gap / the proof | By (7.6), tr(m_z^{−n}, L_j) = μ(z)^{−n⟨α,β_j⟩}, so constancy of z ↦ tr(Frob_z, V(Π,V)) gives Σ_j A_j ν(z)^{c_j} = const with ν = μ^{−n} and c_j = ⟨α,β_j⟩ ∈ {−2, …, 2}. Pairing with ν^{−2} isolates the highest-root term exactly when ν^2 differs from ν^c for c ∈ {−2, −1, 0, 1}, that is when d = (q − 1)/gcd(n, q − 1) ≥ 5 (always true for n = 1 and q > 5, where the printed argument works up to a sign). For d ≤ 4 another argument is needed, for example reducing a Weil restriction Res_{k_n/k} G′ to G′ over k_n((t)), or choosing χ_k on T(k) = T′(k_n) through a faithful character of k_n^× instead of μ ∘ α. |
| E2 | §7.2, Theorem 7.12, p. 23 (Theorem 1.5, p. 4); §10.4, Lemma 10.7 and Proposition 10.10, pp. 32–35 | gap / a stated result | Add q = \|k\| > 5 to Theorem 7.12 (and Theorem 1.5); add n ≥ 2 to Lemma 10.7 and Proposition 10.10, and q > 5 to the ramification in Lemma 10.7 and to case (b) in Proposition 10.10 (or give another argument for q ∈ {3, 4, 5}). |
| E3 | §3.1, Definition 3.3(a)(iii), p. 8 | misprint / nothing | … the map N^i : gr_{w+i}V → gr_{w−i}V is an isomorphism. |
| E4 | §2.1, Theorem 2.1(ii), p. 6 | misprint / nothing | For any Π ∈ 𝒜_0(G), … |
| E5 | §4.2, Lemma 4.6, p. 13 | misprint / nothing | (α_a)^{(z)} = ψ_k(z^a) (= ψ_k(z)^a). |
| E6 | §7.1, p. 19 | misprint / nothing | Then since the action of W_k permutes the 𝔳_i's, … |
| E7 | §8.2, proof of Lemma 8.3, p. 25 | misprint / nothing | However, by (5.3) of Lemma 5.1, if g ∈ G_{a,0+}, then v_0(ρ_ij(g) − δ_ij) > a·(λ_i − λ_j). … Thus, if g ∈ G_{a,0+}, then ρ(g) is the identity |
| E8 | §8.5, Proposition 8.5, p. 26 | misprint / nothing | Under the hypotheses of Theorem 8.1, … Let π be a pure supercuspidal representation of G(F) … |
| E9 | §10.1, proof of Proposition 10.5, p. 30 | misprint / nothing | It then follows from Theorem 7.12 … |
| E10 | §10.4, pp. 33 and 35 | misprint / nothing | U_∞: the invertible block matrices (n/e × n/e blocks of size e) with … Borel subgroups of GL_e; U_0 = E^×J(β, 𝔄); Λ (the representation of E^×J(β, 𝔄) inducing π) for λ throughout; S = GL_n(F_q(t)) ∩ ∏_x U_x. |
| E11 | §11, after Definition 11.1, p. 36 | misprint / nothing | Use the subset of parameters trivial on I_F^n for each positive integer n. The least such positive integer is an integer cutoff when it exists. Usual real depth requires an infimum and a right-limit convention; it is not this integer and need not be an attained minimum. |
| E12 | §11, Corollary 11.8, p. 37 | gap / a stated result | Let σ ∈ A_n(G/F♯) be a supercuspidal representation … More generally, let σ ∈ A_n(G/F♯) be pure with unramified Fargues–Scholze parameter. |
| E13 | §11, before Corollary 11.9 and its statement, p. 37 | misprint / nothing | … that is 1-close to F♯ (F = k((t)) with the same residue field k) … Let G be a split semisimple group (over Z, or over F♯). |
| E14 | Appendix A, proof of Lemma A.1, p. 39 | misprint / nothing | The function f then satisfies condition (iv) above … |
| E15 | Definition 2.5 pp.7–8 and Definition 3.3(b) p.8; published 2024 version | error / a stated result | The single-weight predicate is relative to a specified representation. Supply a central-weight-compatible intrinsic definition before asserting invariance or essential-temperedness equivalence. Removing just the word every is not a proved replacement for the subsequent theory. |
| E16 | Remark 3.10 p.11; published 2024 version | error / the proof | Use irreducibility of the group-valued parameter (noncontainment in a proper parabolic), with an actual proof from the local monodromy theorem. Do not assert linear irreducibility of Ad. HNY Theorem 2 instead gives zero adjoint inertia invariants, with its stated hypotheses. |
| E17 | Lemma 4.7 p.14; published 2024 version | error / a stated result | Require L tamely ramified at both 0 and ∞. Both supplied proofs then use the tame abelian geometric quotient and the Kummer description. |
| E18 | §4.2 p.13, before (4.4); published 2024 version | misprint / nothing | Take the compositum of cyclic extensions of degree dividing q−1, equivalently the maximal abelian extension of exponent dividing q−1; use continuous characters. |
| E19 | Proof of Lemma 5.1 pp.16–17; published 2024 version | error / the proof | Use a coherent affine-root convention, for example ψ(w)=s−b·w with v(u)≥s. Then ψ(c)≥0 gives ns≥nb·c; ψ(c)>r gives ns>nb·c+nr≥nb·c+r for n≥1,r≥0. At degree zero the matrix coefficient is δ_ij, not identically 1 for every i,j. A root-group proof in this convention remains required. |
| E20 | Proof of Lemma 5.1 p.16, characteristic-zero lifting paragraph; published 2024 version | error / the proof | Prove the required matrix-weight homogeneity directly in characteristic p or restrict to a representation with a separately constructed finite-free lift. Classification by highest weights does not imply that an arbitrary characteristic-p representation lifts with the same rank. |
| E21 | Proof of Lemma 5.1 p.16, restricted root group; published 2024 version | error / the proof | Treat multipliable relative roots separately using their actual root groups and weighted coordinates. Only appropriate reduced-root cases can be described by a vector group in this way. |
| E22 | Proposition 10.5 p.30; interpretation of Corollary 10.11 p.35; published 2024 version | error / a stated result | Exclude tori and state tempered base change in both alternatives, with the necessary compact-induction/purity hypotheses along the entire tower. Corollary 10.11’s principal-series conclusion does not imply loss of supercuspidality for GL₁. |
| E23 | Lemma A.3 proof p.39, sum over finite quotient representations; published 2024 version | misprint / the proof | Use Σ_{δ∈Irr(Q)} (dim δ) Θ_{π_v⊗δ}, where Q=G(K_v)/H_v. These are the regular-character multiplicities; the positive integral combination is what the orthogonality argument uses. |
| E24 | Proof of Lemma 10.8 p.34, basis of F_{q^{e/k}}; published 2024 version | misprint / nothing | Write v₁,...,v_{e/k} for an F_q-basis of F_{q^{e/k}} wherever the basis index is used. |
| E25 | §10.4 p.35, choice of χ_S and the Poincaré series; published 2024 version | gap / the proof | Choose an S-invariant vector in the appropriate tensor product, using a χ_S-eigenvector of Λ\|S and the inverse character. Construct the matrix coefficient/test function from this vector; do not infer the entire representation is trivial on S. |
| E26 | Corollary 2.4(iii) and its proof p.7; published 2024 version | gap / the proof | Supply a torality argument using an additional property of these particular automorphic parameters, or an appropriate connectedness hypothesis. Abelian semisimple image alone does not imply containment in a maximal torus of a reductive group. |

## Validation and continuation

The paper checker and structural audit pass. All 16 definition/construction items have source-driven API outlines, uses and at least three planning tests. The 1627 executed diagnostics and exact script are in the independent review. The dependency skeleton is acyclic but explicitly incomplete. No Lean file was compiled and nothing is claimed formalized. Continue with G1–G3 and the trace-formula suppliers in G5; then finish the source contracts, split the remaining bundled inputs and extract the missing carriers named in G9. Preserve the library credits, logical-status distinctions and shared ownership.
