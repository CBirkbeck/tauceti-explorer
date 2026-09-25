# Handoff: BP-KTheoryFiniteLocalFields (issue #763)

The blueprint of *K-theory of finite and local fields*, stages L.1–L.7, by Claude Code, session cc-38267a. The coordinator wrote the briefs; four authoring agents wrote one stage group each (L.1–L.2, L.3 and L.7, L.4–L.5, L.6); the coordinator merged the fragments, resolved their cross-references and checked the whole.

## Files

- `research/blueprint/packets/KTheoryFiniteLocalFields.json` (status `partial`, part `null`)
- `research/blueprint/readmes/KTheoryFiniteLocalFields.md`, generated from the packet so that the two agree
- `research/blueprint/suggested/KTheoryFiniteLocalFields.lean`
- `research/blueprint/handoff/BP-KTheoryFiniteLocalFields.md` (this note)

## What is closed

- **244 nodes:** 2 applications, 11 comparisons, 14 constructions, 14 definitions, 102 lemmas, 101 theorems.
  - By stage: L.1 39, L.2 17, L.3 18, L.4 35, L.5 83, L.6 41, L.7 11.
  - 224 API items and 126 unit tests, all with a §12 kind.
  - 41 planets, at most six per layer.
- **Baseline:** 88 declarations, each read at its file and line at the pins.
- **Coverage of the stage texts.** Every target of every stage text is realised by a node, imported through a request, or recorded as a gap. The coverage note of each stage maps its targets to its nodes.
- **Consumer requests.** Every request that other packets make of this roadmap is supplied:
  - ArithmeticKTheory N.2–N.6;
  - K3BlochGroups V.5, EllipticKTheory, HabiroNumberFields HB.2 and HigherLocalFields HL;
  - the exceptions are noted in the coverage notes.
- **Checks.**
  - `check_blueprint.py --index`: 0 errors, 0 warnings.
  - Stage cycles: none. The check covers atlas `requires` and `stageEdges` plus the node prerequisites of every packet and decomposition on a freshly pulled main.
  - Every excerpt was checked against the source text layers; none exceeds 300 characters.
  - The packet and the document contain no "sorry", Lean code or private paths.
- **Source issues:** 36 mistakes in the sources are recorded, with corrections, and the nodes use the corrected statements.
  - Brauer lifting: the lift of the standard representation must be taken as a virtual representation (K-book IV.1).
  - K-book V.6.9.2 fails at i = 1.
  - K-book Corollary VI.7.4.2 fails at p = 2, 3; the Handbook's Corollary 63 has it right.
  - The Handbook's H¹ formula before Theorem 61 is wrong for (ℚ₃, i = 7).
  - Several Hesselholt–Madsen misprints.

## What remains, precisely

**L.1** (partial):

- Quillen's vanishing of H̃_*(GL(F_q); F_p) (Quillen 1972, §11): gap, node L.1/gl-mod-p-acyclic.
- The prime ℓ = 2 (q odd) in the cohomology comparison: gap, nodes L.1/fpsi-cohomology-ring, L.1/gl-cohomology-detection, L.1/quillen-homology-iso.
- Quillen's Lemma 12 (abelian ℓ-subgroups of GL_n(F_q) are conjugate into C^m) and Quillen's detection for wreath products (The Adams conjecture, Prop. 3.4): gap, node L.1/gl-cohomology-detection.
- Green's theorem on Brauer characters: gap, node L.1/green-virtual-character.
- Browder's mod-ℓ ring structure and scholium; Araki–Toda multiplications on Moore spectra: gaps, nodes L.1/browder-mod-l-ring and L.1/mod-m-products (the latter also requested from StableHomotopyKTheory H.6).
- Answers to the requests to RefinedTraceMethods RT.4:topological (Adams operations on BU, Atiyah map, K̃U^1(BG) = 0; proposed as a Part II), StableHomotopyKTheory H.6 (Moore multiplications, Eilenberg–Moore spectral sequence), SchemeKTheoryOperations S.6 (Quillen–Hiller operations and Hiller's universality), GeneralAlgebraicKTheory K.7, KTheoryLowDegrees U.5 and U.6.
- Re-derive Mestel's Lemmas 26–29 (the classes c_i(W), e_{jr}(W) and the product formula) against Quillen 1972 §§8–9 before implementation (gap on the expository source).
- Once K2SymbolsBrauer--T.1 cites GeneralAlgebraicKTheory K.2:plus instead of the umbrella K.2 (restructure), add K2SymbolsBrauer:T.2/k2-finite-field and K2SymbolsBrauer:T.1/k2-pi2 as prerequisites of L.1/degree-two-symbols.

**L.2** (partial):

- Gabber's proof of rigidity for henselian pairs (Gabber 1992; Suslin 1984; Gillet–Thomason 1984): gap, node L.2/gabber-rigidity; every other L.2 node rests on it.
- Answers to the requests to tauceti:TauCetiRoadmap/LocalFieldsRamification (finite extensions of local fields and their integers; unramified extensions and the residue action of G_L), GeneralAlgebraicKTheory K.7 (K_*(O)-linearity of the localisation boundary) and KTheoryLowDegrees U.5 (the degree-one boundary).
- Confirmation by MotivicEtaleKTheory M.7 of the ownership split in restructure (M.7 imports L.2/gabber-rigidity; Suslin's rigidity for algebraically closed fields, K-book VI.1.1–VI.1.7.1, stays with M.7).

**L.3** (partial):

- Merkurjev's theorem (no p-torsion in U(E) for char E = 0) is cited, not decomposed: no public source of its proof was read (gap).
- Hilbert's Theorem 90 for K₂ in the Artin–Schreier case, used by L.3/k2-no-p-torsion-char-p, is cited to Merkurjev–Suslin (gap; the K-book's own treatment is circular).
- The general-d tame formula of L.3/tame-component is proved here by the classical local class field theory computation; the only source statement read is the case d = 2 over ℚ_p (Exercise III.6.7), so the formula should be checked against Serre, Local Fields XIV §3 (gap).
- Moore's own proof of the divisibility was not read; the p-part in characteristic 0 is proved through the degree-two norm residue theorem and local duality instead (gap).
- Requests to MotivicEtaleKTheory M.5, KTheoryLowDegrees U.3 and the upstream layers LocalFieldsRamification Layer 1 and ClassFieldTheory Layers 5 and 6 must be answered.

**L.4** (partial):

- Supply the cyclotomic structure on T(C) for linear Waldhausen categories (gap).
- Prove McCarthy's additivity for Φ = THH^{C_r}, Bökstedt's approximation lemma, Waldhausen's Lemma 1.4.1/Theorem 1.6.4 arguments for Φ, Thomason–Trobaugh 1.9.8 and the 3 × 3 lemma with HM's sign conventions (gap), or replace them by the Blumberg–Mandell localisation theorems for spectral categories.
- Supply the Dundas–McCarthy equivalence criterion, Morita invariance and Dundas' dévissage for HM's linear-category THH (gap).
- Answers to the requests to RefinedTraceMethods RT.1, RT.2 and RT.3.

**L.5** (partial):

- Prove the existence of the log de Rham–Witt complex and W_1ω = ω for log rings (gap and source issue: the two HM papers refer to each other).
- Prove the Lindenstrauss–Madsen inputs (π̄_*T(A), π_*(T(A);Z_p), their Proposition 4.3) and Remark 2.4.2 (gaps).
- Replace Tsalidis' theorem in Addendum 5.4.4 by Nikolaus–Scholze Corollary II.4.9 with the hypotheses checked (gap).
- Split the proofs of Propositions 5.5.4 and 5.5.5 and Theorem 5.5.1 into declaration-sized steps (the degree bookkeeping is recorded in proof steps only).
- Supply the continuity results and Kratzer's theorem behind HM 1997 Theorem D, and HM 1997 Theorem 5.1 (gap).
- Supply the Galois-cohomology inputs of Theorem 6.1.6 (Serre's residue sequence, Artin–Schreier) and obtain answers to the requests to MotivicEtaleKTheory M.1 and Tau Ceti ProfiniteCohomology layer 9.
- Supply TR^n_{q−λ}(k;p) for perfect k (HM 'cyclic polytopes' Proposition 9.1, cited in Hesselholt 2005) and the cyclic-polytope geometry behind HM 1997b Theorem B.
- Answers to the requests to RefinedTraceMethods RT.1–RT.3, CrystallineCohomology CR.4 and CR.5:log-algebra.

**L.6** (partial):

- Obtain Tate, 'Relations between K2 and Galois cohomology' (Handbook ref. [66]) and decompose the uncountability of K^M_n(𝔽_q((t))), n ≥ 3 (gap), or supply another proof.
- Obtain Dwyer–Mitchell and Thomason's calculation of the p-adic homotopy type of K^ét of a p-adic field and decompose the equivalences of L.6/hm-theorem-d, including the valuation-ring form (gap).
- Resolve the requests to MotivicEtaleKTheory M.1, M.4, M.5, M.6, M.7, M.8, ArithmeticGaloisDuality R02.1, CrystallineCohomology CR.4, RefinedTraceMethods RT.4:topological and Tau Ceti ClassFieldTheory Layer 5 / LocalFieldsRamification Layer 1, replacing the stage prerequisites by node ids once those blueprints exist.
- Assign an owner to the Geisser–Levine theorem (gap) and to cd_p ≤ 2 for complete discretely valued fields with perfect infinite residue field (gap).
- Decide whether the natural splitting in Hesselholt–Madsen's Theorem A for v > 1 is needed anywhere; if so, find its argument (gap).
- Rognes–Weibel's proof for p = 2 (K-book [161, 3.7], Handbook [51]) was not read; the p = 2 case rests on M.7's Quillen–Lichtenbaum statement for fields of 2-cohomological dimension 2.
- Route Examples VI.7.6–7.8 of the K-book (Handbook 64–66), which are local–global, to L.7 (restructure entry).

**L.7** (partial):

- The semilocal equivalence E ⊗_F F_v ≅ ∏_{w|v} E_w (NumberFieldArithmetic Layer 5) is requested, not planned here.
- Étale Chern classes and their functoriality (MotivicEtaleKTheory M.8), the étale–Galois comparison and henselian rigidity for étale cohomology (M.1), unramified subgroups and inflation (ArithmeticGaloisDuality D7) and the naturality of the cyclotomic trace (RefinedTraceMethods RT.3) are requested.
- L.7/hilbert-symbol-completion (c) inherits the Merkurjev gap of L.3.
- Karoubi's square is planned for discrete valuation rings only; the general Proposition V.7.5 is proposed for GeneralAlgebraicKTheory (restructure).

## Gaps

- **Quillen's vanishing of the mod-p homology of GL(F_q) is cited, not proved.** Needed by `L.1/gl-mod-p-acyclic`, `L.1/quillen-homology-iso`, `L.1/quillen-fibration`.
- **The prime 2 in Quillen's cohomology comparison is not treated in the sources read.** Needed by `L.1/fpsi-cohomology-ring`, `L.1/gl-cohomology-detection`, `L.1/quillen-homology-iso`.
- **Quillen's detection lemmas for GL_n(F_q) are cited, not proved.** Needed by `L.1/gl-cohomology-detection`.
- **Green's theorem on Brauer characters is cited, not proved.** Needed by `L.1/green-virtual-character`, `L.1/brauer-lift`.
- **Atiyah–Segal vanishing of K̃U^1 on classifying spaces is cited, not proved.** Needed by `L.1/fpsi-lifting`, `L.1/quillen-map`, `L.1/frobenius-is-adams`.
- **The Eilenberg–Moore spectral sequence is cited, not constructed.** Needed by `L.1/fpsi-cohomology`.
- **Browder's computation of the mod-ℓ ring of a finite field and the Araki–Toda multiplications are cited, not proved.** Needed by `L.1/browder-mod-l-ring`, `L.1/mod-m-products`, `L.1/algebraic-closure-mod-m-ring`, `L.2/mod-m-local-field-ring`.
- **Hiller's universality of the representation-ring map is cited, not proved.** Needed by `L.1/adams-on-finite-field-k`.
- **The decomposition of Quillen's proof follows an expository essay whose computations were not all re-derived.** Needed by `L.1/fpsi-cohomology-ring`, `L.1/gl-cohomology-detection`.
- **Gabber's rigidity theorem is cited, not proved.** Needed by `L.2/gabber-rigidity`, `L.2/rigidity-finite-residue-field`, `L.2/henselian-dvr-mod-m-splitting`.
- **Merkurjev's theorem on the torsion in K₂ of local fields was not obtained.** Needed by `L.3/merkurjev-p-torsion-free`, `L.3/moore-theorem`, `L.3/moore-mixed-characteristic`, `L.3/ring-of-integers-subgroup`, `L.7/hilbert-symbol-completion`.
- **Hilbert's Theorem 90 for K₂ in the Artin–Schreier case has no proof in the sources read and no owner.** Needed by `L.3/k2-no-p-torsion-char-p`, `L.3/moore-theorem`, `L.3/moore-equal-characteristic`.
- **The tame formula for the d-th power norm residue symbol is stated in the sources read only for d = 2 over ℚ_p.** Needed by `L.3/tame-component`, `L.3/hilbert-symbol-components`, `L.3/ring-of-integers-subgroup`, `L.3/moore-equal-characteristic`.
- **Moore's own proof of the divisibility was not read; the characteristic-zero p-part is proved by another route.** Needed by `L.3/moore-kernel-p-divisible-mixed-characteristic`, `L.3/moore-theorem`.
- **Cyclotomic structure on T(C) for a linear Waldhausen category is only sketched.** Needed by `L.4/thh-of-linear-waldhausen-category`, `L.4/tr-pro-spectrum`.
- **Proofs cited but not read in HM §1: McCarthy's additivity, Bökstedt's approximation lemma, Waldhausen's Lemma 1.4.1 and Theorem 1.6.4, Thomason–Trobaugh 1.9.8, Cartan–Eilenberg XVII.1.2.** Needed by `L.4/thh-additivity-theorem`, `L.4/thh-structure-maps-f-equivalences`, `L.4/isomorphism-nerve-degeneracy-equivalence`, `L.4/thh-fibration-theorem`, `L.4/thh-torsion-complexes-f-equivalence`, `L.4/thh-projective-complexes-f-equivalence`, `L.4/three-by-three-lemma`.
- **The Dundas–McCarthy equivalence criterion, Morita invariance and Dundas dévissage for THH are cited, not proved.** Needed by `L.4/dundas-mccarthy-equivalence-criterion`, `L.4/dvr-tr-agrees-with-ring-tr`, `L.4/thh-torsion-complexes-f-equivalence`.
- **Existence of the de Rham–Witt complex with log poles: the two sources refer to each other.** Needed by `L.5/log-de-rham-witt-complex`, `L.5/log-de-rham-witt-level-one`.
- **Lindenstrauss–Madsen, THH of number rings, not read.** Needed by `L.5/thh-of-dvr-mod-p`, `L.5/thh-of-dvr-p-adic`, `L.5/log-thh-mod-p`, `L.5/log-thh-low-degrees`, `L.5/reduction-mod-p-of-thh-dvr`, `L.5/norm-restriction-exact-low-degrees`, `L.5/log-de-rham-witt-tr-level-two`.
- **Remark 2.4.2 (π_*(T(A|K);Z_p)) is stated without proof but used in Lemma 5.6.1.** Needed by `L.5/log-thh-p-adic`, `L.5/frobenius-surjective-odd-degrees`.
- **Tsalidis' theorem (Addendum 5.4.4) not read; the Nikolaus–Scholze replacement must be checked.** Needed by `L.5/gamma-hat-all-levels`.
- **Inputs from Hesselholt–Madsen 1997 and other papers cited in HM 2003 §§3–5 and not decomposed.** Needed by `L.5/tr-log-dvr-is-log-witt-complex`, `L.5/norm-restriction-exact-low-degrees`, `L.5/tate-spectral-sequence-unramified`, `L.5/tate-spectral-sequence-deeply-ramified`, `L.5/log-thh-tame-descent`, `L.5/lubin-tate-unit-polynomial`, `L.5/cyclic-bar-construction-of-truncated-monoid`.
- **Continuity and perfect-field inputs of HM 1997 Theorem D.** Needed by `L.5/trace-equivalence-finite-witt-algebras`, `L.5/trace-isomorphism-for-local-field`.
- **Galois-cohomology inputs of Theorem 6.1.6 without an identified owner.** Needed by `L.5/tc-of-log-dvr-mod-p`.
- **TR^n_{q−λ}(k;p) for perfect k and the Geisser–Hesselholt TC sequence are cited.** Needed by `L.5/twisted-tr-of-regular-fp-algebra`, `L.5/relative-k-of-truncated-polynomial-over-perfect-field`, `L.5/tc-of-regular-fp-algebra`.
- **Uncountability of the Milnor K-groups K^M_n(E), n ≥ 3, and of U_n, n ≥ 3, for E = 𝔽_q((t)) is not proved in the sources read.** Needed by `L.6/milnor-k-of-local-fields`, `L.6/uniquely-divisible-summand`, `L.6/equal-characteristic-integral-structure`.
- **The p-adic homotopy type of étale K-theory of a p-adic field (input of Hesselholt–Madsen Theorem D) was not read.** Needed by `L.6/hm-theorem-d`.
- **cd_p(K) ≤ 2 for a complete discretely valued field K of characteristic 0 with perfect, not necessarily finite, residue field has no owner.** Needed by `L.6/hm-theorem-a`.
- **The natural splitting of K_{2s}(K; ℤ/p^v) ≅ H^0 ⊕ H^2 for v > 1 is asserted by Hesselholt–Madsen without a separate argument in the text read.** Needed by `L.6/hm-theorem-a`.
- **The Geisser–Levine theorem has no stage that names it.** Needed by `L.6/geisser-hesselholt-regular-local`, `L.6/equal-characteristic-completed-k-groups`, `L.6/milnor-k-of-local-fields`.

## Requests made

- **RefinedTraceMethods:RT.4:topological** (8 nodes): RT.4:topological's text: 'Construct topological complex K-theory from vector bundles, prove Bott periodicity and its spectrum-level multiplication ... Identify π_*ku=ℤ[β] and π_*KU=ℤ[β,β⁻¹]'. L.1 uses BU as a homotopy-commutative H-group with π_{2i}(BU) ≅ Z, π_{2i−1}(BU) = 0, and additionally needs, beyond that text: (a) Adams operations ψ^k: BU → BU as H-maps representing ψ^k on K̃U^0, with ψ^jψ^…
- **StableHomotopyKTheory:H.6** (36 nodes): H.6's text: 'Define E/m as the cofiber of multiplication by m on a spectrum. Prove the Bockstein exact sequence ... Construct exact couples from filtered spectra and convergence statements ... These are used in M and L'. L.1 needs, beyond the Bockstein node StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence: (a) the homotopy associative and commutative multiplication on the Moore spec…
- **GeneralAlgebraicKTheory:K.7** (11 nodes): K.7's text: 'Construct external products from biexact functors and their associativity, unit and symmetry homotopies. For commutative rings obtain graded-commutative K-groups. Prove compatibility with relative groups, localisation boundaries and transfers.' L.1 needs K(R) as a homotopy commutative ring spectrum (for K(R)/ℓ^ν to be a ring spectrum); L.2 needs the K_*(O)-linearity of the localisatio…
- **SchemeKTheoryOperations:S.6** (2 nodes): S.6's text: 'Construct λ-operations using a genuine higher K-theory construction, not just the exterior-power functor on objects. Establish Adams operations ψ^k and their multiplication law.' L.1 needs these for affine schemes in the Quillen–Hiller form of K-book IV.5: λ^k and ψ^k on K_0(A) × [X, BGL(A)^+] for commutative A, induced from the representation rings R_A(GL_n(A)) through q (Proposition…
- **KTheoryLowDegrees:U.6** (1 nodes): U.6's text: 'Use H.3 and K.2 to identify π₁ BGL(A)⁺ with the explicit quotient. ... the comparison must identify determinant and transfer, not merely provide an abstract isomorphism. Compute K₁ of Z, finite fields, ...'. L.1 imports K_1(F_q) = GL(F_q)/E(F_q) ≅ F_q^× by the determinant, natural in F_q.
- **KTheoryLowDegrees:U.5** (2 nodes): U.5's text: 'For a finite projective algebra extension construct transfer by restriction of scalars. Prove that, on a field's unit group, this agrees with the field norm. ... the boundary map from a discrete valuation field's units to K₀ of its residue field equals the valuation with the chosen convention.' L.1 uses the norm statement for finite fields; L.2 uses the boundary statement ∂[π] = [k] =…
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions** (3 nodes): Layer 0's 'Finite extensions, I' (finiteExtension_isNonarchimedeanLocalField: a finite extension of a nonarchimedean local field is one, with no structure assumed on L) and 'Finite extensions, II' (its integer ring is the integral closure, a henselian DVR with finite residue field). L.2 applies its henselian-DVR results to every finite subextension of L^sep.
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius** (3 nodes): Layer 2: 'For every f ≥ 1 there is exactly one unramified intermediate field K_f of AlgebraicClosure K with [K_f : K] = f' and the residue correspondence Gal(L/K) ≃ Gal(𝓀[L]/𝓀[K]) with the Frobenius; with Layer 4's exact sequence 1 → I_K → G_K → Ẑ → 1. L.2 uses that the residue fields of finite subextensions exhaust \bar F_q and that G_L acts on residue fields through a surjection onto Gal(\bar F_…
- **K2SymbolsBrauer:T.2:symbols** (1 nodes): Compatibility, not a supply: T.2:symbols' text 'Prove Matsumoto's theorem that the resulting map K₂ᴹ(F) → K₂(F) is an isomorphism' gives K2SymbolsBrauer:T.2/k2-finite-field (K_2(F_q) = 0 by symbols); L.1/degree-two-symbols recovers K_2(F_q) = 0 in Quillen's model and should cite it, but K2SymbolsBrauer--T.1's nodes T.1/k2-definition and T.1/k2-pi2 cite the umbrella stage GeneralAlgebraicKTheory:K.…
- **MotivicEtaleKTheory:M.5** (5 nodes): Two statements of M.5 ('For a field F and a prime ℓ invertible in F, prove K_j^M(F)/ℓ^r ≅ H^j(F, μ_{ℓ^r}^{⊗j})' and 'At the residue characteristic use the separate Bloch–Gabber–Kato logarithmic differential statement where L requires it'): (i) in degree j = 2, K₂(E)/p^ν ≅ H²(E, μ_{p^ν}^{⊗2}) for E a finite extension of ℚ_p (Merkurjev–Suslin), proved without Moore's theorem for local fields; (ii) B…
- **KTheoryLowDegrees:U.3** (3 nodes): SK₁(A) = 0 for a commutative semilocal ring A, hence K₁(𝒪) = 𝒪^× for the valuation ring of a local field and K₁ of a field is its unit group (U.3: 'Prove SK₁ vanishing for fields and commutative semilocal rings by explicit elementary reduction'). U.3's text: 'Prove SK₁ vanishing for fields and commutative semilocal rings by explicit elementary reduction'. L.6 needs K_1(𝔽_q[[t]], (t)) = 1 + t𝔽_q[[t…
- **tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group** (4 nodes): From Layer 1's 'Structure of Kˣ': 'Prove that the torsion subgroup μ(K) is finite', with the API items 'finiteness of μ(K) and its order' and 'the p-part and the prime-to-p part of μ(K)', together with 𝒪[K]ˣ ≃ μ_{q−1} × U(K,1) and U(K,1) pro-p; used to write μ(E) = μ_{q−1}(E) × μ_{p^∞}(E) of order w = (q − 1)p^a, with a = 0 in characteristic p. Layer 1's 'Structure of Kˣ': 'Prove that the torsion …
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity** (2 nodes): Local reciprocity for finite abelian extensions (localArtinEquiv and its multiplicative form normResidue), with the arithmetic normalisation 'localArtinMap(π_K) = arithmeticFrobenius for an unramified extension' and the triviality of the Artin image of units on unramified extensions; used for the tame formula and for the norm criterion of the norm residue symbol.
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality** (6 nodes): Local Tate duality for finite Galois modules of a p-adic field (Layer 5's 'duality'), in the form #H²(E, μ_{p^ν}^{⊗2}) = #H⁰(E, μ_{p^ν}) (K-book VI.7, p. 516: 'H²(E, μ_m^{⊗i+1}) is isomorphic to H⁰(E, μ_m^{⊗i})'). Layer 5's 'Construct local Tate duality from the evaluation pairing Hom(A,μ_n) × A → μ_n' (tateDualityPairing_perfect_mixed), 'Prove finiteness of H⁰, H¹, H² (finite_H), the cardinality …
- **tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places** (2 nodes): Layer 5.3's 'semilocalEquiv v : K_v ⊗[K] L ≃ₐ[K_v] ∏ (w : W v), L_w' with its value on pure tensors, and Layer 5.2's completionAlgHom v w with its tower equation; used for the transfer and semilocal completion formulas (Tau Ceti's adicCompletionExtension supplies the individual maps K_v → L_w at the pinned commit).
- **MotivicEtaleKTheory:M.8** (5 nodes): The étale Chern classes c_{i,n} : K_n(X; ℤ/m) → H^{2i−n}_et(X, μ_m^{⊗i}) for schemes X over ℤ[1/m] (M.8: 'Construct étale Chern classes … Prove compatibility with the higher K-theory Chern character, residues, norms and products'), with their functoriality in morphisms of schemes (K-book Definition V.11.5 (1)) and their compatibility with the localisation boundary; used for Spec F_v → Spec F, Spec…
- **MotivicEtaleKTheory:M.1** (8 nodes): The comparison of étale cohomology of Spec F with Galois cohomology of G_F for fields, compatible with pull-back along field extensions (restriction to decomposition groups), and, for a complete discrete valuation ring 𝒪_v with residue field k(v) and m invertible in k(v), H^j_et(Spec 𝒪_v, μ_m^{⊗i}) ≅ H^j(k(v), μ_m^{⊗i}) (M.1: 'scheme étale sites/Galois comparison'). The finite Tate twists μ_p^{⊗s}…
- **ArithmeticGaloisDuality:D7** (1 nodes): The unramified subgroups H^j_ur(F_v, M) ⊆ H^j(F_v, M) for unramified finite coefficients, identified with the image of inflation from the residue field, and the restriction maps H^j(F, M) → H^j(F_v, M) (D7: 'Specify topological restricted products, unramified subgroups, their transition maps').
- **RefinedTraceMethods:RT.3** (8 nodes): The cyclotomic trace K(A) → TC(A; p) and its naturality in exact functors (RT.3: 'Construct the Dennis/cyclotomic trace from the same K-theory functor and prove its naturality'), applied to − ⊗_{𝓞_F} 𝓞_v. The cyclotomic trace K(C) → TC(C;p) for linear Waldhausen categories (in particular C^b_z(P_A), C^b_q(P_A) and C^b_z(P_A)^q), natural in exact functors and multiplicative for bi-exact symmetric m…
- **RefinedTraceMethods:RT.1** (7 nodes): Hochschild homology HH_*(A) of commutative rings (cyclic model, Connes' B, relative groups for an ideal), cyclic homology HC and negative cyclic homology HC^- with the SBI sequence, the smooth characteristic-zero HKR isomorphism Ω^*_A ≅ HH_*(A) and its extension to filtered colimits (so to regular noetherian Q-algebras by Popescu), and étale base change HH_*(B) ≅ B ⊗_A HH_*(A) for A → B étale. RT.…
- **RefinedTraceMethods:RT.2** (18 nodes): THH of spectral categories (in particular of Z-linear categories via Eilenberg–Mac Lane spectra of the Hom-groups) by cyclic realisation, with the T-action as coherent data and its genuine cyclotomic structure (genuine C_{p^n}-fixed points, restriction R through geometric fixed points, inclusion F, transfer V), homotopy orbits, homotopy fixed points and Tate constructions with the norm cofibre seq…
- **CrystallineCohomology:CR.4** (11 nodes): On the Witt-vector carrier: the Frobenius F: W_n(A) → W_{n−1}(A), Verschiebung V: W_{n−1}(A) → W_n(A) and restriction R on Mathlib's TruncatedWittVector (Mathlib has F and V only on the untruncated WittVector), and the Witt complexes of Hesselholt–Madsen over Z_(p)-algebras (p odd) and over F_p-algebras with R, F, V, the relations FV = p, FdV = d, Fd[a] = [a]^{p−1}d[a], the initial Witt complex W_…
- **CrystallineCohomology:CR.5:log-algebra** (7 nodes): Prelog rings (R, α: M → (R,·)) with the group completion M^gp and morphisms of prelog rings; the induced prelog structure on W_n(R) through the Teichmüller map; log derivations (D, Dlog) into an R-module and the universal one ω^1_{(R,M)} = (Ω^1_R ⊕ (R ⊗ M^gp))/⟨dα(a) − α(a) ⊗ a⟩ with absolute Ω^1_R; the log differential graded rings (E^*, M) (a dga with prelog structure α: M → E^0 and Dlog: M → E^…
- **tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory** (1 nodes): Surjectivity of the Kummer map K^×/K^{×n} → H^1(G_K, μ_n) for n invertible in the field K (Hilbert 90 for K^sep/K), completing Tau Ceti's TauCeti.kummerClassMap (injective by TauCeti.kummerClassMap_injective). The layer's title: 'The Galois interface: Hilbert 90 and Kummer theory'. L.5 uses it with n = p for the degree-one case of Theorem 6.1.6 (K^×/K^{×p} = K_1(K;Z/p) ≅ TC_1(A|K;p,Z/p) ≅ H^1(K,μ_…
- **MotivicEtaleKTheory:M.7** (6 nodes): M.7's text: 'Construct étale K-theory through descent of finite-coefficient K-theory spectra, and the comparison from ordinary K-theory. Prove the relevant rigidity and étale descent theorems. Deduce Quillen–Lichtenbaum from M.5 and M.6 with an explicit degree range determined by the appropriate cohomological dimension.' L.6 needs: (i) for a field F of characteristic ≠ p with cd_p(F) ≤ 2 — in part…
- **MotivicEtaleKTheory:M.4** (1 nodes): M.4's text: 'Define motivic cohomology by these cycle complexes and prove the low-weight descriptions: weight zero, units/Picard in weight one, field Milnor K-theory on the diagonal'. L.6 needs K^M_n(F) ≅ H^n(F, ℤ(n)) for every field F and n ≥ 0 (Nesterenko–Suslin–Totaro), compatible with the coefficient sequence 0 → ℤ(n) → ℤ(n) → ℤ/m(n) → 0.
- **MotivicEtaleKTheory:M.6** (1 nodes): M.6's text: 'Identify the cycle-theoretic Chern character with the one constructed in S.7, including product and residue normalisations', with SchemeKTheoryOperations S.7: 'Higher Chow groups and the higher Chern character belong to M'. L.6 needs the Chern classes c_{i,i}: K_i(F) → H^{i,i}(F) ≅ K^M_i(F) of a field and K-book Lemma V.11.13: the composite K^M_i(F) → K_i(F) → K^M_i(F) is multiplicati…
- **ArithmeticGaloisDuality:R02.1** (4 nodes): R02.1's text: 'Construct cohomology for lattices and their torsion quotients through a comparison with the canonical continuous-cohomology construction. Prove the relevant Mittag–Leffler and lim¹ statements before interchanging cohomology and inverse limit. Treat T, V=T[1/p], and V/T separately.' L.6 needs, for G = G_L (L/ℚ_p finite) and T = ℤ_p(i): H^j(G, T) ≅ lim_ν H^j(G, T/p^ν) when the H^{j−1}…

## Structural proposals

- **Rigidity for henselian pairs is owned by L.2; MotivicEtaleKTheory M.7 imports it** (ownership).
- **Finite-coefficient K-theory of rings is planned in L.1** (ownership).
- **K2SymbolsBrauer T.1 cites the umbrella GeneralAlgebraicKTheory:K.2, which blocks L.1 from importing K_2(F_q) = 0** (cycle).
- **RefinedTraceMethods, Part II: Adams operations and classifying spaces in topological K-theory** (part-ii).
- **Proposed sub-layers of L.1** (sub-layers).
- **Duplicates listed by the audit for L.1 and L.2 are imported, not re-planned** (ownership).
- **The global-to-local K-theory map above p is owned by L.7; PadicHodgeRegulators D.4 imports it** (ownership).
- **Hilbert's Theorem 90 for K₂ and the torsion theorems for K₂ of fields have no owner** (ownership).
- **Karoubi's square in general belongs to GeneralAlgebraicKTheory** (ownership).
- **Real places of a number field are outside L.7's text but inside N.6's wild kernel** (rescope).
- **The localisation splitting of K₂ of a local field is L.2's** (move-nodes).
- **General TR/TC comparison is RT.2's; L.4 owns the Hesselholt–Madsen specialisation** (ownership).
- **THH analogues of Waldhausen's additivity, fibration and resolution theorems are owned by L.4** (ownership).
- **RT.3 and RT.6 test calculations import from L.5 only where the graph allows** (ownership).
- **CrystallineCohomology CR.5:log-algebra should own absolute log differentials of prelog rings** (rescope).
- **'Logarithmic de Rham–Witt' in HL.2 and 'de Rham–Witt with log poles' in L.5 are different objects** (ownership).
- **Proposed sub-layers of L.4 and L.5 for the atlas** (sub-layers).
- **Hesselholt–Madsen Theorem D (1997) and the trace isomorphism for local fields are placed in L.5** (ownership).
- **The completed K₃ carrier and its rank and torsion are owned by L.6; PadicHodgeRegulators D.3 imports them** (ownership).
- **Abelian-group tools for divisible components: one owner** (ownership).
- **Stage links that L.6's prerequisites add** (links).
- **The local–global examples of K-book VI.7.6–7.8 (Handbook 64–66) belong to L.7** (ownership).
- **Proposed sub-layers of L.6 for the atlas** (sub-layers).

## Suggested Lean file

**Compiled.** `research/blueprint/suggested/KTheoryFiniteLocalFields.lean` (4788 lines) elaborates with exit code 0 against Mathlib 082e2d3 and the Tau Ceti f790474 sources. Its only warnings are 257 `declaration uses 'sorry'`.

- **How it was compiled.** The local Mathlib-082e2d3 project does not build the Tau Ceti modules the file imports, so those were compiled with `lean -o` from the f790474 sources and placed first on `LEAN_PATH`. The file header says so.
- **Hygiene.** A copy with `autoImplicit` off also compiles, so no typo became an implicit variable. There is no `set_option`, no root import, and no `True`, `Unit` or opaque carrier.
- **What is stated in Lean.**
  - 70 of the 224 API items, 70 of the 126 unit tests (as `example`s) and 66 of the theorem nodes.
  - 10 of the 28 objects:
    - the Brauer character (with a real body) and the Brauer lift;
    - the norm-residue map and the Moore kernel;
    - the Tate complex;
    - the Witt-vector residue map and the modified Verschiebung;
    - the iterated Frobenius derivation;
    - the maximal divisible subgroup and the p-adic Tate module.
  - Honest stand-ins: Milnor K-theory, the Steinberg group with Steinberg's K₂, the w-invariants, the tame, conic and Hilbert symbols, and log differentials as an explicit quotient.
- **What is a comment instead.** Everything that needs K-theory spectra, K-groups of degree at least 3, THH/TR/TC, BU or de Rham–Witt complexes names its missing carrier and supplier. Every packet name (244 node ids, 224 API names, 126 test names) appears in the file.
- **Corrections found while formalising.** They were applied to the packet:
  - the range of the Tate–homology identification (it starts at i = −2);
  - the Bott map, a homomorphism on all of μ_m;
  - negative twists in the w-invariant formula;
  - two de Rham–Witt tests: the naive map is additive, and it is the twisted Leibniz rule that fails; and when V_π agrees with V;
  - classical against derived Hochschild homology of a perfect field;
  - the hypothesis of the Brauer-character change of embedding;
  - the Tate module of (ℚ_p/ℤ_p)^λ, for finite λ only;
  - Mathlib's finite-field norm formula, added to the baseline;
  - neededBy recomputed for every request.

## Sources

Read (versions and SHA-256 in the packet):

- The K-book: An Introduction to Algebraic K-theory, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
- Algebraic K-theory of rings of integers in local and global fields, Charles Weibel (https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf).
- K-theory and topological cyclic homology of henselian pairs, Dustin Clausen, Akhil Mathew, Matthew Morrow (https://arxiv.org/abs/1803.10897).
- On the K-theory of finite fields, Peter J. Haine (https://math.berkeley.edu/~phaine/files/KFF.pdf).
- Algebraic K-theory of finite fields, David Mestel (https://www.cs.ox.ac.uk/people/david.mestel/essay.pdf).
- Corrections to “The K-book: an introduction to algebraic K-theory”, Charles A. Weibel (https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf).
- On the K-theory of local fields, Lars Hesselholt, Ib Madsen (https://arxiv.org/abs/math/9910186).
- Class Field Theory, J. S. Milne (https://www.jmilne.org/math/CourseNotes/CFT.pdf).
- Topological Milnor K-groups of higher local fields, Ivan Fesenko (https://msp.org/gtm/2000/03/gtm-2000-03-006p.pdf).
- Bloch groups, algebraic K-theory, units, and Nahm's conjecture, Frank Calegari, Stavros Garoufalidis, Don Zagier (https://arxiv.org/pdf/1712.04887v3).
- On the K-theory of finite algebras over Witt vectors of perfect fields, Lars Hesselholt and Ib Madsen (https://www.math.nagoya-u.ac.jp/~larsh/papers/004/paper.pdf).
- Cyclic polytopes and the K-theory of truncated polynomial algebras, Lars Hesselholt and Ib Madsen (https://www.math.nagoya-u.ac.jp/~larsh/papers/007/polytope.pdf).
- K-theory of truncated polynomial algebras, Lars Hesselholt (https://www.math.nagoya-u.ac.jp/~larsh/papers/s01/handbook.pdf).
- On the p-typical curves in Quillen's K-theory, Lars Hesselholt (https://www.math.nagoya-u.ac.jp/~larsh/papers/005/acta.pdf).
- On the de Rham–Witt complex in mixed characteristic, Lars Hesselholt and Ib Madsen (https://www.math.nagoya-u.ac.jp/~larsh/papers/013/final.pdf).
- On the K-theory of complete regular local F_p-algebras, Thomas Geisser and Lars Hesselholt (https://www.math.nagoya-u.ac.jp/~larsh/papers/011/paper.pdf).
- On topological cyclic homology, Thomas Nikolaus and Peter Scholze (https://arxiv.org/abs/1707.01799).

Not obtained, and cited only through the sources above (each such step is a gap):

- **Quillen.** His 1972 Annals paper on the cohomology and K-theory of GL over a finite field, and the 1971 papers.
- **Quillen's inputs.** Green's theorem on Brauer characters (1955), Browder's and Araki–Toda's multiplications, Hiller's λ-operations, and Atiyah–Segal.
- **Rigidity and local fields.** Gabber's rigidity paper and Gillet–Thomason; Suslin's 1984 paper on the K-theory of local fields.
- **K₂ and étale K-theory.** Merkurjev's and Tate's papers on K₂; Dwyer–Mitchell and Thomason on étale K-theory.
- **Trace methods.** Lindenstrauss–Madsen; Rognes–Weibel's two-primary calculations.

## For a continuation

- **Close the gaps** from those sources as they become available. Replace the stage-level requests by node ids once the supplier blueprints exist (RefinedTraceMethods, MotivicEtaleKTheory, KTheoryLowDegrees U.3/U.5/U.6, SchemeKTheoryOperations S.6).
- **Split the long proofs** of Hesselholt–Madsen 5.5.1, 5.5.4 and 5.5.5 into declaration-sized steps.
- **Ownership, via the restructure entries.**
  - Rigidity in L.2, which MotivicEtaleKTheory M.7 would then import.
  - The semilocal K-theory map in L.7 and the completed K₃ in L.6, which PadicHodgeRegulators D.3/D.4 would import.
- **K₂(𝔽_q).** L.1 proves K₂(𝔽_q) = 0 in Quillen's model rather than importing K2SymbolsBrauer T.2/k2-finite-field. In the current stage graph that node lies downstream of L.1, because K2SymbolsBrauer--T.1 cites the umbrella stage GeneralAlgebraicKTheory:K.2; with that citation changed to K.2:plus, the import becomes possible (restructure).
