# Modularity, automorphy and Langlands endpoint extensions — blueprint

This roadmap owns the endpoint theorems beyond the automorphy-lifting infrastructure: the
register of normalisations and of each endpoint's status, weight-one modularity, the potential
automorphy assembly, symmetric power functoriality and Sato–Tate, the classical-group
classification inputs, and the register of known transfers and frontier conjectures.
Established theorems keep their source hypotheses; general functoriality, all motives
automorphic and categorical correspondences are stated as propositions, never assumed.

This document is generated from the blueprint packet
`research/blueprint/packets/ModularityAndLanglandsExtensions.json` and agrees with it node by
node. Checkpoints 1–2 (Claude Code, cc-39fac3) planned BLGGT and Newton–Thorne I–II; checkpoint
3 (Claude, claude-okz2gt) planned ML.1, ML.4 and ML.5, added the maintainer's routed sources to
ML.0–ML.3, retired seventeen nodes that duplicated other roadmaps, and completed the pass.

| Stage | Coverage | Nodes |
|---|---|---|
| ML.0 Endpoint and normalization registry | `planned` | 13 |
| ML.1 Weight one and broader modularity | `planned` | 8 |
| ML.2 Potential automorphy assembly | `planned` | 32 |
| ML.3 Symmetric powers and Sato-Tate | `planned` | 48 |
| ML.4 Classical-group classification and trace sources | `planned` | 27 |
| ML.5 Known functorial transfers and frontiers | `planned` | 10 |

## Conventions

Local class field theory sends uniformisers to geometric Frobenius elements; the cyclotomic
character has Hodge–Tate weight −1; r_ι(π) satisfies WD(r_ι(π)|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗
|det|^{(1−n)/2}) (BLGGT, ACC+, Newton–Thorne). The arithmetic-Frobenius convention of
IntegralHeckeAndGaloisDeterminants and AutomorphicGaloisRepresentations is related by ρ ↦ ρ^∨
(`ML.0/nt26-normalisation-bridge`). GSp₄ Galois representations are matched with automorphic
ones through rec_GT twisted by |ν|^{−3/2} (`ML.0/gsp4-galois-l-packet`). Archimedean parameters
are AF.1's rec_ℝ, rec_ℂ (ACC+ prints the two labels interchanged).

## Built on, and requested

- **AnalyticNumberTheory:AN.2** — The Wiener–Ikehara/Tauberian prime number theorem for Euler
  products continuing to a neighbourhood of Re s ≥ 1 with no zeros or poles except at s = 1:
  Σ_{N(x)≤n} χ(x) = c·n/log n + o(n/log n) with −c the order at 1 (Kedlaya Theorem 24.2).
  (needed by `ML.3/l-function-equidistribution-criterion`,
  `ML.3/serre-equidistribution-criterion`).
- **AnalyticNumberTheory:AN.4** — Artin L-functions L(ρ, s) of continuous representations ρ :
  G_K → GL_n(ℂ) with finite image, their Euler products and their comparison with automorphic
  L-functions (used to state Langlands' conjecture for Artin representations). (needed by
  `ML.1/strong-artin-conjecture`).
- **ArithmeticLocallySymmetricSpaces:ALS.3** — Hecke operators on the cohomology of the Bianchi
  locally symmetric spaces Γ₁(𝔫)\ℍ³ with coefficients Sym^{k−2}ℂ² ⊗ conj(Sym^{k−2}ℂ²), the
  parabolic subspace H_par and Harder's Eichler–Shimura comparison with cuspidal Bianchi
  eigenforms. (needed by `ML.3/bianchi-modular-forms`).
- **AutomorphicFormsOnReductiveGroups:AF.4** — Clozel's purity lemma (Clozel 1990, Lemme 4.9):
  for F CM and π cuspidal regular algebraic on GL_n(𝔸_F), λ_{τ,i} + λ_{τc,n+1−i} is independent
  of τ; and regularity/algebraicity of weights in the conventions of BCGNT §1.6. (needed by
  `ML.3/parallel-weight-and-clozel-purity`, `ML.4/gl4-symplectic-descent`).
- **AutomorphicGaloisRepresentations:R19.1** — Galois representations of classical holomorphic
  eigenforms of weight ≥ 2 (for the reducibility statements of GSp₄ representations of
  non-general type). (needed by `ML.4/non-general-type-reducible`).
- **AutomorphicGaloisRepresentations:R19.2** — Galois representations of Hilbert modular forms
  of parallel and non-parallel weight, including parallel weight one (Rogawski–Tunnell,
  Jarvis), as used for totally odd Artin representations and for Theorem A of Newton–Thorne
  2026. (needed by `ML.1/non-solvable-residual-modularity`, `ML.1/totally-real-odd-artin`,
  `ML.3/hilbert-symmetric-powers`).
- **AutomorphicGaloisRepresentationsPartII:AG2.0** — Regular algebraic and polarized
  automorphic representations (π, χ) of GL_n(𝔸_F) for F CM or totally real, with BLGGT's
  conditions (χ_v(−1) independent of v | ∞, π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det), χ_v(−1) = (−1)^n for F
  imaginary), weights a ∈ (ℤ^n)^{Hom(F,ℂ),+}_w and the level conditions (prime / potentially
  prime to l). ML.0 registers these conventions; it does not re-define them. (needed by
  `ML.0/blggt-normalization-register`, `ML.0/nt26-normalisation-bridge`).
- **AutomorphicGaloisRepresentationsPartII:AG2.2** — BLGGT v4 Theorem 2.1.1: for regular
  algebraic cuspidal polarized (π, χ), a semisimple r_{l,ı}(π) with (r_{l,ı}(π),
  ε_l^{1−n}r_{l,ı}(χ)) totally odd polarized, local–global compatibility
  ıWD(r|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|^{(1−n)/2}) pure of weight w at v ∤ l (Caraiani),
  de Rham with HT_τ = {a_{ıτ,i} + n − i}, and the same compatibility at v | l when π_v has
  Iwahori-fixed vectors; plus Geraghty's ordinarity comparisons (6)–(7). Also: r_{π,ι} for
  RAESDC and RAECSDC π over totally real and CM fields with local–global compatibility at every
  finite place (Caraiani), as used by Newton–Thorne 2026 §1.2 and Lemma 2.1, and the compatible
  systems R_π of ACC+ §7.1 (Harris–Lan–Taylor–Thorne, Scholze, Varma) for regular algebraic
  cuspidal π over CM fields. (needed by `ML.0/blggt-normalization-register`,
  `ML.0/compatible-system-automorphic-l-function-comparison`, `ML.0/nt26-automorphy-predicate`,
  `ML.2/compatible-system-l-function-continuation`, `ML.2/part-of-compatible-system`,
  `ML.2/steinberg-ordinarity-lemma`, `ML.3/bianchi-ramanujan`, `ML.3/one-prime-criterion`,
  `ML.3/symmetric-power-lifting`, `ML.4/unitary-descent-of-gl4-transfer`).
- **AutomorphicGaloisRepresentationsPartII:AG2.3** — Definite-unitary finite-slope
  eigenvarieties with dense strongly regular classical points and their Galois
  pseudo-representations, as used for E_n in Newton–Thorne I §2. (needed by
  `ML.3/eigenvariety-propagation`).
- **AutomorphicGaloisRepresentationsPartII:AG2.5** — Varma's local–global compatibility
  (semisimplified, with the monodromy bound) for regular algebraic cuspidal π over CM fields,
  used for temperedness at ramified places in BCGNT Theorem 7.1.1. (needed by
  `ML.3/bianchi-ramanujan`).
- **AutomorphicLFunctionsAndLocalFactors:AL.2** — Godement–Jacquet: for cuspidal π on
  GL_n(𝔸_F), L^S(π, s) is entire (n ≥ 2) and satisfies the standard functional equation, with
  twists by finite-order characters; used through a Brauer-induction argument in BLGGT
  Corollary 5.4.3. Also: the Jacquet–Shalika bound for Satake parameters of unitary cuspidal
  representations (AL.2/jacquet-shalika-satake-bound), used for purity from symmetric powers
  (BCGNT Lemma 6.1.3, ACC+ Corollary 7.1.13). (needed by
  `ML.0/compatible-system-automorphic-l-function-comparison`,
  `ML.2/compatible-system-l-function-continuation`, `ML.3/non-cm-symmetric-powers`,
  `ML.3/non-supercuspidal-symmetric-powers`).
- **AutomorphicLFunctionsAndLocalFactors:AL.3** — For cuspidal π, π′ on GL_n, GL_{n′} with
  unitary twists, L^S(π × π′^∨, s) is meromorphic, holomorphic and nonzero at s = 1 unless π ≅
  π′ ⊗ |det|^t, in which case it has a simple pole there (Jacquet–Shalika 1981, Shahidi 1981);
  used in BLGGT Theorem 5.5.2. Also: L(Π, s) ≠ 0 on Re s = 1 for cuspidal Π on GL_n
  (Jacquet–Shalika), used for Sato–Tate. Also: strong multiplicity one for cuspidal and
  isobaric representations (AL.3/strong-multiplicity-one) and the simple pole of L^S(s, π ×
  π^∨) at s = 1 (Jacquet–Shalika), used for the symplectic/orthogonal dichotomy and the
  uniqueness of functorial lifts. (needed by `ML.2/irreducibility-density-one`,
  `ML.3/sato-tate-elliptic-curves`).
- **AutomorphicLFunctionsAndLocalFactors:AL.4** — The Langlands–Shahidi L-functions L^S(s, π,
  Sym²), L^S(s, π, ∧²) and the twisted L^S(s, Π, ∧² ⊗ ω) of cuspidal π on GL_n: meromorphic
  continuation, at most a simple pole at s = 1, and non-vanishing on Re s = 1 (Shahidi 1981,
  1997); and the L-functions of GL₂ × GL₃ and GL₂ × GL₄ used by Kim–Shahidi and Kim. (needed by
  `ML.3/kim-shahidi-sym3`, `ML.3/kim-sym4`, `ML.4/self-dual-cuspidal-type`,
  `ML.4/shahidi-exterior-square`, `ML.5/ckpss-generic-transfer`).
- **EndoscopicTransferAndUnitaryTraceComparison:ET.3** — The fundamental lemma (Ngô), its
  twisted and weighted variants where proved (Chaudouard–Laumon for split groups), and
  Waldspurger's transfer of orbital integrals, as inputs of the stabilisation behind Arthur's
  classification; the twisted weighted fundamental lemma is recorded as open. (needed by
  `ML.4/trace-formula-inputs-register`).
- **EndoscopicTransferAndUnitaryTraceComparison:ET.4** — The simple stable and twisted trace
  formulas for unitary groups and twisted GL_n (the restricted form ET.4 plans), as the part of
  the twisted trace formula and its stabilisation the atlas plans; the full stabilisation of
  Mœglin–Waldspurger is recorded as a gap in ML.4. (needed by
  `ML.4/trace-formula-inputs-register`).
- **EndoscopicTransferAndUnitaryTraceComparison:ET.6** — The local Langlands correspondence for
  GL_n over p-adic fields (Harris–Taylor, Henniart, Scholze), rec_K, with its compatibility
  with twists, duals, central characters and L/ε-factors of pairs, used to define local
  parameters of automorphic representations and functorial lifts. (needed by
  `ML.3/functorial-lift`, `ML.4/extended-langlands-parameter`, `ML.4/gan-takeda-llc-gsp4`,
  `ML.4/global-arthur-parameter`, `ML.4/local-arthur-packets`).
- **EndoscopicTransferAndUnitaryTraceComparison:ET.7a** — Arthur–Clozel cyclic base change and
  descent for GL_n (Theorems 3.4.2, 3.5.1 of AC89) with Harris–Taylor Lemma VII.2.6, and
  automorphic induction from a cyclic CM extension, with the cuspidality criteria; used in
  BLGGT Lemmas 2.2.2, 2.2.4 and Proposition 4.1.1. Also: Arthur–Clozel cyclic base change and
  descent for GL_n of prime degree with soluble iteration, in the form quoted by Newton–Thorne
  2026 §1.2 and used by BCGNT Proposition 6.2.3, and Labesse's base change between unitary
  groups and GL_n used for the Steinberg-at-q forms of Newton–Thorne I and the unitary descent
  in Calegari–Geraghty Lemma 6.9. (needed by `ML.2/p-r-switch`,
  `ML.3/bcgnt-symmetric-powers-purity`, `ML.3/clozel-thorne-reductions`,
  `ML.3/cm-field-symmetric-powers`, `ML.3/steinberg-level-raising`,
  `ML.4/unitary-descent-of-gl4-transfer`, `ML.5/automorphic-induction-register`,
  `ML.5/cyclic-base-change-gln`).
- **GL2AutomorphicRepresentationsAndTransfer:R16.3** — The local Langlands correspondence for
  GL₂ (parameters of principal series, Steinberg and supercuspidal representations), as used by
  Gelbart–Jacquet's lift and by Gan–Takeda. (needed by `ML.0/gsp4-galois-l-packet`,
  `ML.3/gelbart-jacquet`, `ML.4/gan-takeda-llc-gsp4`).
- **GL2AutomorphicRepresentationsAndTransfer:R17.5** — Automorphic induction of Hecke
  characters of quadratic fields to GL₂ and the soluble (dihedral, tetrahedral, octahedral)
  Artin modularity for weight one, with the Kim–Shahidi inputs for the icosahedral case as they
  are recorded there; used for Newton–Thorne II Theorem A.1. Also: R17.5/solvable-artin
  (Langlands–Tunnell) is registered by ML.1/odd-artin-modularity-over-q and rank-two
  automorphic induction by ML.5/automorphic-induction-register (RS-21). (needed by
  `ML.1/totally-real-odd-artin`, `ML.3/cm-and-weight-one-symmetric-powers`,
  `ML.5/automorphic-induction-register`).
- **GL2ModularityLifting:R22.1** — Kisin's modularity lifting theorem for potentially
  Barsotti–Tate lifts over totally real fields (as used for the mod 5 case of BCGP Proposition
  10.1.3). (needed by `ML.1/non-solvable-residual-modularity`).
- **GlobalGaloisDeformations:R04.1** — Universal deformation rings of absolutely irreducible ρ̄
  : G_{F,S} → GL₂(k) with S containing no place above p (Calegari–Geraghty Lemma 4.14). (needed
  by `ML.1/buzzard-taylor-hypotheses`).
- **MetaplecticAutomorphicForms:MP.3** — Local theta correspondences for (GSp₄, GO(V)) with dim
  V = 4, 6 and for (Mp_{2n}, SO_{2n+1}) (Gan–Takeda; Gan–Savin), used to construct the LLC for
  GSp₄ and the local descent to Mp_{2n}. (needed by `ML.4/gan-takeda-llc-gsp4`,
  `ML.5/local-descent-mp2n`).
- **PadicFamilies:L2** — Finite-slope eigenvarieties: the Coleman–Mazur eigencurve E for GL₂/ℚ
  (tame level N, prime p) with its weight map κ, slope map and the classical points (f, α); and
  eigenvarieties E_n for definite unitary groups in n variables with refined points (π, χ);
  with the Zariski density of classical points and irreducible components. Used by
  Newton–Thorne I §§2–3. (needed by `ML.3/buzzard-kilford-eigencurve`,
  `ML.3/eigenvariety-propagation`).
- **PotentialAutomorphyInfrastructure:PA.2** — ACC+ Theorem 5.5.1 (local–global compatibility
  at p for ordinary parts over CM fields, decomposed generic residual representation) and the
  ordinarity comparison of ACC+ Corollary 5.5.2. (needed by
  `ML.2/galois-ordinarity-from-automorphic`).
- **PotentialAutomorphyInfrastructure:PA.4** — The automorphy lifting theorems for
  n-dimensional representations of G_F, F imaginary CM or totally real, of ACC+ §6.1: Theorem
  6.1.1 (Fontaine–Laffaille: crystalline, p unramified, p > n², enormous decomposed generic
  residual image, regular weight below p − 2n) and Theorem 6.1.2 (ordinary of regular weight, p
  > n), with all image, level and local hypotheses (RT-AREA-langlands-1/7). Consumers: Qian,
  BCGNT, Caraiani–Newton, Calegari–Geraghty. (needed by
  `ML.1/imaginary-quadratic-elliptic-modularity`, `ML.2/cg18-conditional-potential-modularity`,
  `ML.2/cg18-odd-symmetric-powers`, `ML.2/dwork-fibre-automorphy-transport`, `ML.2/p-r-switch`,
  `ML.2/qian-ordinary-potential-automorphy`, `ML.3/bcgnt-potential-automorphy-det-cyclotomic`).
- **PotentialAutomorphyInfrastructurePartII:PL.0** — Geraghty's ι-ordinarity, the Steinberg
  weight-zero criterion (PL.0/steinberg-weight-zero-iota-ordinary) and the comparison of
  automorphic and Galois ordinarity in the polarized setting. (needed by
  `ML.2/galois-ordinarity-from-automorphic`, `ML.2/steinberg-ordinarity-lemma`).
- **PotentialAutomorphyInfrastructurePartII:PL.5** — The Dwork family's compatible systems and
  BLGGT Theorem 3.1.2 / Proposition 3.2.1 (potential ordinary automorphy, ordinary lifts with
  prescribed local behaviour), as used in Qian §4 and ACC+ §7.2. (needed by
  `ML.2/dwork-fibre-automorphy-transport`, `ML.2/qian-residual-potential-automorphy`,
  `ML.3/acc-elliptic-symmetric-powers`).
- **PotentialModularityAndCompatibleSystems:R23.1** — Moret-Bailly's theorem: points of a
  smooth geometrically connected variety over a Galois extension unramified at a given set,
  with prescribed local behaviour and linear disjointness (used for Dwork-family points,
  twisted modular curves X_E(q) and auxiliary elliptic curves). (needed by
  `ML.1/imaginary-quadratic-elliptic-modularity`, `ML.1/non-solvable-residual-modularity`,
  `ML.2/potential-weak-automorphy-symmetric-powers`, `ML.2/qian-residual-potential-automorphy`,
  `ML.2/twisted-modular-curve`).
- **PotentialModularityAndCompatibleSystems:R24.5:operations** — Weakly, very weakly and
  extremely weakly compatible systems of l-adic representations (BLGGT §5.1; ACC+ §7.1),
  purity, symmetric powers and duals of systems, and their partial L-functions. (needed by
  `ML.0/compatible-system-archimedean-factors`, `ML.2/acc-auxiliary-primes`,
  `ML.2/patrikis-taylor-potential-automorphy`, `ML.3/purity-from-symmetric-powers`).
- **tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev** — Chebotarev
  density in Dirichlet density form, to compare Galois representations through traces of
  Frobenius and to choose auxiliary primes of density one. (needed by
  `ML.1/strong-artin-conjecture`, `ML.2/acc-auxiliary-primes`,
  `ML.2/dwork-fibre-automorphy-transport`, `ML.2/qian-auxiliary-prime`,
  `ML.3/one-prime-criterion`, `ML.5/cyclic-base-change-gln`).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity**
  — The archimedean Artin maps Art_ℝ (kernel ℝ_{>0}) and Art_ℂ (trivial), as used in ACC+'s
  conventions. (needed by `ML.0/archimedean-langlands-conventions`).
- **tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors**
  — The local Artin map Art_K normalised so that uniformisers go to geometric Frobenius, for
  the definition of L(ρ) in BCGP Definition 2.3.1. (needed by `ML.0/gsp4-galois-l-packet`).
- **tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering**
  — The compactified modular curve X(q) and its cusps, for the twisted modular curve X_E(q).
  (needed by `ML.2/twisted-modular-curve`).
- **tauceti:TauCetiRoadmap/ModularCurves#layer-5-affine-fine-modular-curves-after-inverting-n**
  — The fine moduli scheme Y(q) of elliptic curves with full level-q structure (q ≥ 3) over
  ℤ[1/q], twisted by E[q] to give Y_E(q). (needed by `ML.2/twisted-modular-curve`).
- **tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups** —
  Connected reductive groups over local and global fields, quasi-split forms and their
  (Langlands) dual groups and L-groups, for the definitions of L-parameters and the statements
  of functoriality. (needed by `ML.4/extended-langlands-parameter`,
  `ML.5/functoriality-conjecture`, `ML.5/local-langlands-conjecture-general`).
- **tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem**
  — The Peter–Weyl theorem for compact groups (characters of irreducible representations span
  the class functions), for Serre's equidistribution criterion. (needed by
  `ML.3/serre-equidistribution-criterion`).
- **tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups**
  — Characters and Haar measure of compact groups such as U₂(ℝ)_a, for the Sato–Tate groups of
  BCGNT §7.2. (needed by `ML.3/serre-equidistribution-criterion`).

## Layer ML.0: Endpoint and normalization registry (`TauCeti/NumberTheory/LanglandsRegister/…`)

ML.0 is the register every other layer reports to. Its definition `endpoint-status-register`
gives each endpoint a status — known, conditional or conjectural — derived from its
prerequisite closure, never asserted. The Arthur dependency register records exactly what the
classical-group classification still assumes: after Mœglin–Waldspurger and
Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, only the twisted weighted fundamental lemma. The
normalisation nodes fix the conventions the sources use (BLGGT's, ACC+'s archimedean ones,
Newton–Thorne's geometric Frobenius and Hodge–Tate conventions, BCGP's GSp₄ L-packets L(ρ));
the frontier predicates of Calegari–Geraghty, Pilloni and BCGP 2025 are definitions of
propositions with status conjectural or conditional.

*Coverage.* Checkpoint 3 (claude-okz2gt): endpoint register with known/conditional/conjectural
status, the Arthur dependency register (only the twisted weighted fundamental lemma remains
after AGIKMS), ACC+ archimedean conventions and L-functions of compatible systems,
Newton–Thorne's automorphy predicate and normalisation bridge, BCGP's GSp₄ L-packet of a Galois
representation, and the conjectural/conditional frontier predicates of CG20, Pilloni and
BCGP25.

### Objects

#### `ML.0/endpoint-status-register` — The endpoint register: statement, source version, status and producers ★

*Kind:* definition. *Planet:* Endpoint and normalisation register.
*Declaration:* `TauCeti.LanglandsRegister.EndpointRecord` in `TauCeti/NumberTheory/LanglandsRegister`.

An endpoint record of this roadmap is a tuple (P, s, σ, H, D) where P is the statement (a
proposition about automorphic or Galois objects in the conventions of
ML.0/blggt-normalization-register and ML.0/nt26-normalisation-bridge), s is the selected source
version with its locator, σ ∈ {known, conditional, conjectural} is its status, H is the finite
list of named hypotheses on which a conditional P depends (each a proposition with its own
record), and D is the list of producer nodes (the prerequisite constructions in this and other
roadmaps). The status is derived, not asserted: σ = known iff P is the conclusion of a node all
of whose prerequisite chains end in the libraries, other roadmaps' nodes or requested stages
with no conditional hypothesis; σ = conditional iff H is non-empty and P follows from H with
known inputs; σ = conjectural iff no proof is recorded. A record is upgraded from conditional
to known only by a record proving every member of H.

*Hypotheses.*
- Registry data; it states no mathematics of its own.

*Construction and proof.*
- Records are attached to the theorem nodes of ML.1–ML.5 through their hypotheses lists: every
  hypothesis naming ML.0/arthur-dependency-gate, a conjecture node of ML.0 or ML.5, or a
  conditional input makes the endpoint conditional.
- The register map to prerequisites is the node's prerequisite closure in this packet.

*Uses.*
- ModularityAndLanglandsExtensions:ML.2/cg18-conditional-potential-modularity: recorded as
  conditional on Calegari–Geraghty's Conjecture B
- ModularityAndLanglandsExtensions:ML.4/gsp4-arthur-classification: recorded as conditional on
  ML.0/arthur-dependency-gate
- ModularityAndLanglandsExtensions:ML.0/weight-22-abelian-variety-conjecture: recorded as
  conjectural
- ModularityAndLanglandsExtensions:ML.3/non-cm-symmetric-powers: recorded as known
  (Newton–Thorne II, Theorem A)

| API | role | statement |
|---|---|---|
| `TauCeti.LanglandsRegister.EndpointRecord` | structure | A record (P, source, status, hypotheses, producers). |
| `TauCeti.LanglandsRegister.Status` | data | The three statuses known, conditional and conjectural. |
| `TauCeti.LanglandsRegister.EndpointRecord.holds_of_hypotheses` | characterisation | For a conditional record, (∀ h ∈ H, h) → P. |
| `TauCeti.LanglandsRegister.EndpointRecord.upgrade` | constructor | From a conditional record and proofs of all its hypotheses, a known record with the same statement. |
| `TauCeti.LanglandsRegister.EndpointRecord.known_holds` | projection | A known record yields a proof of P. |

*Unit tests.*
- `TauCeti.LanglandsRegister.ntII_known` (computation): The record of Newton–Thorne II Theorem
  A (symmetric powers of non-CM regular algebraic π) has status known and no hypotheses.
- `TauCeti.LanglandsRegister.cg18_conditional` (computation): The record of Calegari–Geraghty
  Theorem 1.1(1) has status conditional with H = [Conjecture B].
- `TauCeti.LanglandsRegister.weight22_conjectural` (computation): The record of the weight
  (2,2) Siegel/abelian variety statement (CG20 §5.4) has status conjectural.
- `TauCeti.LanglandsRegister.unitary_does_not_upgrade` (non-example): A record conditional on
  ML.0/arthur-dependency-gate is not upgraded by a known record of Mok's unitary
  classification: upgrade needs proofs of the listed hypotheses themselves.
- `TauCeti.LanglandsRegister.empty_hypotheses` (degenerate): A conditional record with H = []
  is the same as a known record (holds_of_hypotheses with no hypotheses).

*Acceptance.*
- Each endpoint of ML.1–ML.5 has a status read off from its record, and a map to its
  prerequisite constructions (the acceptance criterion of ML.0).

*Depends on:* `ML.0/blggt-version-register`.

*Source.*
- cg-2018, Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv
  v2) = Invent. pp. 428–429 —
  Model of a conditional endpoint: Calegari–Geraghty's Theorem 1.1 assumes their Conjecture B.

#### `ML.0/archimedean-langlands-conventions` — Archimedean Langlands parameters rec_ℝ, rec_ℂ, isobaric sums ⊞ and BC_{ℂ/ℝ}

*Kind:* construction.
*Declaration:* `TauCeti.LanglandsRegister.recArch` in `TauCeti/NumberTheory/LanglandsRegister`.

Art_ℝ : ℝ^× ↠ Gal(ℂ/ℝ) and Art_ℂ : ℂ^× ↠ Gal(ℂ/ℂ) are the unique continuous surjections. For K
= ℝ (resp. ℂ), rec_K is Langlands' bijection (owner: AutomorphicFormsOnReductiveGroups
AF.1/archimedean-llc-gln; this node fixes ACC+'s use of it and constructs ⊞ and BC on top) from
irreducible admissible (Lie GL_n(ℝ) ⊗_ℝ ℂ, O(n))-modules (resp. (Lie GL_n(ℂ) ⊗_ℝ ℂ,
U(n))-modules) to continuous semisimple n-dimensional representations of the Weil group W_K.
For modules π_i of rank n_i, the isobaric sum π₁ ⊞ ⋯ ⊞ π_r is defined by rec_K(π₁ ⊞ ⋯ ⊞ π_r) =
rec_K(π₁) ⊕ ⋯ ⊕ rec_K(π_r); for π a (Lie GL_n(ℝ) ⊗ ℂ, O(n))-module, BC_{ℂ/ℝ}(π) is the (Lie
GL_n(ℂ) ⊗ ℂ, U(n))-module with rec_ℂ(BC_{ℂ/ℝ}(π)) = rec_ℝ(π)|_{W_ℂ}. ACC+ print the labels
rec_ℝ and rec_ℂ interchanged (recorded as a source issue).

*Hypotheses.*
- n ≥ 1; modules are (𝔤, K)-modules in the sense of AutomorphicFormsOnReductiveGroups AF.1.

*Construction and proof.*
- n = 1: rec_K(χ) = χ ∘ Art_K^{−1} on W_K^{ab} ≅ K^× (Tau Ceti class field theory supplies
  Art_K).
- General n: Langlands' classification — every irreducible admissible module is the Langlands
  quotient of a standard module induced from characters (and, for ℝ, discrete series of GL₂(ℝ))
  — matched with the decomposition of a semisimple W_K-representation into irreducibles of
  dimension ≤ 2.
- BC_{ℂ/ℝ} and ⊞ are then defined on the Galois side, transported through rec.

*Uses.*
- Allen et al. 2023, §2.3 and §7: weights at infinity of regular algebraic representations and
  the archimedean L-factors of compatible systems
- ModularityAndLanglandsExtensions:ML.0/compatible-system-archimedean-factors: Γ-factors are
  those of rec_K of the archimedean components
- ModularityAndLanglandsExtensions:ML.4/gsp4-gl4-archimedean-transfer: the transfer of π_∞ to
  GL₄(ℝ) is computed on rec_ℝ

| API | role | statement |
|---|---|---|
| `TauCeti.LanglandsRegister.recArch` | data | rec_K : irreducible admissible GL_n(K)-modules → semisimple n-dimensional W_K-representations, K = ℝ, ℂ. |
| `TauCeti.LanglandsRegister.recArch_bijective` | equivalence | rec_K is a bijection onto isomorphism classes. |
| `TauCeti.LanglandsRegister.recArch_gl1` | simp | For n = 1, rec_K(χ) = χ ∘ Art_K^{−1}. |
| `TauCeti.LanglandsRegister.isobaricSum` | constructor | π₁ ⊞ π₂ with rec(π₁ ⊞ π₂) = rec(π₁) ⊕ rec(π₂). |
| `TauCeti.LanglandsRegister.baseChangeCR` | constructor | BC_{ℂ/ℝ}(π) with rec_ℂ(BC_{ℂ/ℝ}(π)) = rec_ℝ(π)|_{W_ℂ}. |
| `TauCeti.LanglandsRegister.recArch_twist` | compatibility | rec_K(π ⊗ (χ ∘ det)) = rec_K(π) ⊗ rec_K(χ). |
| `TauCeti.LanglandsRegister.recArch_dual` | compatibility | rec_K(π^∨) = rec_K(π)^∨. |

*Unit tests.*
- `TauCeti.LanglandsRegister.recArch_sign` (computation): rec_ℝ(sgn) is the character of W_ℝ
  that is trivial on W_ℂ = ℂ^× and sends j to −1.
- `TauCeti.LanglandsRegister.recArch_trivial_gl2` (computation): rec_ℝ(1_{GL₂(ℝ)}) = |·|^{1/2}
  ⊕ |·|^{−1/2} (the trivial module is the Langlands quotient of the induced module from
  |·|^{1/2} ⊗ |·|^{−1/2}).
- `TauCeti.LanglandsRegister.baseChange_gl1` (degenerate): n = 1: BC_{ℂ/ℝ}(χ) = χ ∘ N_{ℂ/ℝ}.
- `TauCeti.LanglandsRegister.discreteSeries_not_isobaric` (non-example): rec_ℝ(D_k) for a
  discrete series D_k (k ≥ 2) is irreducible of dimension 2, so D_k is not an isobaric sum of
  characters, while BC_{ℂ/ℝ}(D_k) is.

*Acceptance.*
- Check the discrete series: for k ≥ 2, rec_ℝ(D_k) = Ind_{W_ℂ}^{W_ℝ}(z ↦ (z/z̄)^{(k−1)/2}) up
  to the twist by |·|^{s} fixed by the central character.

*Depends on:* `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln`,
`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

*Source.*
- acc-2023, §1.2 Notation, arXiv v2 p. 11 (Annals pp. 907–908) — ACC+ §1.2 notation for Art, rec_ℝ, rec_ℂ, ⊞ and BC_{ℂ/ℝ}.

#### `ML.0/compatible-system-archimedean-factors` — Archimedean Euler factors and completed L-function of a pure compatible system

*Kind:* construction.
*Declaration:* `TauCeti.LanglandsRegister.completedL` in `TauCeti/NumberTheory/LanglandsRegister`.

Let R = (M, S, {Q_v(X)}, {r_λ}, {H_τ}) be a weakly compatible system of l-adic representations
of G_F, F a number field, which is pure of weight w. Its partial L-function is L^S(R, s) = ∏_{v
∉ S} Q_v(q_v^{−s})^{−1}, converging for Re s > 1 + w/2. At an infinite place v the archimedean
factor L_v(R, s) is the L-factor of the semisimple W_{F_v}-representation determined by the
Hodge–Tate data H_τ (τ above v) and, for v real, by the action of complex conjugation
(equivalently, by Hodge numbers h^{p,q} and the sign of the involution on h^{p,p}), with Γ_ℝ(s)
= π^{−s/2}Γ(s/2) and Γ_ℂ(s) = 2(2π)^{−s}Γ(s); the completed L-function is Λ(R, s) = L^S(R,
s)·∏_{v ∈ S finite} L_v(R, s)·∏_{v | ∞} L_v(R, s).

*Hypotheses.*
- R pure of weight w with Hodge–Tate data; at real places the multiplicity of each eigenvalue
  of complex conjugation is independent of λ (part of the definition of a compatible system
  used by ACC+).

*Construction and proof.*
- The W_ℂ-representation at a complex place is ⊕_τ ⊕_{h ∈ H_τ} z^{−h} z̄^{h−w}-type characters;
  at a real place one adds the eigenvalues of complex conjugation on the pairs h = w/2.
- The Γ-factor of a character or a two-dimensional induced representation of W_ℝ is the
  standard one (Tate's thesis for GL₁, Langlands' for W_ℝ).

*Uses.*
- ModularityAndLanglandsExtensions:ML.2/compatible-system-l-function-continuation: meromorphic
  continuation and functional equation of Λ(R, s)
- ModularityAndLanglandsExtensions:ML.3/completed-symmetric-power-l-function: Λ(Sym^n E, s)
- Allen et al. 2023, §7.1: the functional equation for symmetric powers of elliptic curves over
  CM fields

| API | role | statement |
|---|---|---|
| `TauCeti.LanglandsRegister.partialL` | data | L^S(R, s) = ∏_{v ∉ S} Q_v(q_v^{−s})^{−1} for Re s > 1 + w/2. |
| `TauCeti.LanglandsRegister.archimedeanFactor` | data | L_v(R, s) for v | ∞ from the Hodge–Tate data and complex conjugation. |
| `TauCeti.LanglandsRegister.completedL` | data | Λ(R, s) including all finite and archimedean factors. |
| `TauCeti.LanglandsRegister.partialL_converges` | other | Absolute convergence for Re s > 1 + w/2 (purity). |
| `TauCeti.LanglandsRegister.archimedeanFactor_directSum` | compatibility | L_v(R ⊕ R′, s) = L_v(R, s)·L_v(R′, s). |
| `TauCeti.LanglandsRegister.archimedeanFactor_tate` | simp | L_v(R(1), s) = L_v(R, s + 1) (twist by the cyclotomic character). |

*Unit tests.*
- `TauCeti.LanglandsRegister.archFactor_trivial_Q` (computation): R = the trivial character of
  G_ℚ: L_∞(R, s) = Γ_ℝ(s) and Λ(R, s) = π^{−s/2}Γ(s/2)ζ(s).
- `TauCeti.LanglandsRegister.archFactor_ellipticCurve` (computation): R = H¹ of an elliptic
  curve over ℚ: L_∞(R, s) = Γ_ℂ(s) = 2(2π)^{−s}Γ(s).
- `TauCeti.LanglandsRegister.archFactor_sign_character` (non-example): The quadratic character
  of ℚ(i): L_∞ = Γ_ℝ(s + 1), not Γ_ℝ(s) — the sign of complex conjugation matters.
- `TauCeti.LanglandsRegister.partialL_rank_zero` (degenerate): The zero system has L^S = 1 and
  Λ = 1.

*Acceptance.*
- For R = H¹ of an elliptic curve over ℚ (weight 1) the archimedean factor is Γ_ℂ(s).

*Depends on:* `ML.0/archimedean-langlands-conventions`,
`PotentialModularityAndCompatibleSystems:R24.5:operations`.

*Source.*
- acc-2023, §7.1, definition of purity and the paragraph after it, arXiv v2 pp. 197–198 (Annals
  p. 1092 per routed locator) — ACC+ §7.1 defines
  L(R, s) with its archimedean Euler factors.

#### `ML.0/nt26-automorphy-predicate` — Automorphic Galois representations in Newton–Thorne's sense

*Kind:* definition.
*Declaration:* `TauCeti.LanglandsRegister.IsAutomorphicNT` in `TauCeti/NumberTheory/LanglandsRegister`.

Let F be a totally real or CM number field and p a prime. A continuous representation ρ : G_F →
GL_n(Q̄_p) is automorphic if there are a RAESDC or RAECSDC (regular algebraic, essentially
(conjugate) self-dual, cuspidal) automorphic representation π of GL_n(𝔸_F) and an isomorphism ι
: Q̄_p ≅ ℂ with ρ ≅ r_{π,ι}, normalised as in ML.0/nt26-normalisation-bridge. The definition
forces ρ to be (conjugate-)self-dual up to twist and conjecturally irreducible; Newton–Thorne
note that it is not the most general one could adopt.

*Hypotheses.*
- F totally real or CM; p prime; π RAESDC or RAECSDC, so that r_{π,ι} exists
  (AutomorphicGaloisRepresentationsPartII AG2.2).

*Construction and proof.*
- The definition is the paragraph before Lemma 2.1 of Newton–Thorne 2026, transcribed in the
  conventions of ML.0.
- Compare with BLGGT's polarized notion (PotentialAutomorphyInfrastructurePartII
  PL.0/automorphic-polarized-representation): for ρ polarized, ρ is automorphic in
  Newton–Thorne's sense iff (ρ, µ) is automorphic in BLGGT's sense for the multiplier µ (strong
  multiplicity one and Chebotarev).

*Uses.*
- Newton–Thorne 2026, Lemma 2.1: the one-prime criterion: automorphy of Sym^{n−1}r_ι(π) at one
  prime gives Sym^{n−1}π
- ModularityAndLanglandsExtensions:ML.3/one-prime-criterion: the statement SP_n in Galois terms
- ModularityAndLanglandsExtensions:ML.3/sp-statement: SP_n is defined through this predicate

| API | role | statement |
|---|---|---|
| `TauCeti.LanglandsRegister.IsAutomorphicNT` | data | ρ ≅ r_ι(π) for some regular algebraic cuspidal π. |
| `TauCeti.LanglandsRegister.IsAutomorphicNT.of_iso` | extensionality | Invariant under isomorphism of ρ. |
| `TauCeti.LanglandsRegister.IsAutomorphicNT.twist` | compatibility | ρ automorphic and χ an algebraic Hecke character's Galois character ⇒ ρ ⊗ r_ι(χ) automorphic. |
| `TauCeti.LanglandsRegister.IsAutomorphicNT.iff_blggt` | compatibility | For irreducible polarized (ρ, µ): IsAutomorphicNT ρ ↔ BLGGT-automorphic (ρ, µ) (for reducible ρ the multiplier µ is not unique). |
| `TauCeti.LanglandsRegister.IsAutomorphicNT.irreducible` | relation | An automorphic ρ in this sense with π cuspidal is expected irreducible; this is not part of the definition. |

*Unit tests.*
- `TauCeti.LanglandsRegister.IsAutomorphicNT.ellipticCurve` (computation): For E/ℚ an elliptic
  curve, the p-adic Tate module representation of G_ℚ is automorphic (BCDT), with π of weight
  2.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.character` (degenerate): n = 1: ρ is automorphic
  iff ρ = r_ι(χ) for an algebraic Hecke character χ (class field theory).
- `TauCeti.LanglandsRegister.IsAutomorphicNT.reducible_not` (non-example): ρ = 1 ⊕ ε_p^{−1} is
  not automorphic in this sense: an isobaric sum is not cuspidal.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.weightOne_not` (non-example): The Galois
  representation of a weight-one newform is not automorphic in this sense: π is not regular
  algebraic.

*Acceptance.*
- The predicate depends only on ρ up to isomorphism and is independent of ι when π is
  cohomological (r_ι(π) for another ι′ is r_{ι′}(π′) for a Galois conjugate π′).

*Depends on:* `ML.0/nt26-normalisation-bridge`,
`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`,
`AutomorphicGaloisRepresentationsPartII:AG2.2`.

*Source.*
- nt-2026, §2 ('Some comforting lemmas'), opening paragraph immediately before Lemma 2.1, p. 9
  (arXiv v2) — Newton–Thorne's definition of an automorphic Galois representation.

#### `ML.0/gsp4-galois-l-packet` — The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)

*Kind:* definition.
*Declaration:* `TauCeti.LanglandsRegister.GSp4.lPacketOf` in `TauCeti/NumberTheory/LanglandsRegister`.

Fix for every prime p an isomorphism ı : ℂ ≅ Q̄_p (it fixes square roots in Q̄_p of the
positive rationals, the images of the positive real ones). Let K/ℚ_l be finite and ρ : G_K →
GSp₄(Q̄_p) continuous with p ≠ l. L(ρ) is the set of isomorphism classes of irreducible smooth
Q̄_p-representations π of GSp₄(K) with rec_{GT,p}(π ⊗ |ν|^{−3/2}) ≅ WD(ρ)^{F-ss}, where
rec_{GT,p} is Gan–Takeda's correspondence (ML.4/gan-takeda-llc-gsp4 is its owner; it is
registered here only through its use) conjugated by ı. For a Weil–Deligne representation (r,
N), n((r, N)) is the rank of N; for π irreducible admissible of GL_n(K) (resp. GSp₄(K)), n(π)
:= n(rec(π)) (resp. n(rec_GT(π))). Boxer–Calegari–Gee–Pilloni use the ı-independence of L(ρ)
only for unramified representations and for the rank of the monodromy of representations with
Iwahori-fixed vectors.

*Hypotheses.*
- K/ℚ_l finite, p ≠ l; ı fixed; the twist |ν|^{−3/2} uses the square root of the residue
  cardinality q of K fixed by ı.

*Construction and proof.*
- Transport rec_GT to Q̄_p-coefficients through ı.
- Independence of ı in the two cases used: unramified representations (Satake parameters are
  algebraic) and the rank of N for Iwahori-spherical representations (explicit from
  Roberts–Schmidt's tables).

*Uses.*
- Boxer–Calegari–Gee–Pilloni 2021, Propositions 2.4.22, 2.4.24 and §7.13: local–global
  compatibility of GSp₄ Galois representations is stated as π_v ∈ L(ρ|_{G_{F_v}})
- ModularityAndLanglandsExtensions:ML.4/non-general-type-reducible: WD(ρ_{π,p})^{ss} ≅
  rec_{GT,p}(π_v ⊗ |ν|^{−3/2})^{ss}
- AutomorphicGaloisRepresentationsPartII AG2.6: the GSp₄ normalisation dictionary requested
  from ML

| API | role | statement |
|---|---|---|
| `TauCeti.LanglandsRegister.GSp4.lPacketOf` | data | L(ρ) as a set of irreducible smooth Q̄_p-representations. |
| `TauCeti.LanglandsRegister.GSp4.mem_lPacketOf` | characterisation | π ∈ L(ρ) ↔ rec_{GT,p}(π ⊗ |ν|^{−3/2}) ≅ WD(ρ)^{F-ss}. |
| `TauCeti.LanglandsRegister.GSp4.lPacketOf_twist` | compatibility | L(ρ ⊗ χ) = L(ρ) ⊗ (χ ∘ Art ∘ ν) for a character χ. |
| `TauCeti.LanglandsRegister.GSp4.lPacketOf_nonempty` | relation | L(ρ) is non-empty and has 1 or 2 elements. |
| `TauCeti.LanglandsRegister.monodromyRank` | data | n(π), the rank of the monodromy of rec(π) or rec_GT(π). |

*Unit tests.*
- `TauCeti.LanglandsRegister.GSp4.lPacketOf_unramified` (computation): For ρ unramified with
  ρ(Frob) of eigenvalues q^{3/2}·(α₁, α₂, α₃, α₄) (q the residue cardinality of K), L(ρ) is the
  unramified constituent of the principal series with Satake parameters (α_i).
- `TauCeti.LanglandsRegister.monodromyRank_unramified` (degenerate): For π unramified, n(π) =
  0.
- `TauCeti.LanglandsRegister.monodromyRank_steinberg` (computation): For the Steinberg
  representation of GSp₄(K), n(π) = 3 (N regular nilpotent in GSp₄(ℂ)).
- `TauCeti.LanglandsRegister.GSp4.lPacketOf_size_two` (non-example): For a tempered parameter
  with A_φ = ℤ/2ℤ, L(ρ) has two elements, exactly one of them generic: L(ρ) is not a singleton.

*Acceptance.*
- Check the twist on unramified principal series: for π = χ₁ × χ₂ ⋊ σ unramified, L(ρ) ∋ π iff
  ρ(Frob) has eigenvalues the Satake parameters shifted by p^{3/2}.

*Depends on:*
`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`,
`GL2AutomorphicRepresentationsAndTransfer:R16.3`, `ML.0/endpoint-status-register`.

*Source.*
- bcgp-2021, Definition 2.3.1, §2.3, p. 19 (arXiv v3): “then we write L(ρ) for the L-packet
  associated to ρ, which by deﬁnition is the set of equivalence classes of irreducible smooth”
  — BCGP Definition 2.3.1.
- bcgp-2021, Remark 2.3.2, §2.3, p. 19 (arXiv v3) — BCGP Remarks 2.3.2–2.3.3.
- bcgp-2021, §2.3, after Remark 2.3.3, p. 19 (arXiv v3) — BCGP: n(π) := n(rec(π)) (resp. n(rec_GT(π))).

#### `ML.0/weight-22-abelian-variety-conjecture` — Conjecture: weight (2,2) Siegel eigenforms come from abelian varieties with real multiplication (conjectural endpoint)

*Kind:* definition.
*Declaration:* `TauCeti.LanglandsRegister.WeightTwoTwoConjecture` in `TauCeti/NumberTheory/LanglandsRegister`.

WeightTwoTwoConjecture is the proposition: for every cuspidal Siegel modular eigenform of genus
2 and weight (2, 2) over ℚ (in Calegari–Geraghty's normalisation) there are a totally real
field E of degree n and an abelian variety M/ℚ of dimension 2n with E ↪ End_ℚ(M) ⊗ ℚ whose
λ-adic Galois representations, restricted to the E-eigenspaces, are those of the eigenform.
Status: conjectural; Calegari–Geraghty state it as a heuristic (§5.4) suggesting that residual
representations of type U₃ at x with σ = (2, 2) admit no minimal lifts, and no proof uses it.

*Hypotheses.*
- Frontier statement; status conjectural in ML.0/endpoint-status-register.

*Construction and proof.*
- Definition of the proposition only.

*Uses.*
- Calegari–Geraghty 2020, §5.4: heuristic for the absence of minimal lifts of type U₃
- ModularityAndLanglandsExtensions:ML.0/endpoint-status-register: recorded with status
  conjectural

| API | role | statement |
|---|---|---|
| `TauCeti.LanglandsRegister.WeightTwoTwoConjecture` | data | The proposition stated. |
| `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.dim` | relation | Under the conjecture, dim M = 2[E : ℚ]. |
| `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.semistable_unipotent` | relation | Under the conjecture, inertia at a semistable prime acts with (σ − 1)² = 0 (Grothendieck), so type U₃ cannot occur. |

*Unit tests.*
- `TauCeti.LanglandsRegister.weight22_status` (computation): The endpoint record of
  WeightTwoTwoConjecture has status conjectural.
- `TauCeti.LanglandsRegister.weight22_E_eq_Q` (degenerate): n = 1: the statement is that weight
  (2, 2) eigenforms with rational eigenvalues come from abelian surfaces over ℚ.
- `TauCeti.LanglandsRegister.weight22_not_proved` (non-example): No node of this roadmap has
  WeightTwoTwoConjecture among its proved conclusions.

*Acceptance.*
- Known instance: paramodular forms attached to abelian surfaces over ℚ (BCGP's potential
  modularity runs the other way, abelian variety ⇒ form).

*Depends on:* `ML.0/gsp4-galois-l-packet`, `ML.0/endpoint-status-register`.

*Source.*
- cg-2020, §5.4 'Torsion classes', publ. p. 831; quoted from arXiv v1 §5.4 p. 24:
  “Conjecturally, Siegel modular eigenforms of weight (2, 2) should be associated to abelian
  varieties M/Q of dimension 2n equipped with an injection E → EndQ (M )⊗Q” — Calegari–Geraghty
  §5.4: the conjecture as stated.

#### `ML.0/expected-crystallinity-newton-above-hodge` — Expected de Rham and crystalline properties of GSp₄ Galois representations in singular weight (Pilloni Remark 5.3.2)

*Kind:* definition.
*Declaration:* `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge` in `TauCeti/NumberTheory/LanglandsRegister`.

ExpectedSingularWeightHodge is the proposition: for a system of Hecke eigenvalues Θ occurring
in the coherent cohomology H^i(S^tor_{K,Σ}, Ω^{(k,r)}), (k, r) ∈ ℤ_{≥0} × ℤ (or its cuspidal
version), of the Siegel threefold, the attached semisimple ρ_{Θ,λ} : G_ℚ → GL₄(E_λ) is de Rham
at p with Hodge–Tate weights (0, r − 2, r + k − 1, k + 2r − 3) (cyclotomic character of weight
−1), crystalline at p if (N, p) = 1, with Newton polygon above the Hodge polygon. Status:
conjectural in general; in cohomological weight (r ≠ 2, k + r ≠ 1, k + 2r ≠ 3) the
Newton-above-Hodge statement is a consequence of V. Lafforgue's theorem.

*Hypotheses.*
- Frontier statement; status conjectural (cohomological weight: Newton above Hodge known).

*Construction and proof.*
- Definition of the proposition only.

*Uses.*
- Pilloni 2020, Remark 5.3.2: expectation, not used in proofs
- ModularityAndLanglandsExtensions:ML.0/endpoint-status-register: recorded as conjectural,
  partly known

| API | role | statement |
|---|---|---|
| `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge` | data | The proposition stated. |
| `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.hodgeTate` | relation | The expected Hodge–Tate weights are (0, r − 2, r + k − 1, k + 2r − 3). |
| `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.cohomological` | relation | For k ≥ 0 in cohomological weight the Hodge–Tate weights are pairwise distinct. |

*Unit tests.*
- `TauCeti.LanglandsRegister.hodgeTate_k2_r1` (computation): k = 2, r = 1 (a cohomological
  weight: r ≠ 2, k + r ≠ 1, k + 2r ≠ 3): the expected weights (0, −1, 2, 1) are distinct.
- `TauCeti.LanglandsRegister.hodgeTate_singular` (non-example): r = 2: the weights (0, 0, k +
  1, k + 1) repeat, so the weight is not cohomological.
- `TauCeti.LanglandsRegister.hodgeTate_degenerate` (degenerate): k = 0, r = 2: the weights are
  (0, 0, 1, 1), those of H¹ of an abelian surface.

*Acceptance.*
- Pilloni Theorem 5.3.1 constructs ρ_{Θ,λ}; the expectation concerns its p-adic Hodge theory.

*Depends on:* `PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`,
`ML.0/endpoint-status-register`.

*Source.*
- pilloni-2020, §5.3, Remark 5.3.2, p. 25 (author version) — Pilloni Remark 5.3.2.
- pilloni-2020, §5.3, Remark 5.3.2, p. 26 (author version) — Pilloni: the last statement follows from [45] (V.
  Lafforgue) in cohomological weight.

### Theorems, comparisons and registers

#### `ML.0/blggt-normalization-register` — BLGGT's normalisations of automorphic Galois representations

*Kind:* comparison.
*Declaration:* `TauCeti.PotentialAutomorphy.normalizationRegister` in `TauCeti/NumberTheory/PotentialAutomorphy/Normalization`.

Register of the conventions BLGGT (arXiv v4) fixes, against which every ML.2 statement is read.
(1) A polarized automorphic representation of GL_n(𝔸_F) is a pair (π, χ) with χ :
𝔸_{F⁺}^×/(F⁺)^× → ℂ^× continuous, χ_v(−1) independent of v | ∞, and π^c ≅ π^∨ ⊗ (χ ∘ N_{F/F⁺} ∘
det), with χ_v(−1) = (−1)^n for v | ∞ when F is imaginary; v4's "polarized" replaces v1's
RAECSDC (F imaginary CM) and RAESDC (F totally real). (2) Weights a ∈ (ℤ^n)^{Hom(F,ℂ),+}: π has
weight a if π_∞ has the infinitesimal character of Ξ_a^∨; then a ∈ (ℤ^n)_w for some w. (3) The
Galois normalisation: (r_{l,ı}(π), ε_l^{1−n}r_{l,ı}(χ)) is totally odd polarized,
HT_τ(r_{l,ı}(π)) = {a_{ıτ,1} + n − 1, …, a_{ıτ,n}}, and ıWD(r_{l,ı}(π)|_{G_{F_v}})^{F-ss} ≅
rec(π_v ⊗ |det|_v^{(1−n)/2}) for v ∤ l (and for v | l when π_v has Iwahori-fixed vectors). (4)
HT_τ(ε_l) = {−1} and Art_K sends uniformisers to geometric Frobenius. (5) Being automorphic
does not depend on ı (Clozel, Theorem 3.13).

*Hypotheses.*
- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı :
  Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1)
  ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

*Construction and proof.*
- Collect the definitions of BLGGT §2.1 and §1 (notation) and compare each with AG2.0's
  polarized case and AG2.2's realisation; the v1 → v4 renaming (RAECSDC/RAESDC → polarized) is
  recorded in blggt-version-register.

*Acceptance.*
- Check the parity condition on an example: for F imaginary CM and n = 2, χ_v(−1) = +1, so
  ε_l^{−1}r_{l,ı}(χ) is −1 on every complex conjugation (totally odd).
- Check the Hodge–Tate normalisation on a weight-0 π: HT_τ = {n − 1, n − 2, …, 0}, n distinct
  integers.

*Depends on:* `AutomorphicGaloisRepresentationsPartII:AG2.0`,
`AutomorphicGaloisRepresentationsPartII:AG2.2`.

*Source.*
- blggt-2014-v4, §2.1, p. 32 (arXiv v4) — The
  definition of polarized automorphic representations, with BLGGT's remark on the renaming.
- blggt-2014-v4, §2.1, Theorem 2.1.1, pp. 33–34 (arXiv v4) — Theorem 2.1.1: the Galois representations r_{l,ı}(π)
  and their normalisations.

#### `ML.0/blggt-version-register` — BLGGT source versions: arXiv v1 against v4 (Annals 2014)

*Kind:* comparison.
*Declaration:* `TauCeti.PotentialAutomorphy.versionRegister` in `TauCeti/NumberTheory/PotentialAutomorphy/Normalization`.

ML binds its BLGGT statements to arXiv v4 (9 December 2013), the version preceding Ann. of
Math. 179 (2014), 501–609. PotentialModularityAndCompatibleSystems part R24.3 cites arXiv v1
(2010). Correspondence: v1 §2.2 (minimal lifting, Theorem 2.2.1) = v4 §2.3 (Theorem 2.3.1); v1
§2.3 (ordinary lifting, Theorem 2.3.1) = v4 §2.4 (Theorem 2.4.1, now also for totally real F);
v4 §2.2 (Lemmas 2.2.1–2.2.4 on automorphy) is new; v1 §5.2 (Lemma 5.2.1, Proposition 5.2.2) =
v4 §5.3 (Lemma 5.3.1, Proposition 5.3.2); v1 Lemma 5.2.3 = v4 Lemma 5.4.5; v1 §5.3 (Theorem
5.3.1, Corollaries 5.3.2–5.3.3, Proposition 5.3.4) = v4 §5.4 (Theorem 5.4.1 with Corollary
5.4.2, Corollary 5.4.3, Corollary 5.4.4, Proposition 5.4.6); v1 §5.4 (Theorems 5.4.1–5.4.3) =
v4 §5.5 (Theorems 5.5.1–5.5.3); v4 §5.2 (rational compatible systems) is new. v4 renames
RAECSDC/RAESDC to "polarized" and "essentially conjugate self-dual" to "polarized", and states
the lifting theorems for polarized (r, µ) with the "potentially diagonalizably automorphic"
hypothesis.

*Hypotheses.*
- Both versions read on the text layer; theorem statements compared side by side.

*Construction and proof.*
- Compare section headings and theorem statements of arXiv v1 (sha 697e2d3…) and v4 (sha
  c953df6…).

*Acceptance.*
- Check one renumbered pair: v1 Theorem 5.3.1 and v4 Theorem 5.4.1 both give potential
  automorphy of irreducible, regular, totally odd, polarized weakly compatible systems.

*Depends on:* `ML.0/blggt-normalization-register`.

*Source.*
- blggt-2014-v4, title page and table of contents, p. 1 (arXiv v4) — arXiv v4, dated 9 December 2013.

#### `ML.0/arthur-dependency-gate` — Arthur dependency register: the conditional status of the endoscopic classification

*Kind:* comparison.
*Declaration:* `TauCeti.LanglandsRegister.arthurGate` in `TauCeti/NumberTheory/LanglandsRegister`.

Arthur's endoscopic classification for quasi-split symplectic and orthogonal groups (2013), and
the results deduced from it — Mok's classification for quasi-split unitary groups,
Kaletha–Mínguez–Shin–White for their inner forms, Gee–Taïbi's classification for GSp₄, Xu's
packets and multiplicity formula for GSp_{2n}, Ishimoto's for non-split odd orthogonal groups —
are recorded with status conditional. Arthur's book rests on his Hypothesis 3.2.1
(stabilisation of the twisted trace formula of GL(N) and SO(2n)) and on his announced
references [A24]–[A27]. The stabilisation is Mœglin–Waldspurger's (2016), [A24] is settled
there, and [A25]–[A27] are proved by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin, so that the one
remaining hypothesis is the twisted weighted fundamental lemma, which Mœglin–Waldspurger state
as [MW, II.4.4] and which reduces to the weighted fundamental lemma for Lie algebras of
non-split groups and its non-standard version (no written proof; the split case is
Chaudouard–Laumon). Every endpoint using one of these classifications carries this hypothesis
visibly; the register does not claim that the weighted fundamental lemma follows from the
(proved) unweighted one.

*Hypotheses.*
- Registry; the hypothesis it names is carried by every consumer.

*Construction and proof.*
- The stabilisation of the twisted trace formula is proved by Mœglin–Waldspurger (2016); the
  remaining inputs are as stated by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin §§0.3–0.4
  (ML.4/trace-formula-inputs-register).
- BCGP 2021 §1.4.1 and 2025 §1.6 and CG 2020 §1.4 state the dependence for the GSp₄ results
  they use.

*Acceptance.*
- Every node of ML.4 with Arthur's, Mok's, KMSW's, Gee–Taïbi's or Xu's results among its inputs
  lists this register.

*Depends on:* `ML.0/endpoint-status-register`.

*Source.*
- bcgp-2021, §1.4.1 'The work of Arthur', p. 14 (arXiv v3) — BCGP 2021 §1.4.1: the dependence on the twisted weighted fundamental lemma and
  [A24]–[A27].
- bcgp-2025, §1.6 'The work of Arthur', pp. 7–8 (arXiv v1) — BCGP
  2025 §1.6: after AGIKMS only the twisted weighted fundamental lemma remains.
- agikms-2024, Abstract, p. 1 (arXiv v3) — AGIKMS
  abstract: the classification is conditional only on the twisted weighted fundamental lemma.
- arthur-2013, §3.2, Hypothesis 3.2.1, p. 137; Preface p. xvi (2011 manuscript) — Arthur's Hypothesis 3.2.1.

#### `ML.0/compatible-system-automorphic-l-function-comparison` — L-functions of the compatible system of an automorphic representation

*Kind:* theorem.
*Declaration:* `TauCeti.LanglandsRegister.completedL_automorphic` in `TauCeti/NumberTheory/LanglandsRegister`.

Let π be a regular algebraic cuspidal automorphic representation of GL_n(𝔸_F), F CM or totally
real, with an attached compatible system R_π = (r_{λ}(π))
(AutomorphicGaloisRepresentationsPartII AG2.2). Then for every finite set S containing the
places where π or R_π ramifies, L^S(R_π, s) = L^S(π, s + (1 − n)/2), and the archimedean
factors agree: L_v(R_π, s) = L_v(π_v, s + (1 − n)/2) for v | ∞ (with rec_ℝ, rec_ℂ of
ML.0/archimedean-langlands-conventions). Hence Λ(R_π, s) inherits the meromorphic continuation
and functional equation of Λ(π, s) (Godement–Jacquet).

*Hypotheses.*
- π regular algebraic cuspidal; R_π its compatible system with local–global compatibility at v
  ∉ S.
- The unramified identity uses ιWD(r_λ|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|^{(1−n)/2}) (BLGGT
  normalisation, ML.0).

*Construction and proof.*
- Local–global compatibility at unramified places gives equality of Euler factors (Satake
  parameters vs Frobenius eigenvalues, with the shift (1 − n)/2).
- At infinite places, the Hodge–Tate weights of R_π are the archimedean weights of π (ACC+
  §2.3), which determines rec_K(π_v) up to the sign data matched at real places.
- Godement–Jacquet gives continuation and functional equation for Λ(π, s)
  (AutomorphicLFunctionsAndLocalFactors AL.2).

*Acceptance.*
- For n = 2 and π attached to an elliptic curve E/ℚ: L(R_π, s) = L(E, s) and Λ(E, s) =
  N^{s/2}Γ_ℂ(s)L(E, s) satisfies Λ(E, s) = ±Λ(E, 2 − s).

*Depends on:* `ML.0/compatible-system-archimedean-factors`,
`ML.0/blggt-normalization-register`, `AutomorphicGaloisRepresentationsPartII:AG2.2`,
`AutomorphicLFunctionsAndLocalFactors:AL.2`.

*Source.*
- acc-2023, §7.1, paragraph after the proof of Lemma 7.1.10 (before Theorem 7.1.11), arXiv v2
  p. 200 (Annals p. 1095) — ACC+ §7.1 compares
  L(R_π, s) with L(π, s).

#### `ML.0/nt26-normalisation-bridge` — Newton–Thorne's normalisations against BLGGT's and the atlas's Galois conventions

*Kind:* comparison.
*Declaration:* `TauCeti.LanglandsRegister.ntBridge` in `TauCeti/NumberTheory/LanglandsRegister`.

Newton–Thorne (2026, §1.2) normalise local class field theory so that uniformisers go to
geometric Frobenius elements, use the cyclotomic character ε with Hodge–Tate weight −1 (the
convention of ML.0/blggt-normalization-register), and attach to regular algebraic cuspidal π
the representation r_ι(π) with WD(r_ι(π)|_{G_{F_v}})^{F-ss} ≅ rec^T_{F_v}(ι^{−1}π_v) =
rec_{F_v}(ι^{−1}π_v ⊗ |det|^{(1−n)/2}) at v ∤ p. These agree with BLGGT's; the atlas's
arithmetic-Frobenius convention (IntegralHeckeAndGaloisDeterminants IHG.3,
AutomorphicGaloisRepresentations R19) is related by ρ ↦ ρ^∨, and Hodge–Tate weights change sign
under that dictionary.

*Hypotheses.*
- Registry node; every ML.3 statement taken from Newton–Thorne is read in these conventions.

*Construction and proof.*
- Read §1.2 of Newton–Thorne 2026 and compare with BLGGT §1.1–§2.1
  (ML.0/blggt-normalization-register).
- Under r ↦ r^∨ the geometric-Frobenius local–global compatibility becomes the arithmetic one,
  and HT_τ(r^∨) = −HT_τ(r).

*Acceptance.*
- Test on GL₁: r_ι(|·|^{−1}) is the p-adic cyclotomic character in both conventions after the
  dual is taken.

*Depends on:* `ML.0/blggt-normalization-register`,
`AutomorphicGaloisRepresentationsPartII:AG2.0`.

*Source.*
- nt-2026, §1.2 Notation, p. 8 (arXiv v2) (geometric-Frobenius Art_K, rec^T, r_{π,ι}, HT
  convention); Frob_v convention p. 7 — Newton–Thorne §1.2 conventions.

#### `ML.0/regular-weight-serre-implies-abelian-surface-modularity` — A regular-weight Serre conjecture for GSp₄ implies modularity of abelian surfaces over ℚ (BCGP 2025, Lemma 10.4.1)

*Kind:* theorem.
*Declaration:* `TauCeti.LanglandsRegister.abelianSurface_modular_of_serre` in `TauCeti/NumberTheory/LanglandsRegister`.

Suppose that for every prime p and every ρ̄ : G_ℚ → GSp₄(F̄_p) with multiplier ε̄^{−1},
absolutely irreducible, and with (ρ̄|_{G_{ℚ_p}})^{ss} a direct sum of characters, there is an
ordinary cuspidal automorphic representation π of GSp₄/ℚ of regular weight, level prime to p
and central character |·|² with ρ̄_{π,p} ≅ ρ̄. Then every abelian surface A/ℚ is modular.
(Remark 10.4.2: the hypothesis may be weakened, e.g. to p sufficiently large.) This is a
conditional endpoint: its hypothesis is a conjecture.

*Hypotheses.*
- Hypothesis: the regular-weight Serre statement above (status conjectural); the proof also
  uses Arthur's classification through BCGP's main theorems (ML.0/arthur-dependency-gate).

*Construction and proof.*
- Choose p with ρ̄_{A,p} absolutely irreducible and ordinary-type at p; the hypothesis gives an
  ordinary regular-weight π.
- Move from regular weight to parallel weight 2 by BCGP's Hida-theoretic and modularity lifting
  theorems, giving modularity of A (the analogue of Khare's deduction of Artin's conjecture
  from Serre's).

*Acceptance.*
- The analogy: ML.1/odd-artin-modularity-over-q follows from Serre's conjecture.

*Depends on:* `ML.0/gsp4-galois-l-packet`, `ML.0/arthur-dependency-gate`,
`ML.0/endpoint-status-register`.

*Source.*
- bcgp-2025, Lemma 10.4.1, §10.4, p. 222 (arXiv v1) — BCGP 2025 Lemma 10.4.1.
- bcgp-2025, Remark 10.4.2, p. 222 (arXiv v1) — BCGP 2025 Remark 10.4.2.

**Remaining refinements.**
- Conductors are registered only through the completed L-functions
  (ML.0/compatible-system-archimedean-factors, ML.3/completed-symmetric-power-l-function); a
  separate node for Artin and Weil–Deligne conductors of symmetric powers
  (Dummigan–Martin–Watkins) is a refinement.
- The input FoundationsAndLibraryIntegration:LI.4 is retired; its registry role is taken by
  ML.0/endpoint-status-register.

## Layer ML.1: Weight one and broader modularity (`TauCeti/NumberTheory/WeightOne/…`)

ML.1 is narrowed by RT-AREA-langlands-2/8 and the accepted restructuring RS-21. Over ℚ it
imports the Deligne–Serre representation (AutomorphicGaloisRepresentations R19.1),
Langlands–Tunnell (GL2AutomorphicRepresentationsAndTransfer R17.5) and Khare–Wintenberger's
Corollary 10.2(ii) with Khare's weight-one descent (ClassicalSerreModularity R27.6), and owns
Khare–Wintenberger's Theorem 10.1(ii) and the predicate of Langlands' conjecture for Artin
representations. Beyond ℚ it registers the totally real odd Artin conjecture and the mod 5
non-solvable case used by Boxer–Calegari–Gee–Pilloni, Calegari–Geraghty's Lemma 4.14, and
Caraiani–Newton's modularity of elliptic curves over imaginary quadratic fields. No weight-one
representation is derived from a weight-two Jacobian, and no statement covers all elliptic
curves over arbitrary number fields unconditionally.

*Coverage.* Narrowed per RT-AREA-langlands-2/8 and RS-21: Deligne–Serre (R19.1),
Langlands–Tunnell (R17.5), the strong Serre conjecture, Khare's descent and KW Corollary
10.2(ii) (R27.6) are imported; ML.1 owns KW Theorem 10.1(ii), the strong Artin predicate, the
totally real odd Artin and mod 5 cases of BCGP Proposition 10.1.3, Calegari–Geraghty Lemma 4.14
with the Buzzard–Taylor remark, Caraiani–Newton's imaginary quadratic modularity, and the scope
register.

### Objects

#### `ML.1/strong-artin-conjecture` — Langlands' conjecture for Artin representations (the strong Artin conjecture) ★

*Kind:* definition. *Planet:* Strong Artin conjecture.
*Declaration:* `TauCeti.WeightOne.IsAutomorphicArtin` in `TauCeti/NumberTheory/WeightOne`.

Let K be a number field and ρ : G_K → GL_n(ℂ) a continuous irreducible representation (an Artin
representation; it has finite image). ρ is automorphic (satisfies Langlands' conjecture) if
there is a cuspidal automorphic representation π of GL_n(𝔸_K) with rec(π_v) ≅ ρ|_{W_{K_v}} for
almost all places v, equivalently (by strong multiplicity one and Chebotarev) L(ρ, s) = L(π, s)
up to finitely many Euler factors. Since L(π, s) is entire for n ≥ 2 or π non-trivial
(Godement–Jacquet), an automorphic non-trivial ρ satisfies Artin's conjecture that L(ρ, s) is
entire.

*Hypotheses.*
- K a number field; ρ continuous, irreducible, n-dimensional over ℂ.

*Construction and proof.*
- Definition of the predicate; the implication to Artin's conjecture is Godement–Jacquet
  (AutomorphicLFunctionsAndLocalFactors AL.2).
- Independence of the finite set of places: strong multiplicity one (AL.3).

*Uses.*
- Khare–Wintenberger 2009, §10.2: Corollary 10.2(ii) proves it for odd two-dimensional ρ over ℚ
- ModularityAndLanglandsExtensions:ML.5/global-langlands-reciprocity-conjecture: its general
  form is reciprocity for finite image
- Boxer–Calegari–Gee–Pilloni 2021, proof of Proposition 10.1.3: the odd Artin conjecture over
  totally real fields

| API | role | statement |
|---|---|---|
| `TauCeti.WeightOne.IsAutomorphicArtin` | data | ρ has a cuspidal π with rec(π_v) ≅ ρ|_{W_{K_v}} for almost all v. |
| `TauCeti.WeightOne.IsAutomorphicArtin.lFunction_entire` | relation | IsAutomorphicArtin ρ and ρ non-trivial ⇒ L(ρ, s) extends to an entire function. |
| `TauCeti.WeightOne.IsAutomorphicArtin.of_iso` | extensionality | Invariant under isomorphism of ρ. |
| `TauCeti.WeightOne.IsAutomorphicArtin.twist` | compatibility | IsAutomorphicArtin ρ ⇒ IsAutomorphicArtin (ρ ⊗ χ) for a finite-order character χ. |
| `TauCeti.WeightOne.IsAutomorphicArtin.dim_one` | example | Every one-dimensional ρ is automorphic (class field theory). |
| `TauCeti.WeightOne.IsAutomorphicArtin.unique` | extensionality | The cuspidal π is unique (strong multiplicity one). |

*Unit tests.*
- `TauCeti.WeightOne.artin_character` (degenerate): n = 1: ρ = χ ∘ Art_K^{−1} is automorphic
  with π = χ.
- `TauCeti.WeightOne.artin_dihedral` (computation): ρ = Ind_{G_L}^{G_ℚ} χ for L imaginary
  quadratic and χ ≠ χ^c is automorphic, with π the automorphic induction of χ (weight-one theta
  series).
- `TauCeti.WeightOne.artin_reducible_not` (non-example): ρ = 1 ⊕ 1 is not irreducible: the
  matching representation 1 ⊞ 1 is isobaric, not cuspidal, and L(ρ, s) = ζ(s)² has a pole.
- `TauCeti.WeightOne.artin_compat_deligneSerre` (compatibility): For f a weight-one newform,
  the Deligne–Serre representation ρ_f (AutomorphicGaloisRepresentations R19.1) is automorphic
  with π = π_f.

*Acceptance.*
- n = 1 is class field theory; the proved two-dimensional cases are
  ML.1/odd-artin-modularity-over-q and ML.1/totally-real-odd-artin.

*Depends on:* `AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`,
`AnalyticNumberTheory:AN.4`,
`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`,
`ML.0/endpoint-status-register`.

*Source.*
- kw-2009-I, §10.2, p. 20 (author copy results.pdf) — Khare–Wintenberger §10.2: Langlands' stronger conjecture that ρ arises
  from a cuspidal automorphic π.
- kw-2009-I, §10.2, p. 20 (author copy results.pdf) — Khare–Wintenberger §10.2:
  Artin's conjecture.

### Theorems, comparisons and registers

#### `ML.1/irregular-systems-weight-one` — Irregular odd compatible systems arise from weight-one newforms (Khare–Wintenberger, Theorem 10.1(ii)) ★

*Kind:* theorem. *Planet:* Irregular compatible systems come from weight one.
*Declaration:* `TauCeti.WeightOne.weightOne_of_irregular` in `TauCeti/NumberTheory/WeightOne`.

Let (ρ_ι) be a two-dimensional compatible system of representations of G_ℚ (E-rational,
continuous, semisimple, finitely ramified ρ_ι : G_ℚ → GL₂(Q̄_ℓ) for every ℓ and ι : E ↪ Q̄_ℓ,
with Weil–Deligne compatibility at q ∤ ℓ and crystalline at q | ℓ with Hodge–Tate weights (a,
b) for ℓ ≫ 0) which is irregular (a = b), irreducible and odd. Then, up to twist, (ρ_ι) arises
from a newform of weight one; in particular, after twisting to Hodge–Tate weights (0, 0), every
ρ_ι has finite image.

*Hypotheses.*
- The compatible system in Khare–Wintenberger's sense (§5): weakly compatible, crystalline only
  for ℓ ≫ 0.

*Construction and proof.*
- Twist so that the weights are (0, 0); Sen–Fontaine: ρ_ι is unramified at ℓ for almost all ℓ.
- Residual irreducibility of ρ̄_λ for almost all λ (PotentialModularityAndCompatibleSystems
  R24.6).
- Strong form of Serre's conjecture (ClassicalSerreModularity R27.6) with Gross's tameness
  criterion and Coleman–Voloch (SerreWeightAndLevelOptimisation R20.3): for almost all λ, ρ̄_λ
  arises from S₁(Γ₁(N)) with N independent of λ.
- Khare's weight-one descent (owner ClassicalSerreModularity
  R27.6/weight-one-descent-from-infinitely-many-primes: since S₁(Γ₁(N)) has finitely many
  newforms, one f has ρ̄_λ ≅ ρ̄_{f,λ} for infinitely many λ, hence ρ_ι ≅ ρ_{f,ι}).
  Khare–Wintenberger only sketch this step, citing Khare's IMRN 1997 note, which was not
  available.

*Acceptance.*
- The converse: newforms of weight one give irregular irreducible odd compatible systems
  (Deligne–Serre).

*Depends on:* `ClassicalSerreModularity:R27.6/weight-one-descent-from-infinitely-many-primes`,
`ClassicalSerreModularity:R27.6/unramified-residual-representations-arise-in-weight-one`,
`ClassicalSerreModularity:R27.6/full-classical-serre-theorem`,
`PotentialModularityAndCompatibleSystems:R24.6/residual-members`,
`PadicHodgeTheory:R06.2/dcris-of-tate-twists-and-unramified`,
`SerreWeightAndLevelOptimisation:R20.3/weight-one-forms-unramified-at-p`,
`AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`.

*Source.*
- kw-2009-I, Theorem 10.1(ii), §10.1, p. 20 (author copy results.pdf) — Khare–Wintenberger Theorem 10.1(ii).
- kw-2009-I, Proof of Theorem 10.1(ii), p. 20 (author copy results.pdf) — Khare–Wintenberger: Serre's conjecture with
  Gross and Coleman–Voloch gives weight one at bounded level, arguing as in Khare's note.
- kw-2009-I, §5, p. 8 (author copy results.pdf) —
  Khare–Wintenberger §5: weights, regular and irregular systems.

#### `ML.1/odd-artin-modularity-over-q` — Registered: odd two-dimensional Artin representations of G_ℚ are modular (Langlands–Tunnell; Khare–Wintenberger Corollary 10.2(ii))

*Kind:* comparison.
*Declaration:* `TauCeti.WeightOne.oddArtin_modular_Q` in `TauCeti/NumberTheory/WeightOne`.

Every continuous odd irreducible ρ : G_ℚ → GL₂(ℂ) arises from a newform of weight one, hence satisfies Langlands' conjecture (ML.1/strong-artin-conjecture) and Artin's conjecture. The soluble cases (projective image dihedral, A₄, S₄) are Langlands–Tunnell (owner GL2AutomorphicRepresentationsAndTransfer R17.5, RS-21); the new case, projective image A₅, is Khare–Wintenberger Corollary 10.2(ii), proved and exported by ClassicalSerreModularity R27.6/odd-artin-weight-one-modularity. This node registers the two owners and the consequence for the strong Artin conjecture; it does not reprove either, and it does not derive weight-one representations from weight-two Jacobians.

*Hypotheses.*
- ρ odd (det ρ(c) = −1), irreducible, over ℚ only. Even two-dimensional ρ (Maass forms) are not
  covered.

*Construction and proof.*
- Soluble image: GL2AutomorphicRepresentationsAndTransfer R17.5/solvable-artin.
- Non-soluble image: ClassicalSerreModularity R27.6/odd-artin-weight-one-modularity, which
  applies Theorem 10.1(ii) to the compatible system ι ∘ ρ.
- Strong Artin: the weight-one newform f gives π_f with rec(π_{f,v}) ≅ ρ|_{W_v}.

*Acceptance.*
- The acceptance criterion of ML.1: weight-one modularity over ℚ is imported from its owners;
  weight-one representations are never obtained from a weight-two Jacobian.

*Depends on:* `ML.1/strong-artin-conjecture`, `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`,
`GL2AutomorphicRepresentationsAndTransfer:R17.5/solvable-artin`,
`ClassicalSerreModularity:R27.6/odd-artin-weight-one-modularity`,
`ML.0/endpoint-status-register`.

*Source.*
- kw-2009-I, Corollary 10.2(ii), §10.2, p. 21 (author copy results.pdf) —
  Khare–Wintenberger Corollary 10.2(ii).
- kw-2009-I, §10.2, p. 21 (author copy results.pdf) — Khare–Wintenberger: the new cases have projective image A₅.
- cg-2020, Appendix §A.2 'Relation with special values of periods', publ. p. 883 (copy p. 83);
  appendix arXiv:1907.08694v1 §2 (not downloaded) — Calegari–Geraghty §A.2: the Artin conjecture, known in this case.

#### `ML.1/totally-real-odd-artin` — The odd Artin conjecture over totally real fields (Pilloni–Stroh), as used for A₅ images

*Kind:* theorem.
*Declaration:* `TauCeti.WeightOne.oddArtin_totallyReal` in `TauCeti/NumberTheory/WeightOne`.

Let E be a totally real field and ϱ : G_E → GL₂(ℂ) a continuous irreducible totally odd
representation (det ϱ(c) = −1 for every complex conjugation c), in particular one with
projective image A₅. Then ϱ is automorphic: it arises from a Hilbert modular eigenform of
parallel weight one (Pilloni–Stroh, Theorem 0.3), so ϱ satisfies Langlands' and Artin's
conjectures. Boxer–Calegari–Gee–Pilloni apply it to a characteristic-zero totally odd lift with
finite image (Tate) of a mod 3 representation ϱ̄₃ : G_E → GL₂(F₉) with projective image A₅
(printed G_F: recorded as a source issue).

*Hypotheses.*
- E totally real; ϱ totally odd irreducible with finite image. The precise hypotheses of
  Pilloni–Stroh Theorem 0.3 were read only as quoted by BCGP (recorded as a gap).

*Construction and proof.*
- Pilloni–Stroh (Astérisque 382): companion forms and analytic continuation of overconvergent
  Hilbert modular forms of parallel weight one (after Buzzard–Taylor, Kassaei, Sasaki), with
  modularity lifting for the residual representations.
- Tate: a projective representation with finite image lifts to a representation with finite
  image; oddness is preserved.

*Acceptance.*
- The non-solvable vast case of BCGP Proposition 10.1.3 for p = 3.

*Depends on:* `ML.1/strong-artin-conjecture`, `AutomorphicGaloisRepresentations:R19.2`,
`GL2AutomorphicRepresentationsAndTransfer:R17.5`.

*Source.*
- bcgp-2021, Proof of Proposition 10.1.3, §10.1, p. 266 (arXiv v3) — BCGP: the odd
  Artin conjecture for totally real fields ([PS16b, Thm. 0.3]).

#### `ML.1/non-solvable-residual-modularity` — Modularity of non-solvable mod 5 representations of totally real fields with cyclotomic determinant

*Kind:* theorem.
*Declaration:* `TauCeti.WeightOne.mod5_nonsolvable_modular` in `TauCeti/NumberTheory/WeightOne`.

Let E be a totally real field in which 5 is unramified and ϱ̄ : G_E → GL₂(F₅) a totally odd
representation with det ϱ̄ = ε̄^{−1} and non-solvable (hence surjective onto GL₂(F₅)-image)
projective image. Then ϱ̄ is modular: it is realised as the 5-torsion of a modular elliptic
curve over a solvable totally real extension (Shepherd-Barron–Taylor, Taylor), and
characteristic-zero lifts of any prescribed potentially Barsotti–Tate (e.g. ordinary weight 2)
type exist by the method of Khare–Wintenberger (Snowden, Theorem 7.2.1) and are modular by
Kisin's modularity lifting theorem.

*Hypotheses.*
- E totally real, 5 unramified in E (so [E(ζ₅) : E] = 4 and the projective image is not A₅);
  det ϱ̄ = ε̄^{−1}.

*Construction and proof.*
- Residual modularity: SBT/Taylor's moduli of elliptic curves with ϱ̄ ≅ E[5] and Moret-Bailly
  over a solvable extension, then solvable descent of modularity (BCGP cite Pilloni–Stroh
  Proposition 2.1.3).
- Lifts: Snowden Theorem 7.2.1; modularity of lifts: Kisin's theorem (GL2ModularityLifting).

*Acceptance.*
- The p = 5 case of BCGP Proposition 10.1.3.

*Depends on:* `PotentialModularityAndCompatibleSystems:R23.1`,
`AutomorphicGaloisRepresentations:R19.2`, `GL2ModularityLifting:R22.1`.

*Source.*
- bcgp-2021, Proof of Proposition 10.1.3, p. 266 (arXiv v3) — BCGP: Khare–Wintenberger's method gives the lifts ([Sno09, Thm
  7.2.1]).
- bcgp-2021, Proof of Proposition 10.1.3, p. 266 (arXiv v3) — BCGP: realising ϱ̄ as the 5-torsion of a modular
  elliptic curve over a solvable extension.

#### `ML.1/buzzard-taylor-hypotheses` — Finitely many points with finite image make R[1/p] reduced (Calegari–Geraghty Lemma 4.14 and the Buzzard–Taylor remark)

*Kind:* theorem.
*Declaration:* `TauCeti.WeightOne.reduced_of_finitePoints` in `TauCeti/NumberTheory/WeightOne`.

Let F be a number field, k a finite field of characteristic p, S a finite set of places not
containing any v | p, and ρ̄ : G_{F,S} → GL₂(k) continuous and absolutely irreducible with
universal deformation ring R. If the Galois representation of every Q̄_p-point of R has finite
image and R has only finitely many Q̄_p-points, then R[1/p] is reduced. For F = ℚ and ρ̄
modular these hypotheses can often be deduced from Buzzard–Taylor and Buzzard (companion forms
and analytic continuation of overconvergent weight-one forms), which is how Calegari–Geraghty's
weight-one modularity results connect to the classical ones.

*Hypotheses.*
- Unramified-at-p deformation problem (S contains no place above p); ρ̄ absolutely irreducible.

*Construction and proof.*
- Calegari–Geraghty's proof: the points of R[1/p] with finite image are unobstructed (H¹ of a
  finite-image representation in characteristic 0 is computed by inflation–restriction), so
  R[1/p] is étale at them.
- The remark: Buzzard–Taylor show that unramified-at-p lifts of modular ρ̄ come from weight-one
  forms, which have finite image and are finite in number.

*Acceptance.*
- The remark only says 'often'; the hypotheses are not claimed in general.

*Depends on:* `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`,
`GlobalGaloisDeformations:R04.1`.

*Source.*
- cg-2018, Lemma 4.14, §4.2, p. 52 (arXiv v2) = Invent. pp. 366–367; proof pp. 52–53 = Invent.
  pp. 367–368 — Calegari–Geraghty Lemma 4.14.
- cg-2018, §4.2, remark after the proof of Lemma 4.14, p. 53 (arXiv v2) = Invent. p. 368 — The
  remark after Lemma 4.14.

#### `ML.1/imaginary-quadratic-elliptic-modularity` — Modularity of elliptic curves over imaginary quadratic fields with X₀(15)(F) finite (Caraiani–Newton) ★

*Kind:* theorem. *Planet:* Modularity over imaginary quadratic fields.
*Declaration:* `TauCeti.WeightOne.ellipticCurve_modular_imagQuadratic` in `TauCeti/NumberTheory/WeightOne`.

Let F be an imaginary quadratic field such that the Mordell–Weil group X₀(15)(F) is finite (for
example F = ℚ(√−d), d = 1, 2, 3, 5). Then every elliptic curve E/F is modular: there is a
cuspidal automorphic representation of GL₂(𝔸_F) of parallel weight 2 (or, when E has CM by a
field embedding in F, an isobaric sum ψ ⊞ ψ^c of Hecke characters of F) whose L-function is
L(E, s). More generally, if F is an imaginary CM field, Galois over ℚ with ζ₅ ∉ F, then 100% of
Weierstrass equations over F, ordered by height, define modular elliptic curves.

*Hypotheses.*
- F imaginary quadratic with X₀(15)(F) finite (Theorem 1.1); F imaginary CM Galois over ℚ with
  ζ₅ ∉ F (Theorem 1.2).

*Construction and proof.*
- Caraiani–Newton Theorem 1.3: an ordinary/Fontaine–Laffaille-type automorphy lifting theorem
  over CM fields with residual image conditions (requested from
  PotentialAutomorphyInfrastructure PA.4, RT-AREA-langlands-1/7).
- Residual modularity of E[3] or E[5] (Allen–Khare–Thorne) and the 3–5 switch; analysis of the
  F-points of X₀(15) and related modular curves for the exceptional residual images.
- These proofs are recorded as a gap: their lifting theorem and the modular-curve analysis are
  not planned here.

*Acceptance.*
- Over imaginary quadratic fields this is the first unconditional modularity theorem; potential
  modularity over CM fields is ML.3/acc-elliptic-symmetric-powers and ML.2.

*Depends on:* `PotentialAutomorphyInfrastructure:PA.4`,
`PotentialModularityAndCompatibleSystems:R23.1`, `ML.0/endpoint-status-register`.

*Source.*
- caraiani-newton-2023, §1, Theorem 1.1 (Corollary 7.1.2), p. 2 (arXiv:2301.10509v3) — Theorem 1.1.
- caraiani-newton-2023, §1, Theorem 1.2 (Corollary 6.1.2), p. 3 (arXiv:2301.10509v3) — Theorem 1.2 (F imaginary CM, Galois over ℚ, ζ₅ ∉ F).

#### `ML.1/weight-one-separation-register` — Register separating weight-one and totally real/CM modularity from the weight ≥ 2 GL₂/ℚ endpoints

*Kind:* comparison.
*Declaration:* `TauCeti.WeightOne.scopeRegister` in `TauCeti/NumberTheory/WeightOne`.

Registers the modularity endpoints of ML.1 with their scope: weight one over ℚ
(ML.1/odd-artin-modularity-over-q, ML.1/irregular-systems-weight-one), weight one over totally
real fields (ML.1/totally-real-odd-artin, ML.1/non-solvable-residual-modularity), and elliptic
curves over imaginary quadratic and CM fields (ML.1/imaginary-quadratic-elliptic-modularity);
and separates them from the weight-at-least-two GL₂/ℚ endpoints owned by
ClassicalSerreModularity and EllipticCurveModularity. Weight-one representations are never
derived from weight-two Jacobians, and no statement claims that all elliptic curves over
arbitrary number fields are modular: over general F only potential modularity (ML.2) and
Calegari–Geraghty's conditional statement (ML.2/cg18-conditional-potential-modularity) are
registered.

*Hypotheses.*
- Registry node.

*Construction and proof.*
- Each registered endpoint carries its field, weight and hypotheses in its own node.

*Acceptance.*
- The acceptance criterion of ML.1.

*Depends on:* `ML.1/odd-artin-modularity-over-q`, `ML.1/totally-real-odd-artin`,
`ML.1/imaginary-quadratic-elliptic-modularity`, `ML.0/endpoint-status-register`.

*Source.*
- kw-2009-I, §10.1, paragraph after Theorem 10.1, p. 20 (author copy results.pdf) — Khare–Wintenberger: weight ≥ 2 (resp.
  weight 1) newforms give regular (resp. irregular) systems.

**Remaining refinements.**
- Read Pilloni–Stroh (Astérisque 382) Theorem 0.3 and Khare's IMRN 1997 note directly; both are
  used as quoted by BCGP and Khare–Wintenberger.

## Layer ML.2: Potential automorphy assembly (`TauCeti/NumberTheory/PotentialAutomorphy/…`)

ML.2 assembles potential automorphy on top of PotentialAutomorphyInfrastructurePartII, which
owns the polarized definitions (ι-ordinary, the connects relation, potential diagonalizability,
polarized automorphy) and the minimal, ordinary and potentially diagonalizable lifting theorems
(BLGGT Theorems 2.3.1, 2.4.1, 3.1.2, 4.2.1 and Propositions 3.2.1, 4.1.1): the seventeen
earlier ML.2/ML.3 nodes that duplicated them are retired in favour of those owners. ML.2 keeps
BLGGT's Moret-Bailly step, change of weight and level, the potential automorphy theorem and the
compatible-system consequences, and adds the CM-field results: Qian's residual potential
automorphy for GL_n, ACC+ §7.2, Fakhruddin–Khare–Patrikis §9, Patrikis–Taylor (via
Fresán–Sabbah–Yu), BCGNT's p–r switch, and Calegari–Geraghty's conditional potential modularity
of all elliptic curves. The output is always automorphy over the specified extension; descent
is a separate statement.

*Coverage.* Checkpoint 3: 17 BLGGT nodes duplicated PotentialAutomorphyInfrastructurePartII
(PL.0–PL.7), AG2.0 and G7 and are retired in favour of those owners (the PL packet's rescope
proposal). Added: Qian's Theorems 1.1, 1.4 and the steps of §4; ACC+ Proposition 7.2.3 and
Assumption 7.2.6; FKP §9; Patrikis–Taylor (via Fresán–Sabbah–Yu); Calegari–Geraghty's
conditional Theorem 1.1(1) with §10; the twisted modular curve; BCGNT's p–r switch and Theorem
6.2.4.

### Objects

#### `ML.2/twisted-modular-curve` — The twisted modular curve X_E(q)

*Kind:* construction.
*Declaration:* `TauCeti.PotentialAutomorphy.TwistedModularCurve` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let K be a number field, E/K an elliptic curve and q a prime with E[q] irreducible. X_E(q) is
the smooth projective curve over K (the compactification of the fine moduli space Y_E(q) for q
≥ 3) parametrising pairs (A, φ) of an elliptic curve A with a symplectic isomorphism φ : A[q] ≅
E[q] (compatible with the Weil pairings); it is a twist of the modular curve X(q) by the Galois
action on E[q], geometrically connected, and of genus 0 for q ≤ 5. Calegari–Geraghty only say
that the auxiliary curve 'follows easily from Prop. 6.2 of [BLGHT11], now applied to twists of
a modular curve'.

*Hypotheses.*
- q ≥ 3 prime (fine moduli); K a number field.

*Construction and proof.*
- Construct as the quotient of X(q) ×_{ℚ} K twisted by the cocycle Gal(K̄/K) → Aut(E[q], Weil
  pairing) = SL₂(F_q)-torsor.
- Geometric connectedness: the determinant of φ is fixed by the Weil pairing, so the twist of
  X(q) remains connected over K (owner of X(q): Tau Ceti ModularCurves).

*Uses.*
- Calegari–Geraghty 2018, §10: the auxiliary elliptic curve in the general case
- ModularityAndLanglandsExtensions:ML.2/cg18-odd-symmetric-powers: Moret-Bailly on X_E(q)

| API | role | statement |
|---|---|---|
| `TauCeti.PotentialAutomorphy.TwistedModularCurve` | data | The curve X_E(q) over K. |
| `TauCeti.PotentialAutomorphy.TwistedModularCurve.moduli` | characterisation | For L/K, the non-cuspidal L-points of X_E(q) are the pairs (A/L, φ : A[q] ≅ E[q] symplectic) up to isomorphism (q ≥ 3). |
| `TauCeti.PotentialAutomorphy.TwistedModularCurve.geometricallyConnected` | relation | X_E(q) is geometrically connected. |
| `TauCeti.PotentialAutomorphy.TwistedModularCurve.baseChange` | functoriality | X_E(q) ×_K L = X_{E_L}(q). |
| `TauCeti.PotentialAutomorphy.TwistedModularCurve.point_E` | constructor | (E, id) is a K-point. |

*Unit tests.*
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.genus_q3` (computation): q = 3: X_E(3) has
  genus 0 (X(3) does), and it has the K-point (E, id), so X_E(3) ≅ ℙ¹_K.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.trivial_twist` (degenerate): If the Galois
  action on E[q] is trivial (E[q] ⊂ E(K) and μ_q ⊂ K), X_E(q) ≅ X(q)_K.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.not_X0` (non-example): X_E(q) is not X₀(q)
  as a moduli problem: a point carries a full level-q structure identified with E[q], not a
  cyclic subgroup; as curves they differ for q ≥ 7 (genus of X(7) is 3, of X₀(7) is 0), while
  for q = 3, 5 both are ℙ¹_K.

*Acceptance.*
- Moret-Bailly's theorem applied to X_E(q) gives points over extensions with prescribed local
  behaviour.

*Depends on:* `PotentialModularityAndCompatibleSystems:R23.1`,
`tauceti:TauCetiRoadmap/ModularCurves#layer-5-affine-fine-modular-curves-after-inverting-n`,
`tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering`.

*Source.*
- cg-2018, §10, general case, p. 97 (arXiv v2) = Invent. p. 429 —
  Calegari–Geraghty §10: twists of a modular curve.

### Theorems, comparisons and registers

#### `ML.2/moret-bailly-galois-control` — Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)

*Kind:* lemma.
*Declaration:* `TauCeti.PotentialAutomorphy.exists_point_galois_control` in `TauCeti/NumberTheory/PotentialAutomorphy/PotentialOrdinary`.

Let K^{(avoid)}/K/K₀ be number fields with K^{(avoid)}/K and K/K₀ Galois, S a finite set of
places of K₀, and for v ∈ S_K a finite Galois L′_v/K_v with L′_{σv} = σL′_v. Let T/K be smooth
and geometrically connected with non-empty Gal(L′_v/K_v)-invariant open Ω_v ⊆ T(L′_v). Then
there are a finite Galois L/K and P ∈ T(L) with L/K₀ Galois, L linearly disjoint from
K^{(avoid)} over K, and L_w ≅ L′_v with P ∈ Ω_v for w | v ∈ S_K.

*Hypotheses.*
- Places and extensions as stated.

*Construction and proof.*
- Enlarge S (Weil bounds and Hensel give K_v-points for almost all v) so that each simple
  Galois subextension of K^{(avoid)}/K is non-split at some v ∈ S_K with L′_v = K_v; this gives
  linear disjointness.
- Reduce to L′_v = K_v by a soluble extension with prescribed completions (CHT Lemma 4.1.2) and
  its normal closure over K₀.
- Apply Moret-Bailly's Théorème 1.3 and take the normal closure over K₀.

*Acceptance.*
- Check the role of Ω_v: the point lies in the prescribed open at every place above S, which is
  what the Dwork-family argument needs at l_i, l′ and ∞.

*Depends on:*
`PotentialModularityAndCompatibleSystems:R23.1/moret-bailly-theorem-incomplete-skolem-data-have-integral-points`.

*Source.*
- blggt-2014-v4, §3.1, Proposition 3.1.1, p. 41 (arXiv v4) — Proposition 3.1.1 and its proof.

#### `ML.2/potential-ordinary-automorphy` — Potential ordinary automorphy of polarized mod l representations (Proposition 3.3.1)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.potential_ordinary_automorphy` in `TauCeti/NumberTheory/PotentialAutomorphy/PotentialOrdinary`.

Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: l_i odd with ζ_{l_i}
∉ F; µ_i totally odd de Rham (HT {w_i}); r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible with
(r̄_i, µ̄_i) totally odd polarized, r̄_i|_{G_{F(ζ_{l_i})}} irreducible and l_i ≥ 2(d_i + 1);
sets H_{i,τ} of n_i distinct integers with H_{i,τ∘c} = {w_i − h}; a finite Galois-stable S ⊇
primes above l_i and ramification; lifts ρ_{i,v} (v ∤ l_i) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}; and
F^{(avoid)}. Then there are F′/F finite CM, Galois over F₀ and linearly disjoint from
F^{(avoid)}, and regular algebraic cuspidal polarized (π_i, χ_i) over F′ with r̄_{l_i,ı_i}(π_i)
≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, π_i unramified above l_i and
outside S, ı_i-ordinary, HT_τ(r_{l_i,ı_i}(π_i)) = H_{i,τ|_F}, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}}
∼ ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S, u ∤ l_i.

*Hypotheses.*
- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı :
  Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1)
  ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
- For each i an isomorphism ı_i : Q̄_{l_i} ≅ ℂ is fixed (the conclusion is stated with it; the
  Lean prototype found it unintroduced).

*Construction and proof.*
- Combine dwork-potential-ordinary-automorphy (applied to a symplectic induction of r̄_i to the
  totally real subfield) with ordinary-lifts-with-local-conditions and
  ordinary-automorphy-lifting over the resulting extension.

*Acceptance.*
- Check that the output is ı-ordinary with prescribed Hodge–Tate numbers: the input needed by
  Theorem 4.5.1 to start the potentially diagonalizable lifting.

*Depends on:*
`PotentialAutomorphyInfrastructurePartII:PL.5/dwork-potential-ordinary-automorphy`,
`PotentialAutomorphyInfrastructurePartII:PL.5/ordinary-lifts-prescribed-local`,
`PotentialAutomorphyInfrastructurePartII:PL.4/ordinary-automorphy-lifting`,
`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`.

*Source.*
- blggt-2014-v4, §3.3, Proposition 3.3.1, pp. 47–48 (arXiv v4) — Proposition 3.3.1.

#### `ML.2/pd-lifts-with-local-conditions` — Lifts with potentially diagonalizable local conditions (Theorem 4.3.1)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.exists_pd_lift` in `TauCeti/NumberTheory/PotentialAutomorphy/Lifting`.

In the setting of §4.3 (F imaginary CM with ζ_l ∉ F, S split containing places above l, µ
algebraic unramified outside S with µ(c_v) = −1, r̄ : G_{F⁺} → G_n(F̄_l) unramified outside S
with ν ∘ r̄ = µ̄, lifts ρ_v of r̄̆|_{G_{F_ṽ}} for v ∈ S), assume r̄̆|_{G_{F(ζ_l)}} irreducible,
l ≥ 2(d + 1), and for v | l that ρ_v is potentially diagonalizable with n distinct τ-Hodge–Tate
numbers. Then r̄ has a lift r : G_{F⁺} → G_n(O_{Q̄_l}) with ν ∘ r = µ, r̆|_{G_{F_ṽ}} ∼ ρ_v for
v ∈ S, unramified outside S.

*Hypotheses.*
- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı :
  Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1)
  ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

*Construction and proof.*
- As in Theorem 4.2.1: the deformation ring with the components of the ρ_v has dimension ≥ 1;
  potential automorphy of r̄ (potential-ordinary-automorphy) and pd-automorphy-lifting over the
  extension make it finite over O; so it has Q̄_l-points.

*Acceptance.*
- Check that this strengthens ordinary-lifts-with-local-conditions: ordinary crystalline ρ_v
  are potentially diagonalizable.

*Depends on:* `PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`,
`ML.2/potential-ordinary-automorphy`,
`PotentialAutomorphyInfrastructurePartII:PL.1/connects-relation`,
`PotentialAutomorphyInfrastructurePartII:PL.1/potentially-diagonalizable`,
`GlobalGaloisDeformations:G7/polarized-representability`.

*Source.*
- blggt-2014-v4, §4.3, Theorem 4.3.1, p. 55 (arXiv v4) — The setting of §4.3 and Theorem 4.3.1.

#### `ML.2/change-of-weight-and-level` — Change of weight and level (Theorem 4.4.1) ★

*Kind:* theorem. *Planet:* Change of weight and level.
*Declaration:* `TauCeti.PotentialAutomorphy.change_of_weight_and_level` in `TauCeti/NumberTheory/PotentialAutomorphy/Lifting`.

Let F be imaginary CM, l > 2(n + 1) with ζ_l ∉ F and primes above l split over F⁺, S a finite
split set of finite places of F⁺ containing those above l, µ algebraic, and r̄ : G_F →
GL_n(F̄_l) with (r̄, µ̄) polarized, unramified outside S, ordinarily or potentially
diagonalizably automorphic, and r̄|_{G_{F(ζ_l)}} irreducible. For v ∈ S let ρ_v be a lift of
r̄|_{G_{F_ṽ}}, potentially diagonalizable with n distinct τ-Hodge–Tate numbers when v | l. Then
there is a regular algebraic cuspidal polarized (π, χ) with r̄_{l,ı}(π) ≅ r̄,
r_{l,ı}(χ)ε_l^{1−n} = µ, level potentially prime to l, unramified outside S, and ρ_v ∼
r_{l,ı}(π)|_{G_{F_ṽ}} for v ∈ S.

*Hypotheses.*
- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı :
  Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1)
  ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
- The statement is read with ρ_v a lift of r̄|_{G_{F_ṽ}}; see
  ModularityAndLanglandsExtensions/E3.

*Construction and proof.*
- pd-lifts-with-local-conditions gives a lift r with the local conditions ρ_v;
  pd-automorphy-lifting makes it automorphic; local–global compatibility
  (blggt-normalization-register (3)) gives ρ_v ∼ r_{l,ı}(π)|_{G_{F_ṽ}}.

*Acceptance.*
- Check the Serre-weight reading: r̄ is automorphic in every potentially diagonalizable weight
  and type it admits locally.

*Depends on:* `ML.2/pd-lifts-with-local-conditions`,
`PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`,
`ML.0/blggt-normalization-register`.

*Source.*
- blggt-2014-v4, §4.4, Theorem 4.4.1, pp. 58–59 (arXiv v4) — Theorem 4.4.1 and its proof.

#### `ML.2/potential-automorphy-theorem` — Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1) ★

*Kind:* theorem. *Planet:* Potential automorphy theorem (BLGGT).
*Declaration:* `TauCeti.PotentialAutomorphy.potential_automorphy` in `TauCeti/NumberTheory/PotentialAutomorphy/Potential`.

Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: n_i, d_i ≥ 1, l_i
odd with l_i ≥ 2(d_i + 1) and ζ_{l_i} ∉ F, ı_i; (r_i, µ_i) a totally odd, regular algebraic,
n_i-dimensional polarized l_i-adic representation of G_F with d_i the maximal dimension of an
irreducible constituent of r̄_i restricted to the subgroup generated by the Sylow
pro-l_i-subgroups; F^{(avoid)}/F finite Galois. Assume r_i is potentially diagonalizable at
each prime of F above l_i and r̄_i|_{G_{F(ζ_{l_i})}} is irreducible. Then there are a finite CM
F′/F, Galois over F₀ and linearly disjoint from F^{(avoid)} over F, and regular algebraic
cuspidal polarized (π_i, χ_i) of GL_{n_i}(𝔸_{F′}), unramified above l_i, with
(r_{l_i,ı_i}(π_i), r_{l_i,ı_i}(χ_i)ε_{l_i}^{1−n_i}) ≅ (r_i|_{G_{F′}}, µ_i|_{G_{(F′)⁺}}).

*Hypotheses.*
- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı :
  Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1)
  ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
- Read "each prime v of F above l_i" (the printed "of F⁺" is a misprint,
  ModularityAndLanglandsExtensions/E2).

*Construction and proof.*
- potential-ordinary-automorphy gives F′ (Galois over F₀, disjoint from ∩ ker r̄_i ·
  F^{(avoid)}(ζ_{∏l_i})) and ı_i-ordinary (π′_i, χ′_i) with r̄_{l_i,ı_i}(π′_i) ≅
  r̄_i|_{G_{F′}}, unramified above l_i.
- pd-automorphy-lifting over F′ (hypotheses preserved: potential diagonalizability restricts,
  and r̄_i|_{G_{F′(ζ_{l_i})}} stays irreducible by disjointness).

*Acceptance.*
- Check the Fontaine–Laffaille special case: l_i unramified in F⁺, r_i crystalline above l_i
  with HT in [a_τ, a_τ + l − 2] (potential-diagonalizability-criteria (2)).
- Check that the output is automorphy over F′ only: descent to F needs
  automorphy-twist-and-soluble-base-change and holds only for soluble F′/F.

*Depends on:* `ML.2/potential-ordinary-automorphy`,
`PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`,
`AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`,
`PotentialAutomorphyInfrastructurePartII:PL.1/potentially-diagonalizable`,
`PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation`.

*Source.*
- blggt-2014-v4, §4.5, Theorem 4.5.1 and proof, pp. 59–60 (arXiv v4) — Theorem 4.5.1 and its proof.

#### `ML.2/potential-automorphy-totally-real` — Potential automorphy over totally real fields (Corollary 4.5.2)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.potential_automorphy_totallyReal` in `TauCeti/NumberTheory/PotentialAutomorphy/Potential`.

Let F⁺ be totally real, l ≥ 2(n + 1), and (r, µ) a totally odd, regular algebraic,
n-dimensional polarized l-adic representation of G_{F⁺}, potentially diagonalizable at each
prime above l, with r̄|_{G_{F⁺(ζ_l)}} irreducible. Then there is a Galois totally real
F^{+,′}/F⁺ such that (r|_{G_{F^{+,′}}}, µ|_{G_{F^{+,′}}}) is automorphic of level prime to l.

*Hypotheses.*
- F⁺ totally real.

*Construction and proof.*
- Choose an imaginary quadratic F/F⁺ in which primes above l split, disjoint from (F̄⁺)^{ker ad
  r̄}(ζ_l); apply potential-automorphy-theorem to r|_{G_F}; descend from the CM field F′ to
  (F′)⁺ by automorphy-twist-and-soluble-base-change.

*Acceptance.*
- Check against KW/Taylor over ℚ: for n = 2 this recovers potential modularity of odd regular
  2-dimensional representations with PD local conditions.

*Depends on:* `ML.2/potential-automorphy-theorem`,
`PotentialAutomorphyInfrastructurePartII:PL.0/automorphy-under-twist`,
`PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

*Source.*
- blggt-2014-v4, §4.5, Corollary 4.5.2, p. 60 (arXiv v4) — Corollary 4.5.2 and its proof.

#### `ML.2/potential-automorphy-mod-l` — Potential automorphy of mod l representations with prescribed local lifts (Corollary 4.5.3)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.potential_automorphy_residual` in `TauCeti/NumberTheory/PotentialAutomorphy/Potential`.

In the situation of Theorem 4.5.1 but with r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible, (r̄_i,
µ_i) polarized (µ_i totally odd de Rham), r̄_i|_{G_{F(ζ_{l_i})}} irreducible, S a
Gal(F/F⁺)-stable finite set of primes containing those above l_i and the ramification, and
lifts ρ_{i,v} (v ∈ S) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}, potentially diagonalizable with n_i
distinct Hodge–Tate numbers when v | l_i: there are F′ (as in 4.5.1) and (π_i, χ_i) with
r̄_{l_i,ı_i}(π_i) ≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, level
potentially prime to l_i, unramified outside S, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼
ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S.

*Hypotheses.*
- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı :
  Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1)
  ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).
- Read ρ_{i,v}, n_i and ρ_{i,v}|_{G_{F′_u}} in (g) and (7) (misprints E2).

*Construction and proof.*
- Reduce to S split over F⁺ as in potential-ordinary-automorphy; pd-lifts-with-local-conditions
  gives lifts r_i with r_i|_{G_{F_v}} ∼ ρ_{i,v}; apply potential-automorphy-theorem.

*Acceptance.*
- Check that it strengthens Proposition 3.3.1: the local conditions may be any potentially
  diagonalizable types, not only ordinary.

*Depends on:* `ML.2/pd-lifts-with-local-conditions`, `ML.2/potential-automorphy-theorem`.

*Source.*
- blggt-2014-v4, §4.5, Corollary 4.5.3, pp. 60–61 (arXiv v4) — Corollary 4.5.3 and its proof.

#### `ML.2/compatible-systems-potentially-automorphic` — Potential automorphy of compatible systems (Theorem 5.4.1, Corollary 5.4.2) ★

*Kind:* theorem. *Planet:* Potential automorphy of compatible systems.
*Declaration:* `TauCeti.PotentialAutomorphy.potential_automorphy_compatibleSystem` in `TauCeti/NumberTheory/PotentialAutomorphy/CompatibleSystems`.

Let F/F₀ be finite Galois of CM (resp. totally real) fields and F^{(avoid)}/F finite Galois. If
(ℛ_i, ℳ_i), i = 1, …, r, are totally odd, polarized weakly compatible systems of l-adic
representations of G_F with each ℛ_i regular and irreducible, then there is a finite CM (resp.
totally real) F′/F, linearly disjoint from F^{(avoid)} and Galois over F₀, such that each
(ℛ_i|_{G_{F′}}, ℳ_i|_{G_{(F′)⁺}}) is automorphic. In particular (Corollary 5.4.2) a single such
system becomes automorphic over a finite Galois CM (resp. totally real) F′/F.

*Hypotheses.*
- (ℛ, ℳ) a polarized weakly compatible system of G_F over M
  (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1
  conventions.

*Construction and proof.*
- Totally real case from the CM case by automorphy-twist-and-soluble-base-change, choosing F′
  disjoint from the fields F_i¹ of Lemma 5.3.1 (rank-two-reducibility-independent-of-lambda) so
  that ℛ_i stays irreducible (Lemma A.2.1).
- Take M common; L = ∩_i(L_{i,1} ∩ L_{i,2}) of density 1, with L_{i,1} from
  residual-irreducibility-density-one and L_{i,2} the primes where ℛ_i is irreducible (Lemma
  A.1.7).
- Remove finitely many l: l ≥ 2(dim ℛ_i + 1), l unramified in F and not below the bad primes,
  Hodge–Tate numbers in some [a, a + l − 2].
- potential-diagonalizability-criteria (2) makes r_{i,λ} potentially diagonalizable; apply
  potential-automorphy-theorem to the r_{i,λ} for one λ | l ∈ L.

*Acceptance.*
- Check the density-one bookkeeping: the intersection of finitely many density-one sets has
  density one.
- Check the Fontaine–Laffaille step: for l large the Hodge–Tate range (fixed by the system) has
  length < l − 2.

*Depends on:* `ML.2/potential-automorphy-theorem`,
`PotentialAutomorphyInfrastructurePartII:PL.1/pd-criteria`,
`PotentialAutomorphyInfrastructurePartII:PL.0/automorphy-under-twist`,
`PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`,
`PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`,
`PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda`,
`PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n`,
`PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

*Source.*
- blggt-2014-v4, §5.4, Theorem 5.4.1, Corollary 5.4.2 and proof, p. 74 (arXiv v4) — Theorem 5.4.1 (v1 Theorem 5.3.1),
  Corollary 5.4.2 and the proof.

#### `ML.2/compatible-system-l-function-continuation` — Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3) ★

*Kind:* theorem. *Planet:* Meromorphic continuation of compatible-system L-functions.
*Declaration:* `TauCeti.PotentialAutomorphy.lFunction_meromorphic` in `TauCeti/NumberTheory/PotentialAutomorphy/CompatibleSystems`.

Under the hypotheses of Corollary 5.4.2: (1) for ı : M ↪ ℂ, L^S(ıℛ, s) converges uniformly
absolutely on compact subsets of a right half plane and continues meromorphically to ℂ; (2) ℛ
is strictly pure and Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s); (3) if F is totally real, n is odd and
v | ∞, then tr r_λ(c_v) = ±1 is independent of λ.

*Hypotheses.*
- (ℛ, ℳ) a polarized weakly compatible system of G_F over M
  (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1
  conventions.

*Construction and proof.*
- Strict purity: Theorem 5.4.1, Theorem 2.1.1 (purity of WD at v ∤ l for automorphic members)
  and Brauer's theorem as in the proof of part-of-compatible-system (the Grothendieck-ring
  argument of PM R24.5/galois-grothendieck-ring).
- Continuation and functional equation: over each soluble F′/F_i in a Brauer decomposition 1 =
  Σ n_i Ind ψ_i the system is automorphic, so L^S(ıℛ, s) = ∏ L^S(π_i ⊗ ψ_i, s)^{n_i} (HSBT10
  Theorem 4.2 argument), each factor entire with the standard functional equation (AL.2).
- (3): reduce to the automorphic case, Taylor 2012 (the Calegari observation); cited.

*Acceptance.*
- Check that the Γ- and ε-factors are those of PM R24.5/system-l-functions, so (2) is the
  functional equation that node could not claim.
- Check the example of an elliptic curve over a totally real field: L(E, s) continues and
  satisfies its functional equation (the system is regular, irreducible, polarized).

*Depends on:* `ML.2/compatible-systems-potentially-automorphic`,
`PotentialModularityAndCompatibleSystems:R24.5/system-l-functions`,
`PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring`,
`AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

*Source.*
- blggt-2014-v4, §5.4, Corollary 5.4.3 and proof, pp. 74–75 (arXiv v4) — Corollary 5.4.3 (v1 Corollary 5.3.2) and its proof.

#### `ML.2/multiple-product-l-functions` — Tensor products of non-CM modular forms (Corollary 5.4.4)

*Kind:* application.
*Declaration:* `TauCeti.PotentialAutomorphy.multipleProduct_meromorphic` in `TauCeti/NumberTheory/PotentialAutomorphy/CompatibleSystems`.

Let K ⊆ ℤ_{>0} be finite with the 2^{#K} partial sums of its elements distinct, and f_k (k ∈ K)
non-CM newforms of weight k + 1 with automorphic π_k. Then there are a totally real Galois F/ℚ
and a regular algebraic polarizable cuspidal Π on GL_{2^{#K}}(𝔸_F) with
rec(Π_v|det|^{(1−2^{#K})/2}) = (⊗_k rec(π_{k,v|ℚ}|det|^{−1/2}))|_{W_{F_v}} for almost all v; in
particular L(×_k π_k, s) continues meromorphically to ℂ.

*Hypotheses.*
- f_k non-CM; the partial-sum condition gives regularity of ⊗_k r_{k,λ}.

*Construction and proof.*
- Apply compatible-systems-potentially-automorphic to ⊗_K r_{k,λ}.
- Irreducibility (Goursat): the Zariski closure H̄ of (∏ r_{k,λ})(G_ℚ) in PGL_2^K surjects onto
  each factor; as PGL_2 is simple with only inner automorphisms, H̄ = PGL_2^I with K = ⊔ K_i
  mapping diagonally; #K_i > 1 would give r_{k,λ} ≅ r_{k′,λ} ⊗ χ with χ de Rham, contradicting
  Hodge–Tate numbers; so H ⊇ SL_2^K, whose tensor representation is irreducible.

*Acceptance.*
- Check the partial-sum condition on K = {1, 2, 4}: the 8 subset sums 0, …, 7 are distinct; on
  K = {1, 2, 3} they are not (1 + 2 = 3) (suggested file).

*Depends on:* `ML.2/compatible-systems-potentially-automorphic`,
`ML.2/compatible-system-l-function-continuation`,
`PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems`.

*Source.*
- blggt-2014-v4, §5.4, Corollary 5.4.4 and proof, pp. 75–76 (arXiv v4) — Corollary 5.4.4 (v1 Corollary 5.3.3) and its
  proof.

#### `ML.2/constituents-potentially-automorphic` — Constituents of polarized systems are potentially automorphic (Proposition 5.4.6)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.constituents_potentially_automorphic` in `TauCeti/NumberTheory/PotentialAutomorphy/CompatibleSystems`.

Let F be CM and (ℛ, ℳ) a totally odd, polarized weakly compatible system with ℛ pure and
extremely regular; write r_λ = r_{λ,1} ⊕ ⋯ ⊕ r_{λ,j_λ} into irreducibles. There is a set L of
rational primes of Dirichlet density 1 such that for λ | l ∈ L there is a finite CM Galois F′/F
with each (r_{λ,α}|_{G_{F′}}, µ_λ|_{G_{(F′)⁺}}) irreducible and automorphic.

*Hypotheses.*
- (ℛ, ℳ) a polarized weakly compatible system of G_F over M
  (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1
  conventions.

*Construction and proof.*
- Lemma 5.4.5 (PM R24.5/constituents-essentially-self-dual, v1 Lemma 5.2.3): each (r_{λ,α},
  µ_λ) is totally odd polarized.
- L from residual-irreducibility-density-one, minus finitely many l (l ≥ 2(dim ℛ + 1),
  unramified, Fontaine–Laffaille range); potential-diagonalizability-criteria (2);
  potential-automorphy-theorem with F^{(avoid)} the compositum of the F̄^{ker r̄_{λ,α}}.

*Acceptance.*
- Check that irreducibility over F′ comes from the choice of F^{(avoid)}: r̄_{λ,α}|_{G_{F′}}
  stays irreducible, hence so does r_{λ,α}|_{G_{F′}}.

*Depends on:* `ML.2/potential-automorphy-theorem`,
`PotentialAutomorphyInfrastructurePartII:PL.1/pd-criteria`,
`PotentialModularityAndCompatibleSystems:R24.5/constituents-essentially-self-dual`,
`PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`.

*Source.*
- blggt-2014-v4, §5.4, Lemma 5.4.5 and Proposition 5.4.6, pp. 76–77 (arXiv v4) — Lemma 5.4.5 and Proposition 5.4.6
  (v1 Lemma 5.2.3, Proposition 5.3.4).

#### `ML.2/part-of-compatible-system` — A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1) ★

*Kind:* theorem. *Planet:* Potentially diagonalizable reps lie in compatible systems.
*Declaration:* `TauCeti.PotentialAutomorphy.exists_compatibleSystem` in `TauCeti/NumberTheory/PotentialAutomorphy/CompatibleSystems`.

Let F be CM, l ≥ 2(n + 1) with ζ_l ∉ F, and (r, µ) an n-dimensional totally odd regular
algebraic polarized l-adic representation of G_F, potentially diagonalizable above l with
r̄|_{G_{F(ζ_l)}} irreducible. Then r is part of a strictly pure compatible system of l-adic
representations of G_F.

*Hypotheses.*
- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı :
  Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1)
  ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

*Construction and proof.*
- potential-automorphy-theorem gives F′/F Galois CM, disjoint from F⁰F̄^{ker r̄} (F⁰ cut out by
  the component group of the Zariski closure of r), and (π, χ) over F′ with r_{l,ı}(π) =
  r|_{G_{F′}}; soluble descent gives π(F″) for F′/F″ soluble.
- For each (l′, ı′), decompose r_{l′,ı′}(π) into irreducibles; the component groups are
  independent of l′ (Lemma 5.3.1), so the pieces descend to each F″.
- Brauer: 1 = Σ n_i Ind_{F′_i}ψ_i with F′/F′_i soluble; set A_{l′,ı′,α} = Σ n_i
  ind_{F′_i/F}([r_{l′,ı′}(π(F′_i))_α][ı′^{−1}ψ_i]) in Rep_{F,l′}; dim A = dim r_{l′,ı′}(π)_α
  and (A, A) = 1, so A = [r_{l′,ı′,α}] is a genuine irreducible representation (PM
  R24.5/galois-grothendieck-ring).
- r_{l′,ı′} = ⊕_α r_{l′,ı′,α} has r_{l,ı} ≅ r; its Weil–Deligne representations are pure
  (Theorem 2.1.1, Lemma 1.3.6) and have l′-independent traces, so the system is strictly pure
  and compatible.

*Acceptance.*
- Check the Grothendieck-ring step: (A, A) = 1 with dim A ≥ 0 is exactly the criterion recorded
  in PM R24.5/galois-grothendieck-ring (4).

*Depends on:* `ML.2/potential-automorphy-theorem`, `ML.2/potential-automorphy-totally-real`,
`PotentialAutomorphyInfrastructurePartII:PL.0/automorphy-under-twist`,
`PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`,
`PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring`,
`PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda`,
`AutomorphicGaloisRepresentationsPartII:AG2.2`.

*Source.*
- blggt-2014-v4, §5.5, Theorem 5.5.1 and proof, pp. 79–81 (arXiv v4) — Theorem 5.5.1 (v1 Theorem 5.4.1) and its Brauer-induction
  proof.

#### `ML.2/irreducibility-density-one` — Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.irreducible_density_one` in `TauCeti/NumberTheory/PotentialAutomorphy/CompatibleSystems`.

Let F be CM and π a regular algebraic, polarizable, cuspidal automorphic representation of
GL_n(𝔸_F) of extremely regular weight. Then there is a set L of rational primes of Dirichlet
density 1 such that r_{l,ı}(π) is irreducible for every l ∈ L and ı : Q̄_l ≅ ℂ.

*Hypotheses.*
- F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı :
  Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1)
  ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

*Construction and proof.*
- Apply constituents-potentially-automorphic to ℛ = {r_{l,ı}(π)}; for l ∈ L write r_{l,ı}(π) =
  ⊕_{α=1}^j r_{l,ı}(π)_α, each potentially automorphic.
- ord_{s=1}L^S(ı(ℛ ⊗ ℛ^∨), s) = ord_{s=1}L^S(π × π^∨, s) = −1 (Jacquet–Shalika, Shahidi;
  requested from AL.3).
- On the other hand, using the potential automorphy of the constituents and Brauer induction,
  the order is −j; hence j = 1.

*Acceptance.*
- Check the Rankin–Selberg input: L^S(π × π′^∨, s) has a simple pole at s = 1 exactly when π′
  is a twist of π, and is holomorphic nonvanishing there otherwise.

*Depends on:* `ML.2/constituents-potentially-automorphic`,
`AutomorphicLFunctionsAndLocalFactors:AL.3`,
`PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring`.

*Source.*
- blggt-2014-v4, §5.5, Theorem 5.5.2 and proof, pp. 81–82 (arXiv v4) — Theorem 5.5.2 (v1 Theorem 5.4.2) and the
  Rankin–Selberg facts it uses.

#### `ML.2/decomposition-into-irreducible-systems` — Splitting a polarized system into irreducible systems (Theorem 5.5.3)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.eq_sum_irreducible_systems` in `TauCeti/NumberTheory/PotentialAutomorphy/CompatibleSystems`.

Let F be CM and ℛ a pure, extremely regular, totally odd, polarizable weakly compatible system
of G_F. Then ℛ = ℛ_1 ⊕ ⋯ ⊕ ℛ_s with each ℛ_i an irreducible, strictly pure, totally odd,
polarizable compatible system.

*Hypotheses.*
- (ℛ, ℳ) a polarized weakly compatible system of G_F over M
  (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1
  conventions.

*Construction and proof.*
- Choose L of density 1 for residual-irreducibility-density-one and
  constituents-potentially-automorphic; pick λ | l ∈ L with l ≥ 2(n + 1), unramified,
  Fontaine–Laffaille Hodge–Tate range; decompose r_λ = ⊕ r_{λ,α}.
- part-of-compatible-system puts each r_{λ,α} in a strictly pure compatible system ℛ_α; over F′
  it is the system of an extremely regular π_α, so irreducibility-density-one makes ℛ_α
  irreducible on a density-one set.
- Compare Frobenius polynomials: ⊕ℛ_α and ℛ agree at r_λ, hence everywhere.

*Acceptance.*
- Check the degenerate case s = 1: an irreducible system is its own decomposition, with the
  added conclusion of strict purity.

*Depends on:* `ML.2/part-of-compatible-system`, `ML.2/irreducibility-density-one`,
`ML.2/constituents-potentially-automorphic`,
`PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`.

*Source.*
- blggt-2014-v4, §5.5, Theorem 5.5.3 and proof, p. 82 (arXiv v4) — Theorem 5.5.3 (v1 Theorem 5.4.3) and
  its proof.

#### `ML.2/qian-residual-potential-automorphy` — Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1) ★

*Kind:* theorem. *Planet:* Residual potential automorphy (Qian).
*Declaration:* `TauCeti.PotentialAutomorphy.qian_residual` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let F be a CM number field, F^av/F a finite extension, n ≥ 2, l a prime and r̄ : G_F →
GL_n(F_{l^s}) a continuous semisimple representation. Then there is a finite CM Galois
extension F′/F, linearly disjoint from F^av over F, such that r̄|_{G_{F′}} is ordinarily
automorphic: it has a lift r ≅ r_{l,ι}(π) with π regular algebraic cuspidal on GL_n(𝔸_{F′}) and
r|_{G_{F′_v}} potentially semistable and ordinary with regular Hodge–Tate weights for all v |
l. No polarization, oddness or residual image hypothesis is imposed.

*Hypotheses.*
- F CM; r̄ semisimple, of any dimension n ≥ 2 and any residual characteristic l.

*Construction and proof.*
- Choose the auxiliary data E, N, F^avoid and an ordinary auxiliary prime l′
  (ML.2/qian-auxiliary-prime).
- Automorphy of Sym^{n−1} of the elliptic curve at l′ over a totally real F^suff
  (ML.2/elliptic-symmetric-power-seed).
- Moret-Bailly gives a point t of the Dwork family over F′ with the l-adic fibre lifting r̄ ⊗
  (twist) and the l′-adic fibre congruent to Sym^{n−1} of E
  (PotentialAutomorphyInfrastructurePartII PL.5; PotentialModularityAndCompatibleSystems
  R23.1).
- Automorphy of the l′-adic fibre by ACC+ Theorem 6.1.2, transported to l
  (ML.2/dwork-fibre-automorphy-transport), with ordinarity at l from
  ML.2/steinberg-ordinarity-lemma and ML.2/galois-ordinarity-from-automorphic.

*Acceptance.*
- The output is automorphy over the extension F′ only (acceptance of ML.2); no descent to F is
  claimed.

*Depends on:* `ML.2/qian-auxiliary-prime`, `ML.2/elliptic-symmetric-power-seed`,
`ML.2/dwork-fibre-automorphy-transport`, `ML.2/steinberg-ordinarity-lemma`,
`ML.2/galois-ordinarity-from-automorphic`, `PotentialModularityAndCompatibleSystems:R23.1`,
`PotentialAutomorphyInfrastructurePartII:PL.5`.

*Source.*
- qian-2023, Theorem 1.1, §1, p. 1 (arXiv v1); Invent. pp. 1239–1240 per routed locator; proof
  §4, pp. 21–24 (arXiv v1) — Qian Theorem
  1.1.

#### `ML.2/qian-ordinary-potential-automorphy` — Potential automorphy of ordinary l-adic representations over CM fields (Qian, Theorem 1.4)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.qian_ordinary` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let F be a CM field, F^av/F finite, n ≥ 2, l > n a prime, ι : Q̄_l ≅ ℂ and r : G_F → GL_n(Q̄_l)
continuous with (i) r unramified almost everywhere; (ii) r|_{G_{F_v}} potentially semistable
and ordinary with regular Hodge–Tate weights for each v | l; (iii) r̄ absolutely irreducible
and decomposed generic, with r̄(G_{F(ζ_l)}) enormous; (iv) some σ ∈ G_F − G_{F(ζ_l)} has r̄(σ)
scalar. Then there is a finite CM Galois F′/F, linearly disjoint from F^av over F, such that
r|_{G_{F′}} is ordinarily automorphic. The bound l > n comes from ACC+ Theorem 6.1.2(4)
(printed without it: recorded as a source issue).

*Hypotheses.*
- As in the statement; F^av arbitrary.

*Construction and proof.*
- Apply ML.2/qian-residual-potential-automorphy to r̄ with F^av enlarged to contain F̄^{ker
  r̄}(ζ_l).
- Conclude by ACC+ Theorem 6.1.2 (ordinary automorphy lifting over CM fields), requested from
  PotentialAutomorphyInfrastructure PA.4 (RT-AREA-langlands-1/7).

*Acceptance.*
- Specialises to Qian's Theorem 1.1 lifts when r is itself ordinary.

*Depends on:* `ML.2/qian-residual-potential-automorphy`,
`PotentialAutomorphyInfrastructure:PA.4`.

*Source.*
- qian-2023, Theorem 1.4, §1, p. 2 (arXiv v1); Invent. p. 1241 per routed locator; proof: last
  paragraph of §4, p. 26 (arXiv v1) — Qian Theorem 1.4.

#### `ML.2/qian-auxiliary-prime` — Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)

*Kind:* lemma.
*Declaration:* `TauCeti.PotentialAutomorphy.qian_auxiliaryPrime` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Fix a non-CM elliptic curve E/ℚ and write n = l^a m with l ∤ m. There is an odd integer N >
100n + 100, prime to ln, to the primes ramified in F^av or F̄^{ker r̄} and to the bad primes of
E, with F_{l²}F′ ⊂ F_l(ζ_N) (F′ the field of m-th roots of F_{l^s}) and the parity conditions
of Qian's list; with F^avoid the normal closure of F^av F̄^{ker r̄}(ζ_l), ℚ(ζ_N) and F^avoid
are linearly disjoint. Then there is a prime l′ (Proposition 4.1, first list) with l′ > 2n + 1,
l′ ∤ N, l′ unramified in F^avoid (correction E36), E ordinary with good reduction at l′,
r̄_{E,l′}(G_ℚ) = GL₂(F_{l′}), and the remaining conditions of the list (correction E7).

*Hypotheses.*
- Data of Qian §4; corrections E7 and E36 of the Qian extraction applied.

*Construction and proof.*
- Lemma 2.3 of Qian for N; Serre's open image theorem and Chebotarev for l′ (a density-one
  choice, owner: the proposed Part II OpenImageTheoremsForAbelianVarieties, cited as a gap).

*Acceptance.*
- The conditions are all of density one or open, so l′ exists.

*Depends on:* `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

*Source.*
- qian-2023, Proposition 4.1 (first list), §4, p. 21, and first paragraph of its proof, p. 22
  (arXiv v1); §4 opening (choice of E, N, F^avoid), p. 21; Invent. pp. 1268–1269 per routed
  locators — Qian Proposition 4.1, first list.

#### `ML.2/elliptic-symmetric-power-seed` — An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.ellipticSeed` in `TauCeti/NumberTheory/PotentialAutomorphy`.

In the situation of ML.2/qian-auxiliary-prime there are a finite Galois F_2^avoid/ℚ and a
finite totally real Galois F^suff/ℚ unramified above the prime divisors of N, with F_2^avoid ∩
F^avoid = ℚ, F^suff ∩ F^avoid F_2^avoid = ℚ, ℚ̄^{ker r̄_{E,l′}} ⊂ F_2^avoid, F^avoid and
F_2^avoid unramified above N, such that for every finite totally real F′/F^suff with F′ ∩
F_2^avoid = ℚ, Sym^{n−1} r_{E,l′}|_{G_{F′}} is automorphic.

*Hypotheses.*
- E/ℚ non-CM; l′ as in ML.2/qian-auxiliary-prime.

*Construction and proof.*
- ACC+ Corollary 7.2.4 (potential automorphy of the symmetric powers of a non-CM elliptic curve
  over totally real fields with prescribed disjointness, ML.3/acc-elliptic-symmetric-powers
  states it over totally real F′) gives the seed.
- Qian's proof checks the extra ramification and disjointness conditions.

*Acceptance.*
- Used once, in the proof of ML.2/qian-residual-potential-automorphy.

*Depends on:* `ML.2/qian-auxiliary-prime`, `ML.2/acc-symplectic-potential-automorphy`.

*Source.*
- qian-2023, Proposition 4.1 (second list and final assertion), §4, p. 21; proof p. 22 (arXiv
  v1); Invent. pp. 1269–1270 per routed locator — Qian Proposition
  4.1, second list and final assertion.

#### `ML.2/dwork-fibre-automorphy-transport` — Automorphy of the Dwork fibre at l′ and its transport to l (Qian §4)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.dworkTransport` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let t ∈ F′ be the point of the Dwork family chosen by Moret-Bailly in the proof of
ML.2/qian-residual-potential-automorphy, and V_{λ′,t}, V_{λ,t} its l′-adic and l-adic
realisations. (a) V_{λ′,t} ⊗ χ₂^{−1} is automorphic over F′: it is congruent to Sym^{n−1}
r_{E,l′}|_{G_{F′}} (automorphic by ML.2/elliptic-symmetric-power-seed), and ACC+ Theorem 6.1.2
applies at p = l′ (ordinary, enormous image, decomposed generic). (b) Hence V_{λ,t} is
automorphic as a G_{F′}-representation: the Dwork motive gives a compatible system, and
automorphy of one member gives automorphy of all (the members are r_{λ}(π) for the same π by
strong multiplicity one).

*Hypotheses.*
- Qian's choices; correction E40 of the extraction applied to the transport step.

*Construction and proof.*
- (a) ACC+ Theorem 6.1.2 (requested from PotentialAutomorphyInfrastructure PA.4).
- (b) The Dwork family's compatible system (PotentialAutomorphyInfrastructurePartII PL.5) and
  Chebotarev.

*Acceptance.*
- The transport between coefficient primes is the step where the compatible system of the Dwork
  motive is used.

*Depends on:* `ML.2/elliptic-symmetric-power-seed`, `PotentialAutomorphyInfrastructure:PA.4`,
`PotentialAutomorphyInfrastructurePartII:PL.5`,
`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

*Source.*
- qian-2023, §4, proof of Theorem 1.1, p. 24 (arXiv v1); Invent. pp. 1272–1273 per routed
  locator — Qian §4: the
  auxiliary-prime fibre is automorphic.
- acc-2023, §6.1, Theorem 6.1.2, hypothesis (5), arXiv v2 p. 133 (Annals p. 1030) — ACC+ Theorem 6.1.2 hypothesis (5).

#### `ML.2/steinberg-ordinarity-lemma` — Steinberg component and ordinarity of the automorphic Dwork realisation (Qian Lemma 4.3)

*Kind:* lemma.
*Declaration:* `TauCeti.PotentialAutomorphy.steinbergOrdinary` in `TauCeti/NumberTheory/PotentialAutomorphy`.

In the proof of ML.2/qian-residual-potential-automorphy, with v(t) < 0 at the places above l:
the l-adic realisation V_{λ,t}|_{G_{F′_v}} is regular and ordinary of weight λ_{σ,i} = M(a_σ)
(Qian's Lemma 3.10(4), from Qian's ordinarity theorem for Dwork motives); the automorphic π
with r_ι(π) ≅ V_{λ,t} has π_v an unramified twist of Steinberg at the relevant places (maximal
monodromy), hence is ι-ordinary there by Geraghty, with the constant automorphic weight +λ_τ
and central/partial slope exponents +nλ_τ, +jλ_τ (corrections E41, E43 of the extraction),
retaining the semisimplicity qualification.

*Hypotheses.*
- v(t) < 0 at the places above l (Lemma 3.0.12 is false without it: correction E1).

*Construction and proof.*
- Maximal monodromy of V at v ⇒ rec(π_v) has a single Jordan block ⇒ π_v is an unramified twist
  of Steinberg.
- Steinberg of weight 0 ⇒ ι-ordinary (PotentialAutomorphyInfrastructurePartII
  PL.0/steinberg-weight-zero-iota-ordinary).
- Central-character slope identity fixes the twist (the extraction's E43; the two sign slips
  cancel).

*Acceptance.*
- The ordinarity needed to apply ordinary lifting at l.

*Depends on:* `PotentialAutomorphyInfrastructurePartII:PL.0`,
`AutomorphicGaloisRepresentationsPartII:AG2.2`.

*Source.*
- qian-thesis-2023, Lemma 4.0.3 and its proof, Ch. 4, pp. 64–65 (thesis, PDF pp. 71–72); ≈
  published Lemma 4.3, Invent. p. 1273 —
  Qian's thesis Lemma 4.0.3 (published Lemma 4.3).
- qian-2023, Lemma 3.10(4) and its proof, pp. 20–21 (arXiv v1); the published Lemma 4.3
  (Invent. p. 1273) is NOT in arXiv v1 — Qian arXiv v1 Lemma 3.10(4).

#### `ML.2/galois-ordinarity-from-automorphic` — Galois ordinarity from automorphic ordinarity (ACC+ Corollary 5.5.2; Qian Remark 4.4)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.ordinary_of_iotaOrdinary` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let F be an imaginary CM field, ι : Q̄_p ≅ ℂ and π a cuspidal automorphic representation of
GL_n(𝔸_F), regular algebraic of weight ιλ. If π is ι-ordinary at every v ∈ S_p and r̄_ι(π) is
decomposed generic and irreducible, then r_ι(π)|_{G_{F_v}} is ordinary of weight λ for every v
∈ S_p: upper triangular with the diagonal characters determined by λ and the Hecke eigenvalues
of the ordinary U_p-operators. Qian's Remark 4.4 uses it to recover Galois ordinarity of the
automorphic Dwork realisation.

*Hypotheses.*
- F imaginary CM; decomposed generic irreducible residual representation.

*Construction and proof.*
- ACC+ Theorem 5.5.1 (local–global compatibility at p for ordinary parts; owner
  PotentialAutomorphyInfrastructure PA.2) and the argument of ACC+ §5.5.

*Acceptance.*
- Converse direction to PL.0/iota-ordinary-implies-ordinary of the PL packet, which is stated
  over totally real or polarized settings.

*Depends on:* `PotentialAutomorphyInfrastructure:PA.2`,
`PotentialAutomorphyInfrastructurePartII:PL.0`.

*Source.*
- acc-2023, §5.5, Corollary 5.5.2, arXiv v2 pp. 131–132 (Annals pp. 1027–1028) — ACC+ Corollary 5.5.2.
- qian-thesis-2023, Remark 4.0.4, Ch. 4, p. 65 (thesis, PDF p. 72); ≈ published Remark 4.4,
  Invent. p. 1274 — Qian Remark 4.4 (thesis Remark 4.0.4).

#### `ML.2/acc-symplectic-potential-automorphy` — Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.acc_symplectic` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let F/F₀ be a finite Galois extension of totally real fields, 𝓘 finite, and for i ∈ 𝓘 let n_i
be even, l_i odd primes, ı_i : Q̄_{l_i} ≅ ℂ, and r̄_i : G_F → GSp_{n_i}(F̄_{l_i}) with open
kernel and multiplier ε̄_{l_i}^{1−n_i}, unramified above a finite set 𝓛 of primes unramified in
F and ≠ l_i; let F^avoid/F be finite Galois. Then there are finite Galois F^suffices/F₀ and
F₁^avoid/ℚ with F ⊂ F^suffices, F^suffices linearly disjoint from F^avoid F₁^avoid over F,
F₁^avoid and F^avoid linearly disjoint over ℚ, F^suffices unramified above 𝓛, such that for
every finite totally real F′/F^suffices linearly disjoint from F₁^avoid each r̄_i|_{G_{F′}} is
ordinarily automorphic of weight 0 and level prime to 𝓛. It strengthens BLGGT Theorem 3.1.2
(PotentialAutomorphyInfrastructurePartII PL.5) by the extra disjointness F₁^avoid.

*Hypotheses.*
- As in the statement.

*Construction and proof.*
- The Dwork family and the scheme T̃ of BLGGT §3 with Moret-Bailly
  (ML.2/moret-bailly-galois-control), as in PL.5/dwork-potential-ordinary-automorphy, keeping
  track of F₁^avoid = the field cut out by the auxiliary residual representations (misprint in
  the linear disjointness recorded as a source issue).

*Acceptance.*
- The input to ML.2/elliptic-symmetric-power-seed and ML.3/acc-elliptic-symmetric-powers.

*Depends on:*
`PotentialAutomorphyInfrastructurePartII:PL.5/dwork-potential-ordinary-automorphy`,
`ML.2/moret-bailly-galois-control`.

*Source.*
- acc-2023, §7.2.1, Proposition 7.2.3 and its parenthetical proof, arXiv v2 pp. 204–205 (Annals
  pp. 1099–1100) — ACC+ Proposition 7.2.3.

#### `ML.2/acc-auxiliary-primes` — The auxiliary primes l₁, l₂ for symmetric powers over CM fields (ACC+ Assumption 7.2.6)

*Kind:* lemma.
*Declaration:* `TauCeti.PotentialAutomorphy.acc_auxiliaryPrimes` in `TauCeti/NumberTheory/PotentialAutomorphy`.

In the proof of ACC+ Theorem 7.1.11 (F/F₀ Galois CM, F₀^avoid, 𝓛₀, strongly irreducible rank-2
very weakly compatible systems R_i with Hodge–Tate numbers {0, 1} and S_i ∩ 𝓛₀ = ∅, integers
m_i > 0), one chooses a non-CM E/ℚ with good reduction above 𝓛₀, distinct primes l₁, l₂ and λ_i
| l₂ with: (1) l₂ splits completely in each M_i; (2) the image of G_F on E[l₁] contains
SL₂(F_{l₁}) and r̄_{i,λ_i}(G_F) ⊇ SL₂(F_{l₂}); (3) l₁, l₂ unramified in F; (4) E has good
reduction above l₁, l₂; (5) l₁, l₂ under no prime of S_i; (6) l₁, l₂ > 2m_i + 3, together with
(6′) l₁, l₂ > (m_i + 1)² and (7) r_{i,λ_i} crystalline with Hodge–Tate numbers {0, 1} above l₂
(both density-one conditions used in the rest of the proof: recorded as a source issue). Such
primes exist since all conditions hold for a set of primes of density one except the first for
l₂, which holds for a positive-density set.

*Hypotheses.*
- Data of ACC+ Theorem 7.1.11.

*Construction and proof.*
- Chebotarev and the density statements of ACC+ Lemma 7.1.3 (residual irreducibility and large
  image for density one).

*Acceptance.*
- Feeds the l₁–l₂ switch in the proof of Theorem 7.1.11.

*Depends on:* `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`,
`PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`,
`PotentialModularityAndCompatibleSystems:R24.5:operations`.

*Source.*
- acc-2023, §7.2.5, proof of Theorem 7.1.11, Assumption 7.2.6, arXiv v2 p. 208 (Annals p.
  1103) — ACC+ Assumption 7.2.6.

#### `ML.2/potential-automorphy-with-steinberg-place` — Residual potential automorphy with a Steinberg place (Fakhruddin–Khare–Patrikis, proof of Proposition 9.1)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.withSteinbergPlace` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let F be totally real, p ≫_n 0, ρ̄ : Γ_F → GSp_{2n}(k) with similitude κ̄^{1−2n} and
ρ̄|_{Γ_{F(ζ_p)}} absolutely GSp_{2n}-irreducible (ρ̄ may be GL_{2n}-reducible), and v₀ a place
with ρ̄|_{Γ_{F_{v₀}}} = 1 and N(v₀) ≡ 1 mod p. Then there are a Galois totally real F′/F
linearly disjoint from F(ρ̄, ζ_p) and a regular algebraic self-dual cuspidal Π_{F′} of
GL_{2n}(𝔸_{F′}) with r̄_ι(Π_{F′}) ≅ ρ̄|_{Γ_{F′}} and Π_{F′,w} an unramified twist of Steinberg
for every w | v₀: run BLGGT Theorem 3.1.2 with the additional Moret-Bailly condition v(t(P)) <
0 at the places above v₀.

*Hypotheses.*
- As stated; the GL_{2n}-constituents of ρ̄ are assumed self-dual and irreducible on Γ_{F(ζ_p)}
  (a gap in FKP's proof, recorded as a source issue); 'π_{v₀}' is printed for 'π_w, w | v₀'
  (E34).

*Construction and proof.*
- BLGGT Theorem 3.1.2 (PotentialAutomorphyInfrastructurePartII
  PL.5/dwork-potential-ordinary-automorphy) with the Moret-Bailly step
  ML.2/moret-bailly-galois-control including the local condition at v₀.
- v(t) < 0 forces maximal unipotent monodromy of the Dwork fibre at w | v₀, hence a Steinberg
  local component.

*Acceptance.*
- Used in FKP Proposition 9.1 to produce geometric lifts with Zariski-dense image.

*Depends on:*
`PotentialAutomorphyInfrastructurePartII:PL.5/dwork-potential-ordinary-automorphy`,
`ML.2/moret-bailly-galois-control`.

*Source.*
- fkp-2022, §9, proof of Proposition 9.1, arXiv v5 p. 42 — FKP §9, proof of Proposition 9.1.
- fkp-2022, §9, proof of Proposition 9.1, arXiv v5 p. 42 — FKP Proposition 9.1.

#### `ML.2/compatible-system-from-potential-automorphy` — A potentially automorphic geometric GSp_{2n}-lift lies in a strictly pure compatible system (FKP, after BLGGT 5.5.1)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.compatibleSystem_of_potentiallyAutomorphic` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let F be totally real and ρ : Γ_F → GSp_{2n}(O′) geometric with Zariski-dense image such that
ρ|_{Γ_{F′}} ≅ r_ι(Π_{F′}) for a RAESDC Π_{F′} of GL_{2n}(𝔸_{F′}), F′/F Galois totally real.
Then ρ belongs to a strictly pure compatible system {ρ_{ι′}} of ℓ-adic representations of Γ_F
indexed by primes ℓ and ι′ : ℂ ≅ Q̄_ℓ, each with Zariski-dense image in GSp_{2n}.

*Hypotheses.*
- As stated.

*Construction and proof.*
- The argument of BLGGT Theorem 5.5.1 (ML.2/part-of-compatible-system): Brauer's induction over
  the soluble subextensions of F′/F, with soluble descent
  (PotentialAutomorphyInfrastructurePartII PL.0/soluble-descent).
- Zariski density for all ι′ from that of ρ (Larsen–Pink style independence; FKP's argument).

*Acceptance.*
- The GSp-valued refinement of ML.2/part-of-compatible-system.

*Depends on:* `ML.2/part-of-compatible-system`,
`PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

*Source.*
- fkp-2022, §9, proof of Proposition 9.1, arXiv v5 p. 43 — FKP: the argument of BLGGT Theorem
  5.5.1.

#### `ML.2/patrikis-taylor-potential-automorphy` — Potential automorphy of pure regular odd essentially self-dual weakly compatible systems (Patrikis–Taylor, Theorem A)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.patrikisTaylor` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let R = {r_ℓ : G_ℚ → GL_m(Q̄_ℓ)} be a weakly compatible system (BLGGT §5.1) which is pure of
some weight w (the roots of the characteristic polynomials of Frobenius are Weil numbers of
weight w), regular (r_ℓ has m distinct Hodge–Tate weights) and odd essentially self-dual (r_ℓ
preserves a non-degenerate pairing up to a character, symplectic or orthogonal with the
appropriate sign of complex conjugation). Then there is a finite Galois totally real field F′
over which all the r_ℓ|_{G_{F′}} are automorphic (as quoted by Fresán–Sabbah–Yu, Theorem 5.38).
Patrikis–Taylor do not assume irreducibility.

*Hypotheses.*
- Base field ℚ as quoted; weakly compatible, pure, regular, odd essentially self-dual.

*Construction and proof.*
- Decompose R into irreducible pieces over a finite extension and apply BLGGT Theorem 5.4.1
  (ML.2/compatible-systems-potentially-automorphic) to the pieces, after Patrikis–Taylor's
  reduction to the irreducible case (the irreducible constituents are again pure, regular,
  odd).

*Acceptance.*
- Fresán–Sabbah–Yu apply it to symmetric powers of Kloosterman sheaves.

*Depends on:* `ML.2/compatible-systems-potentially-automorphic`,
`ML.2/decomposition-into-irreducible-systems`,
`PotentialModularityAndCompatibleSystems:R24.5:operations`.

*Source.*
- fsy-2022, §5.3.2, Theorem 5.38 (Patrikis–Taylor, [44, Th. A]), arXiv v5 pp. 56–57 —
  Fresán–Sabbah–Yu Theorem 5.38 (Patrikis–Taylor Theorem A).

#### `ML.2/patrikis-taylor-l-function-consequences` — Purity, functional equation and strict compatibility from potential automorphy (Patrikis–Taylor, Corollary 2.2)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.patrikisTaylor_lFunction` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let R = {r_ℓ} be a weakly compatible system of G_ℚ that is pure of weight w, regular and odd
essentially self-dual. Then for distinct primes p, ℓ the Weil–Deligne representation WD_p(R)
attached to r_ℓ is pure of weight w (Frobenius eigenvalues on gr_a of the monodromy filtration
are p-Weil numbers of weight w + a), R is strictly compatible, and the completed L-function
Λ(R, s) = L_∞(R, s) ∏_{p ∈ S} L(WD_p(R), s) L^S(R, s) has meromorphic continuation and
satisfies Λ(R, s) = ε(R, s) Λ(R^∨, 1 − s).

*Hypotheses.*
- As in ML.2/patrikis-taylor-potential-automorphy.

*Construction and proof.*
- Potential automorphy over F′ (previous node), Brauer's induction theorem over the soluble
  subfields of F′/ℚ and Godement–Jacquet for each piece
  (ML.2/compatible-system-l-function-continuation), with local–global compatibility (Caraiani)
  for purity of WD_p.

*Acceptance.*
- Fresán–Sabbah–Yu Remark 5.41: strict compatibility gives semistability of the Kloosterman
  representations at p.

*Depends on:* `ML.2/patrikis-taylor-potential-automorphy`,
`ML.2/compatible-system-l-function-continuation`, `ML.0/compatible-system-archimedean-factors`.

*Source.*
- fsy-2022, §5.3.2, Corollary 5.39 ([44, Cor. 2.2 (ii)]), arXiv v5 p. 57 — Fresán–Sabbah–Yu Corollary 5.39.
- fsy-2022, Remark 5.41, arXiv v5 p. 59 — Fresán–Sabbah–Yu Remark 5.41.

#### `ML.2/cg18-conditional-potential-modularity` — Conditional potential modularity of elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(1))

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.cg18_potentialModularity` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Assume Calegari–Geraghty's Conjecture B (the existence of Galois representations with the
expected characteristic polynomials for the torsion Hecke algebras T^an_{Q,ψ} of the locally
symmetric spaces of Res_{F/ℚ}PGL(n)). Let F be any number field and E/F an elliptic curve. Then
E is potentially modular. Status: conditional (ML.0/endpoint-status-register); Conjecture B is
imported from the proposed PotentialAutomorphyInfrastructure Part II and is not proved anywhere
in the atlas.

*Hypotheses.*
- Hypothesis: Conjecture B (status conjectural). F arbitrary; E arbitrary.

*Construction and proof.*
- Odd symmetric powers Sym^{2n−1} of E are potentially modular
  (ML.2/cg18-odd-symmetric-powers), using CG's minimal modularity lifting beyond Taylor–Wiles
  (their Theorem 5.16, which assumes Conjecture B).
- Harris–Shepherd-Barron–Taylor's reduction from odd symmetric powers to E itself (tensor
  product trick).

*Acceptance.*
- The acceptance criterion of ML.1: this is the only statement about elliptic curves over
  arbitrary number fields, and it is conditional.

*Depends on:* `ML.2/cg18-odd-symmetric-powers`, `ML.0/endpoint-status-register`,
`PotentialAutomorphyInfrastructure:PA.4`.

*Source.*
- cg-2018, Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv
  v2) = Invent. pp. 428–429 —
  Calegari–Geraghty Theorem 1.1(1).
- cg-2018, Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv
  v2) = Invent. pp. 428–429 —
  Calegari–Geraghty Conjecture B.

#### `ML.2/cg18-odd-symmetric-powers` — Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.cg18_oddSymPowers` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Assume Conjecture B. Let A/K be an elliptic curve over a number field with End_ℂ(A) = ℤ and r =
Sym^{2n−1}ρ_{A,p}. (Special case) If there is a prime p, totally split in K, with p + 1
divisible by an integer N₂ > n prime to the conductor of A, ρ̄_{A,p} surjective, A with good
reduction at all v | p and ρ̄_A|_{G_{ℚ_p}} ≅ Ind ω₂, then r is potentially modular: the Dwork
family point (BLGHT II Proposition 6.2) links r̄ to an induced representation, and two
applications of CG's Theorem 5.16 give modularity. (General case) An auxiliary elliptic curve
A′ with A′[q] ≅ A[q] (a point of the twisted modular curve X_A(q), ML.2/twisted-modular-curve)
satisfying the special-case hypothesis reduces the general case to it.

*Hypotheses.*
- Hypothesis: Conjecture B; the corrections N₂ > 2n + 1, the E216 relabelling and BLGHT II
  Proposition 6.2 as printed (from the reviewed extraction).

*Construction and proof.*
- Special case: Dwork family (owner: the proposed Part II
  PotentialAutomorphyDworkMotivesPartII; recorded as a gap) and Moret-Bailly; CG Theorem 5.16
  twice.
- General case: Moret-Bailly on X_A(q) for the auxiliary curve; then the special case.

*Acceptance.*
- Odd symmetric powers are the input to the tensor-product trick for Theorem 1.1.

*Depends on:* `ML.2/twisted-modular-curve`, `ML.2/moret-bailly-galois-control`,
`PotentialAutomorphyInfrastructure:PA.4`.

*Source.*
- cg-2018, §10, proof of Theorem 1.1, 'extra hypothesis' bullet, p. 97 (arXiv v2) = Invent. p.
  428 [sub-item sec10-special-case] — Calegari–Geraghty §10, the special case.
- cg-2018, §10, general case, pp. 97–98 (arXiv v2) = Invent. p. 429 [sub-items
  sec10-general-case, sec10-auxiliary-curve-lemma] — Calegari–Geraghty §10, the general case.

#### `ML.2/p-r-switch` — The p–r switch for symmetric powers over CM fields (BCGNT Proposition 6.2.3)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.prSwitch` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let F be an imaginary CM field, Galois over ℚ and containing an imaginary quadratic F₀, m ≥ 2,
n ≥ 1, X₀ a finite set of finite places, and R a strongly irreducible very weakly compatible
system of rank 2 with H_τ = {0, m}, det r_λ = ε^{−m}, X₀ ∩ S = ∅. Suppose given a cyclic
totally real E/ℚ of degree m disjoint from F and a Hecke character Ψ of L = E·F of the
prescribed infinity type, with the auxiliary conditions of BCGNT (6)–(8) at the primes p, r.
Then automorphy of Sym^{n−1}R ⊗ Ind_{G_L}^{G_F} Ψ at the prime p (weakly, of level prime to X₀)
implies the same at r, and conversely: the 'p–r switch' transports weak automorphy between two
residual characteristics through the CM-induced system S_CM.

*Hypotheses.*
- As in BCGNT Proposition 6.2.3 (hypotheses (1)–(8)); corrections E26–E30 of the extraction
  applied.

*Construction and proof.*
- Cyclic base change and descent along L/F (EndoscopicTransferAndUnitaryTraceComparison ET.7a)
  with strong multiplicity one (π ≅ π ⊗ (η ∘ det) from S_CM ⊗ η ≅ S_CM).
- ACC+ automorphy lifting theorems over CM fields (PotentialAutomorphyInfrastructure PA.4) at p
  and at r.

*Acceptance.*
- Input to ML.2/potential-weak-automorphy-symmetric-powers.

*Depends on:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`,
`PotentialAutomorphyInfrastructure:PA.4`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`.

*Source.*
- bcgnt-2025, Proposition 6.2.3 and proof, §6.2, arXiv v3 pp. 61–63 (published pp. 54–57; arXiv
  pagination differs) —
  BCGNT Proposition 6.2.3.

#### `ML.2/potential-weak-automorphy-symmetric-powers` — Potential weak automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 6.2.4)

*Kind:* theorem.
*Declaration:* `TauCeti.PotentialAutomorphy.weakAutomorphy_symPower` in `TauCeti/NumberTheory/PotentialAutomorphy`.

Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of
rank 2 of G_F with H_τ = {0, m} (m ≥ 2) and det r_λ = ε^{−m}. Let v₀ ∉ S. Then for each n ≥ 1
there is a CM extension F_n/F, Galois over ℚ, such that Sym^{n−1}R|_{G_{F_n}} is weakly
automorphic of level prime to the places above v₀. The proof uses a semistable elliptic curve
A/ℚ, good ordinary at an auxiliary prime q > 2nm + 1 with surjective mod q image, and the
automorphy of Sym^{nm−1} of A over a CM field F₆ (ACC+).

*Hypotheses.*
- As stated.

*Construction and proof.*
- ML.2/p-r-switch with the CM-induced system S_CM and the elliptic-curve seed (ACC+ Theorem
  7.1.11 / ML.3/acc-elliptic-symmetric-powers for the symmetric powers of A).
- Moret-Bailly to find the auxiliary data over F_n.

*Acceptance.*
- Feeds BCGNT Theorem 6.2.1 and the purity Lemma 6.1.3.

*Depends on:* `ML.2/p-r-switch`, `ML.2/acc-symplectic-potential-automorphy`,
`PotentialModularityAndCompatibleSystems:R23.1`.

*Source.*
- bcgnt-2025, Theorem 6.2.4 and proof (incl. the elliptic curve A/ℚ and the automorphy of
  Sym^{nm−1}ρ_{A,q}|G_{F₆}), §6.2, arXiv v3 pp. 64–68 (published pp. 57–61; arXiv pagination
  differs) — BCGNT Theorem 6.2.4.

**Remaining refinements.**
- BLGGT Appendix A (density, disjointness and characters with prescribed local behaviour) is
  used but not decomposed.
- The Dwork-family Hodge and monodromy computations and the switching theorem belong to the
  proposed Part II PotentialAutomorphyDworkMotivesPartII (not yet a roadmap); they are cited,
  not planned.

## Layer ML.3: Symmetric powers and Sato-Tate (`TauCeti/NumberTheory/SymmetricPower/…`)

ML.3 states the symmetric-power endpoints with their field, weight and regularity assumptions
per source: Newton–Thorne over ℚ (I, II), over totally real fields (Hilbert modular forms, SP_n
for all n) and over CM fields, Clozel–Thorne's Sym⁶ and Sym⁸ with their reductions, and the
low-degree transfers they rest on (Gelbart–Jacquet, Kim–Shahidi, Kim with Henniart,
Ramakrishnan), placed here so that ML.3 does not depend on ML.5. The analytic consequences are
separate nodes: completed symmetric-power L-functions, Serre's equidistribution criterion, the
Sato–Tate group, purity from symmetric powers, and the Ramanujan and Sato–Tate theorems for
Bianchi modular forms (BCGNT). Potential automorphy alone never proves equidistribution here:
the analytic step is its own node.

*Coverage.* Checkpoint 3: Newton–Thorne 2026 (SP_n, Lemma 2.1, Proposition 6.1, Theorems 6.4,
6.5), Clozel–Thorne III (Theorem 6.1, Corollary 7.2, Lemma 7.5 and the reductions), ACC+
Corollaries 7.1.13 and 7.2.4, BCGNT (Theorems A–C, E–G, 6.2.1, Lemma 6.1.3, Sato–Tate groups,
Serre's criterion), Calegari–Geraghty Theorem 1.1(2), and the low-degree transfers
(Gelbart–Jacquet, Kim–Shahidi, Kim with Henniart, Ramakrishnan) placed here so that ML.3 does
not depend on ML.5.

### Objects

#### `ML.3/symmetric-power-lifting` — The symmetric power lifting Sym^{n−1}π

*Kind:* definition.
*Declaration:* `TauCeti.SymmetricPower.SymPowerLift` in `TauCeti/NumberTheory/SymmetricPower/Basic`.

For π cuspidal on GL₂(𝔸_ℚ) and n ≥ 1, a symmetric power lifting Sym^{n−1}π is an automorphic
representation Π of GL_n(𝔸_ℚ) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) for every place v (local
Langlands for GL₂ and GL_n). For π regular algebraic and non-CM, Sym^{n−1}π exists as a regular
algebraic cuspidal representation iff Sym^{n−1}r_{π,ι} is automorphic in the sense of
PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation for one
(equivalently every) p and ι : Q̄_p ≅ ℂ (strong multiplicity one, Chebotarev density and
local–global compatibility); for CM π or weight-one π the lifting is isobaric and usually not
cuspidal.

*Hypotheses.*
- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic
  newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois
  representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

*Construction and proof.*
- Galois criterion: an automorphic Π with r_{Π,ι} ≅ Sym^{n−1}r_{π,ι} has the right Satake
  parameters at almost all l, and local–global compatibility at the remaining l gives rec(Π_l)
  = Sym^{n−1}rec(π_l).
- Cuspidality for non-CM π: Sym^{n−1}r_{π,ι} is irreducible because the Zariski closure of
  r_{π,ι}(G_ℚ) contains SL₂ (Ribet).

*Uses.*
- ModularityAndLanglandsExtensions:ML.3/level-one-symmetric-powers: Theorem A
- ModularityAndLanglandsExtensions:ML.3/non-cm-symmetric-powers: NT II Theorem A
- ModularityAndLanglandsExtensions:ML.3/sato-tate-elliptic-curves: the L-functions L(Sym^nE, s)

| API | role | statement |
|---|---|---|
| `TauCeti.SymmetricPower.SymPowerLift` | structure | Π on GL_n(𝔸_ℚ) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) at every v. |
| `TauCeti.SymmetricPower.SymPowerLift.of_galois` | characterisation | Sym^{n−1}r_{π,ι} automorphic ⇒ Sym^{n−1}π exists (regular algebraic, cuspidal for non-CM π). |
| `TauCeti.SymmetricPower.SymPowerLift.unique` | extensionality | Unique up to isomorphism (strong multiplicity one). |
| `TauCeti.SymmetricPower.SymPowerLift.twist` | compatibility | Sym^{n−1}(π ⊗ χ) = Sym^{n−1}π ⊗ χ^{n−1}. |
| `TauCeti.SymmetricPower.SymPowerLift.lFunction` | other | L^S(Sym^{n−1}π, s) = L^S(Π, s) for S containing the archimedean places; for n ≥ 2 and Π cuspidal the finite L-function is entire (Godement–Jacquet). |

*Unit tests.*
- `TauCeti.SymmetricPower.sym1` (computation): n = 2: Sym¹π = π.
- `TauCeti.SymmetricPower.gelbart_jacquet` (computation): n = 3: Sym²π is the Gelbart–Jacquet
  lift (the adjoint lift twisted by the central character).
- `TauCeti.SymmetricPower.cm_not_cuspidal` (computation): π = automorphic induction of a Hecke
  character ψ of an imaginary quadratic K: Sym²π = Ind ψ² ⊞ ψ|_{𝔸_ℚ^×}, not cuspidal (corrected
  in checkpoint 3: the η_K factor belongs to Ad(π), not Sym²π).
- `TauCeti.SymmetricPower.degenerate_n1` (computation): n = 1: Sym⁰π is the trivial character.

*Acceptance.*
- Check the known small cases: n = 2 is π itself; n = 3 is Gelbart–Jacquet; n = 4, 5 are
  Kim–Shahidi (cited in Newton–Thorne's introduction).

*Depends on:*
`PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation`,
`AutomorphicGaloisRepresentationsPartII:AG2.2`.

*Source.*
- newton-thorne-I, Introduction, p. 1 (arXiv v3) — The definition of the functorial lift along Sym^m and the
  history of small cases.

#### `ML.3/accessible-regular-refinement` — Accessible and n-regular refinements

*Kind:* definition.
*Declaration:* `TauCeti.SymmetricPower.IsAccessibleRefinement` in `TauCeti/NumberTheory/SymmetricPower/Eigenvariety`.

For a definite unitary group G_n over F⁺ and an automorphic π of G_n(𝔸_{F⁺}) with p-adic places
S_p, an accessible refinement is a choice χ = (χ_v)_{v∈S_p} of smooth characters χ_v : T_n(F_ṽ)
→ Q̄_p^× occurring as subquotients of the normalised Jacquet module ι^{−1}r_{N_n}(π_v),
equivalently with π_v ↪ i^{GL_n}_{B_n}ιχ_v. For n = 2 it is n-regular if (χ_{v,1}/χ_{v,2})^i ≠
1 for 1 ≤ i ≤ n − 1 and every v ∈ S_p. For π on GL₂(𝔸_ℚ), π_l has an accessible refinement iff
its Jacquet module is nonzero, iff π_l is not supercuspidal.

*Hypotheses.*
- G_n the definite unitary group of NT §1; T_n ⊂ B_n ⊂ GL_n diagonal torus and upper Borel.

*Construction and proof.*
- Definition; the equivalence with non-supercuspidality: an irreducible π_l embeds into a
  principal series iff its Jacquet module is nonzero.

*Uses.*
- ModularityAndLanglandsExtensions:ML.3/eigenvariety-propagation: the regularity hypotheses
  (1)–(2)
- ModularityAndLanglandsExtensions:ML.3/non-supercuspidal-symmetric-powers: Proposition 8.2 and
  8.3

| API | role | statement |
|---|---|---|
| `TauCeti.SymmetricPower.IsAccessibleRefinement` | data | χ_v a subquotient of the normalised Jacquet module at each v ∈ S_p. |
| `TauCeti.SymmetricPower.IsNRegular` | data | (χ_{v,1}/χ_{v,2})^i ≠ 1 for 1 ≤ i ≤ n − 1. |
| `TauCeti.SymmetricPower.isAccessible_iff_not_supercuspidal` | characterisation | An accessible refinement exists iff π_l is not supercuspidal. |
| `TauCeti.SymmetricPower.isNRegular_mono` | relation | n-regular ⇒ m-regular for m ≤ n. |

*Unit tests.*
- `TauCeti.SymmetricPower.unramified_refinement` (computation): π_l unramified with Satake
  parameters {α, β}: the two refinements are (α, β) and (β, α); n-regular iff (α/β)^i ≠ 1 for i
  < n.
- `TauCeti.SymmetricPower.steinberg_refinement` (computation): π_l a twist of Steinberg has
  exactly one accessible refinement.
- `TauCeti.SymmetricPower.supercuspidal_none` (computation): π_l supercuspidal has no
  accessible refinement (the hypothesis of NT I Theorem B).
- `TauCeti.SymmetricPower.not_regular_example` (computation): α/β = −1 is 2-regular but not
  3-regular: (α/β)² = 1.

*Acceptance.*
- Check that an n-regular refinement excludes the ratio being an i-th root of unity for i < n:
  the condition keeps Sym^{n−1} of the refinement regular.

*Depends on:* `ML.3/symmetric-power-lifting`.

*Source.*
- newton-thorne-I, §2, p. 34, and Definition 2.23, p. 40 (arXiv v3) — The definitions of accessible and n-regular refinements.

#### `ML.3/symmetric-power-lift-over-number-fields` — Symmetric power lifts Sym^{n−1}π over a number field

*Kind:* definition.
*Declaration:* `TauCeti.SymmetricPower.SymPowerExists` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be a number field, π a cuspidal automorphic representation of GL₂(𝔸_F) and n ≥ 1.
Sym^{n−1}π exists if there is an automorphic representation Π of GL_n(𝔸_F) with rec_{F_v}(Π_v)
≅ Sym^{n−1} ∘ rec_{F_v}(π_v) for every place v (ML.3/functorial-lift with R = Sym^{n−1}). For F
totally real and π regular algebraic (classical Hilbert, weights ≥ 2 of constant parity) and
non-CM, Clozel–Thorne phrase it Galois-theoretically: there is a regular algebraic cuspidal Π
with Sym^{n−1} r_l(π) ≅ r_l(Π) for every l; ML.3/one-prime-criterion shows the two agree. This
generalises ML.3/symmetric-power-lifting (over ℚ) to number fields.

*Hypotheses.*
- F a number field; π cuspidal on GL₂(𝔸_F).

*Construction and proof.*
- Definition through ML.3/functorial-lift; Galois form through the automorphy predicate of
  ML.0/nt26-automorphy-predicate.

*Uses.*
- Newton–Thorne 2026, Theorem A: existence of Sym^{n−1}π for Hilbert modular forms
- Clozel–Thorne 2017, Theorem 6.1: Sym⁶ and Sym⁸ over totally real fields
- ModularityAndLanglandsExtensions:ML.3/sp-statement: the statement SP_n

| API | role | statement |
|---|---|---|
| `TauCeti.SymmetricPower.SymPowerExists` | data | ∃ Π with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) at all v. |
| `TauCeti.SymmetricPower.SymPowerExists.one` | example | n = 1: Sym⁰π is the trivial character. |
| `TauCeti.SymmetricPower.SymPowerExists.two` | example | n = 2: Sym¹π = π. |
| `TauCeti.SymmetricPower.SymPowerExists.iff_galois` | characterisation | For π RAESDC non-CM over totally real F: SymPowerExists π n ↔ Sym^{n−1} r_{π,ι} automorphic for one (every) ι. |
| `TauCeti.SymmetricPower.SymPowerExists.baseChange` | functoriality | For L/F soluble: if Sym^{n−1}π exists then Sym^{n−1}BC_{L/F}(π) exists. |

*Unit tests.*
- `TauCeti.SymmetricPower.symPowerExists_three` (computation): n = 3: Sym²π exists for every
  cuspidal π (Gelbart–Jacquet), cuspidal iff π is not dihedral.
- `TauCeti.SymmetricPower.symPowerExists_cm_not_cuspidal` (non-example): For π = AI(θ)
  dihedral, Sym²π exists but is not cuspidal; existence does not mean cuspidality.
- `TauCeti.SymmetricPower.symPowerExists_Q` (compatibility): For F = ℚ it agrees with
  ML.3/symmetric-power-lifting.

*Acceptance.*
- Over ℚ it is ML.3/symmetric-power-lifting.

*Depends on:* `ML.3/functorial-lift`, `ML.3/symmetric-power-lifting`,
`ML.0/nt26-automorphy-predicate`.

*Source.*
- ct-2017, §1 Introduction, manuscript p. 2: “We will say that the nth symmetric power Symn π
  exists if there is a regular algebraic cuspidal automorphic representation Π of GLn+1 (AF )”
  — Clozel–Thorne §1: the definition of 'Sym^n π exists'.

#### `ML.3/sp-statement` — The statement SP_n (Newton–Thorne, Conjecture B)

*Kind:* definition.
*Declaration:* `TauCeti.SymmetricPower.SP` in `TauCeti/NumberTheory/SymmetricPower`.

For n ≥ 1, SP_n is the proposition: for every totally real field F and every cuspidal regular
algebraic automorphic representation π of GL₂(𝔸_F) without CM, the lift Sym^{n−1}π exists as a
RAESDC automorphic representation of GL_n(𝔸_F), in any of the equivalent senses of
ML.3/one-prime-criterion. (Every cuspidal regular algebraic π of GL₂ over a totally real field
is RAESDC.) Newton–Thorne prove SP_n for all n (ML.3/all-regular-symmetric-powers).

*Hypotheses.*
- n ≥ 1.

*Construction and proof.*
- Definition of the proposition.

*Uses.*
- Newton–Thorne 2026, §1 and Theorem 6.4: proved for all n by induction on n via n = p + r
- ModularityAndLanglandsExtensions:ML.3/low-rank-symmetric-powers: the base cases n ≤ 5

| API | role | statement |
|---|---|---|
| `TauCeti.SymmetricPower.SP` | data | The proposition SP_n. |
| `TauCeti.SymmetricPower.SP.one` | example | SP 1 holds. |
| `TauCeti.SymmetricPower.SP.two` | example | SP 2 holds. |
| `TauCeti.SymmetricPower.SP.of_le_five` | relation | SP n for n ≤ 5 (low-rank transfers). |
| `TauCeti.SymmetricPower.SP.all` | relation | SP n for all n (Newton–Thorne Theorem 6.4). |

*Unit tests.*
- `TauCeti.SymmetricPower.SP_one` (degenerate): SP 1: Sym⁰π is the trivial character, cuspidal
  on GL₁.
- `TauCeti.SymmetricPower.SP_three` (computation): SP 3 is Gelbart–Jacquet's theorem for non-CM
  π.
- `TauCeti.SymmetricPower.SP_cm_excluded` (non-example): SP_n says nothing about CM π, whose
  symmetric powers (n ≥ 3) are not cuspidal.

*Acceptance.*
- SP₁, SP₂ are trivial; SP₃ is Gelbart–Jacquet; SP₄, SP₅ are Kim–Shahidi and Kim
  (ML.3/low-rank-symmetric-powers).

*Depends on:* `ML.3/symmetric-power-lift-over-number-fields`, `ML.0/nt26-automorphy-predicate`.

*Source.*
- nt-2026, Conjecture B, §1 (Introduction), p. 3 (arXiv v2); restated after Theorem 3.2, p. 13:
  “Conjecture B. (SPn ) For any totally real field F and any cuspidal, regular algbraic
  automorphic representation π of GL2 (AF ), without CM, the lift Symn−1 π exists” —
  Newton–Thorne Conjecture B (SP_n).

#### `ML.3/completed-symmetric-power-l-function` — The completed symmetric power L-function Λ(Sym^n E, s)

*Kind:* construction.
*Declaration:* `TauCeti.SymmetricPower.completedL` in `TauCeti/NumberTheory/SymmetricPower`.

For an elliptic curve E/ℚ and n ≥ 1, Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s), where
L(Sym^n E, s) = ∏_p L_p(Sym^n E, s) is the Euler product of the local factors of Sym^n of the
Weil–Deligne representation at p (at all p, including the bad ones), N_n is the conductor of
Sym^n, and γ_n(s) is the archimedean factor of Sym^n of the Hodge structure of E (a product of
Γ_ℂ(s − j) and, for n even, a Γ_ℝ factor), as in Dummigan–Martin–Watkins (2009). Removing the
nowhere-vanishing entire factor N_n^{s/2} does not affect entireness but changes the functional
equation's normalisation.

*Hypotheses.*
- E/ℚ an elliptic curve; n ≥ 1.

*Construction and proof.*
- Local factors from the Weil–Deligne representation of Sym^n(H¹(E)) (Grothendieck's ℓ-adic
  monodromy).
- Archimedean factor from ML.0/compatible-system-archimedean-factors applied to Sym^n of the
  compatible system of E.
- Dummigan–Martin–Watkins was not available; the definition is the one ML.0 gives for the
  compatible system Sym^n H¹(E) (recorded as a gap: the exact DMW09 normalisation is not
  checked).

*Uses.*
- Newton–Thorne II, Corollary B: entireness for non-CM E
- Newton–Thorne I, Corollary C: entireness for semistable E

| API | role | statement |
|---|---|---|
| `TauCeti.SymmetricPower.completedL` | data | Λ(Sym^n E, s). |
| `TauCeti.SymmetricPower.completedL_eq` | characterisation | Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s). |
| `TauCeti.SymmetricPower.completedL_entire_iff` | relation | Λ(Sym^n E, s) is entire iff N_n^{−s/2}Λ(Sym^n E, s) is (the conductor factor never vanishes). |
| `TauCeti.SymmetricPower.completedL_eq_automorphic` | compatibility | If Sym^nπ_E exists, Λ(Sym^n E, s) = Λ(Sym^nπ_E, s − n/2) (with the unitary normalisation shift). |

*Unit tests.*
- `TauCeti.SymmetricPower.completedL_one` (computation): n = 1: Λ(Sym¹E, s) =
  N^{s/2}·2(2π)^{−s}Γ(s)·L(E, s).
- `TauCeti.SymmetricPower.completedL_zero` (degenerate): n = 0: Λ(Sym⁰E, s) =
  π^{−s/2}Γ(s/2)ζ(s), not entire.
- `TauCeti.SymmetricPower.completedL_gamma_two` (computation): n = 2: γ₂(s) = Γ_ℝ(s)Γ_ℂ(s):
  Γ_ℂ(s) for the Hodge types (2,0), (0,2) and Γ_ℝ(s) for (1,1), on which complex conjugation
  acts by −1.
- `TauCeti.SymmetricPower.completedL_partial_not` (non-example): The partial L-function without
  bad Euler factors is not Λ: its functional equation fails.

*Acceptance.*
- For n = 1, Λ(Sym¹E, s) = N^{s/2}Γ_ℂ(s)L(E, s).

*Depends on:* `ML.0/compatible-system-archimedean-factors`, `ML.3/symmetric-power-lifting`.

*Source.*
- newton-thorne-II, §1 Introduction, Corollary B, arXiv v2 p. 2 (Publ. IHÉS 134, p. 118):
  “Then, for each integer n ≥ 2, the completed symmetric power L-function Λ(Symn E, s) as
  defined in e.g. [DMW09], admits an analytic continuation to the entire complex plane.” —
  Newton–Thorne II Corollary B: Λ(Sym^n E, s) as defined in DMW09.

#### `ML.3/parallel-weight-and-clozel-purity` — Parallel weight for GL₂ over CM fields, and Clozel's purity lemma

*Kind:* definition.
*Declaration:* `TauCeti.SymmetricPower.IsParallelWeight` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be a number field and π a regular algebraic representation of GL₂(𝔸_F) of weight λ =
(λ_{τ,1} ≥ λ_{τ,2})_τ. π has parallel weight if λ_{τ,1} − λ_{τ,2} is independent of τ,
equivalently if π has a regular algebraic twist of weight (m − 1, 0)_τ for some m ≥ 1; it has
parallel weight k ≥ 2 if that twist has weight (k − 2, 0)_τ. Clozel's purity lemma: for F
imaginary CM and π cuspidal regular algebraic on GL₂(𝔸_F), λ_{τ,1} + λ_{τc,2} = w is
independent of τ, so π is of parallel weight when F is imaginary quadratic (BCGNT §1.6).

*Hypotheses.*
- F a number field (CM for the purity lemma); π regular algebraic.

*Construction and proof.*
- Definition by the weight λ; purity lemma: Clozel 1990, Lemme 4.9 (owner:
  AutomorphicFormsOnReductiveGroups AF.4).

*Uses.*
- BCGNT 2025, Theorems A and B: hypothesis: π of parallel weight
- ModularityAndLanglandsExtensions:ML.3/bianchi-ramanujan: parallel-weight Ramanujan over CM
  fields

| API | role | statement |
|---|---|---|
| `TauCeti.SymmetricPower.IsParallelWeight` | data | λ_{τ,1} − λ_{τ,2} independent of τ. |
| `TauCeti.SymmetricPower.parallelWeight` | projection | The parallel weight k ≥ 2 of π. |
| `TauCeti.SymmetricPower.IsParallelWeight.twist` | compatibility | Parallel weight is invariant under algebraic twists. |
| `TauCeti.SymmetricPower.clozel_purity` | relation | F imaginary CM, π cuspidal regular algebraic on GL₂: λ_{τ,1} + λ_{τc,2} is independent of τ. |
| `TauCeti.SymmetricPower.isParallelWeight_of_imagQuadratic` | relation | F imaginary quadratic ⇒ every cuspidal regular algebraic π on GL₂ has parallel weight. |

*Unit tests.*
- `TauCeti.SymmetricPower.parallelWeight_Q` (degenerate): F = ℚ: every regular algebraic π has
  parallel weight.
- `TauCeti.SymmetricPower.parallelWeight_two` (computation): The π of an elliptic curve over a
  CM field has parallel weight 2 (weight (0, 0)_τ).
- `TauCeti.SymmetricPower.nonParallel_hilbert` (non-example): A Hilbert modular form over a
  real quadratic field of weight (2, 4) is not of parallel weight.

*Acceptance.*
- Every cuspidal Bianchi π (F imaginary quadratic) has parallel weight.

*Depends on:* `AutomorphicFormsOnReductiveGroups:AF.4`,
`AutomorphicGaloisRepresentationsPartII:AG2.0/regular-algebraic-of-weight`.

*Source.*
- bcgnt-2025, Definition 1.6.1 (Parallel Weight) and the following paragraph, §1.6 Notation,
  arXiv v3 p. 13 (= Definition 1.5.1, §1.5, published p. 11: arXiv numbering and pagination
  differ) — BCGNT: Definition
  (Parallel Weight) and the following paragraph.

#### `ML.3/sato-tate-group` — The Sato–Tate group ST(π) of a non-CM regular algebraic GL₂ representation over a CM field

*Kind:* definition.
*Declaration:* `TauCeti.SymmetricPower.SatoTateGroup` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be imaginary CM and π a cuspidal regular algebraic representation of GL₂(𝔸_F) of weight
λ, not CM, with λ_{τ,1} + λ_{τc,2} = w and ω_π = |·|^{−w}ψ, ψ unitary of type A₀. ST(π) =
U₂(ℝ)_a := {g ∈ U₂(ℝ) : det(g)^a = 1} if ψ has finite order a, and ST(π) = U₂(ℝ) otherwise. It
is a compact subgroup of GL₂(ℂ), and for π_v unramified and essentially tempered the conjugacy
class of q_v^{−w/2} rec(π_v)(Frob_v) meets ST(π) in a unique ST(π)-conjugacy class [π_v] (Lemma
7.2.2).

*Hypotheses.*
- F imaginary CM; π non-CM cuspidal regular algebraic on GL₂.

*Construction and proof.*
- Definition by cases on the order of ψ; Lemma 7.2.2 from the unitarity of the normalised
  Satake parameters (ML.3/bianchi-ramanujan) and the determinant condition.

*Uses.*
- ModularityAndLanglandsExtensions:ML.3/bianchi-sato-tate: equidistribution of [π_v] for the
  Haar measure of ST(π)
- ModularityAndLanglandsExtensions:ML.3/serre-equidistribution-criterion: irreducible
  representations of ST(π)

| API | role | statement |
|---|---|---|
| `TauCeti.SymmetricPower.SatoTateGroup` | data | ST(π) ⊂ GL₂(ℂ). |
| `TauCeti.SymmetricPower.SatoTateGroup.isCompact` | instance | ST(π) is compact. |
| `TauCeti.SymmetricPower.SatoTateGroup.ofFiniteOrder` | characterisation | ψ of finite order a ⇒ ST(π) = {g ∈ U₂(ℝ) : det(g)^a = 1}. |
| `TauCeti.SymmetricPower.satoTateClass` | constructor | [π_v] ∈ ST(π)/conjugacy for π_v unramified and essentially tempered. |
| `TauCeti.SymmetricPower.satoTateClass_unique` | extensionality | The class [π_v] is unique (Lemma 7.2.2). |

*Unit tests.*
- `TauCeti.SymmetricPower.SatoTateGroup.eq_SU2_of_elliptic` (computation): For π of a non-CM
  elliptic curve over F, ψ = 1 and ST(π) = SU(2) = U₂(ℝ)₁.
- `TauCeti.SymmetricPower.satoTate_infiniteOrder` (degenerate): If ψ has infinite order, ST(π)
  = U₂(ℝ).
- `TauCeti.SymmetricPower.satoTate_cm_excluded` (non-example): For CM π the definition does not
  apply: the Frobenius classes equidistribute in the normaliser of a torus, not in U₂(ℝ)_a.

*Acceptance.*
- For a non-CM elliptic curve, ψ is trivial (a = 1) and ST(π) = SU(2).

*Depends on:* `ML.3/bianchi-ramanujan`.

*Source.*
- bcgnt-2025, Definition of ST(π) and Lemma 7.2.2 with proof, §7.2, arXiv v3 pp. 69–70
  (published p. 62; arXiv pagination differs) — BCGNT §7.2: the definition of ST(π) and Lemma 7.2.2.

#### `ML.3/bianchi-modular-forms` — Bianchi modular forms, their Fourier coefficients and parabolic cohomology

*Kind:* definition.
*Declaration:* `TauCeti.SymmetricPower.BianchiEigenform` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be imaginary quadratic. A cuspidal Bianchi modular eigenform of weight k ≥ 2 and level 𝔫
is a vector-valued function on GL₂(𝔸_F) generating a regular algebraic cuspidal automorphic
representation π of parallel weight k (the infinitesimal character of π_∞ is that of (Sym^{k−2}
⊗ \overline{Sym^{k−2}})^∨), with Fourier expansion f((t z; 0 1)) = |t|_F Σ_{α ∈ F^×} c(αtδ_F,
f) W(αt_∞) e_F(αz), coefficients c(I, f) vanishing unless I ⊂ O_F and normalised by c(O_F, f) =
1. Its Hecke eigenvalues also occur in the parabolic cohomology H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗
\overline{Sym^{k−2}ℂ²}) (Eichler–Shimura–Harder).

*Hypotheses.*
- F imaginary quadratic; k ≥ 2; 𝔫 a non-zero ideal.

*Construction and proof.*
- Definition through the automorphic representation (Clozel's purity forces parallel weight;
  ML.3/parallel-weight-and-clozel-purity).
- Fourier expansion via the Whittaker model (Hida; Williams).
- Comparison with cohomology: Harder's Eichler–Shimura isomorphism (owner:
  ArithmeticLocallySymmetricSpaces).

*Uses.*
- ModularityAndLanglandsExtensions:ML.3/bianchi-fourier-ramanujan: the bound |c(𝔭, f)| ≤
  2N(𝔭)^{(k−1)/2}
- ModularityAndLanglandsExtensions:ML.3/bianchi-mass-equidistribution: the measures μ_f

| API | role | statement |
|---|---|---|
| `TauCeti.SymmetricPower.BianchiEigenform` | structure | A cuspidal Bianchi eigenform of weight k and level 𝔫. |
| `TauCeti.SymmetricPower.BianchiEigenform.coeff` | projection | The Fourier coefficient c(I, f). |
| `TauCeti.SymmetricPower.BianchiEigenform.coeff_one` | simp | c(O_F, f) = 1. |
| `TauCeti.SymmetricPower.BianchiEigenform.coeff_eq_eigenvalue` | relation | For 𝔭 ∤ 𝔫, c(𝔭, f) is the T_𝔭-eigenvalue. |
| `TauCeti.SymmetricPower.BianchiEigenform.toAutRep` | projection | The cuspidal automorphic representation of GL₂(𝔸_F) generated by f (parallel weight k). |

*Unit tests.*
- `TauCeti.SymmetricPower.bianchi_weight2_elliptic` (computation): A modular elliptic curve
  over F of conductor 𝔫 without CM by F gives a weight-2 Bianchi eigenform with c(𝔭, f) = N(𝔭)
  + 1 − #E(F_𝔭).
- `TauCeti.SymmetricPower.bianchi_coeff_nonintegral` (degenerate): c(I, f) = 0 for I ⊄ O_F.
- `TauCeti.SymmetricPower.bianchi_not_holomorphic` (non-example): Bianchi forms are not
  holomorphic functions on a Hermitian domain: ℍ³ is not Hermitian, so there is no q-expansion
  in holomorphic exponentials; the expansion involves the Bessel-type Whittaker function W.

*Acceptance.*
- The objects of Theorems E–G.

*Depends on:* `ML.3/parallel-weight-and-clozel-purity`,
`ArithmeticLocallySymmetricSpaces:ALS.3`.

*Source.*
- bcgnt-2025, §1.3 Bianchi Modular Forms, arXiv v3 pp. 9–11 (published pp. 8–10; arXiv
  pagination differs) — BCGNT §1.3: Bianchi modular
  forms.

#### `ML.3/functorial-lift` — Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N

*Kind:* definition.
*Declaration:* `TauCeti.Functoriality.IsFunctorialLift` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be a number field, π a cuspidal automorphic representation of GL_n(𝔸_F) and R : GL_n →
GL_N an algebraic representation. A functorial lift of π along R is an automorphic
representation R(π) of GL_N(𝔸_F) (isobaric) such that for every place v the Langlands parameter
of R(π)_v is R ∘ rec(π_v), where rec is the local Langlands correspondence for GL_n(F_v)
(Harris–Taylor, Henniart at finite v; Langlands at infinite v). By strong multiplicity one for
isobaric representations R(π) is unique if it exists. A weak lift asks the matching only at
almost all v; CKPSS's 'functorial lift' from classical groups asks it at the archimedean places
and at almost all unramified finite places.

*Hypotheses.*
- F a number field; π cuspidal on GL_n(𝔸_F); R algebraic.

*Construction and proof.*
- Local parameters: SUPP LLC for GL_n (EndoscopicTransferAndUnitaryTraceComparison ET.6) and
  archimedean ML.0.
- Uniqueness: Jacquet–Shalika strong multiplicity one for isobaric sums
  (AutomorphicLFunctionsAndLocalFactors AL.3).

*Uses.*
- ModularityAndLanglandsExtensions:ML.3/gelbart-jacquet: R = Sym² (and Ad) on GL₂
- ModularityAndLanglandsExtensions:ML.3/kim-shahidi-sym3: R = Sym³ on GL₂ and std ⊗ std on GL₂
  × GL₃
- ModularityAndLanglandsExtensions:ML.3/kim-sym4: R = Sym⁴ on GL₂ and ∧² on GL₄
- Newton–Thorne 2021, §1: symmetric power functoriality is the case R = Sym^m

| API | role | statement |
|---|---|---|
| `TauCeti.Functoriality.IsFunctorialLift` | data | Π is a functorial lift of π along R: rec(Π_v) ≅ R ∘ rec(π_v) at every place. |
| `TauCeti.Functoriality.IsWeakLift` | data | The same at almost all unramified places (Satake parameters). |
| `TauCeti.Functoriality.IsFunctorialLift.unique` | extensionality | Two functorial lifts of π along R are isomorphic (strong multiplicity one). |
| `TauCeti.Functoriality.IsFunctorialLift.toWeak` | projection | A functorial lift is a weak lift. |
| `TauCeti.Functoriality.IsFunctorialLift.comp` | functoriality | If Π is a lift of π along R and Π′ a lift of Π along R′ then Π′ is a lift of π along R′ ∘ R. |
| `TauCeti.Functoriality.IsFunctorialLift.id` | functoriality | π is its own lift along the identity. |
| `TauCeti.Functoriality.IsFunctorialLift.lFunction` | compatibility | L(s, R(π)) = L(s, π, R), the Langlands L-function of π along R. |

*Unit tests.*
- `TauCeti.Functoriality.lift_det` (computation): R = det on GL₂: the lift of π is the central
  character ω_π (a Hecke character), by local class field theory.
- `TauCeti.Functoriality.lift_gl1` (degenerate): n = 1, R = χ ↦ χ^k: the lift of a Hecke
  character χ is χ^k.
- `TauCeti.Functoriality.lift_sym2_dihedral_not_cuspidal` (non-example): For π = AI_{K/F}(θ)
  dihedral, Sym²π exists but is not cuspidal: it is AI(θ²) ⊞ θ|_{𝔸_F^×} (whereas Ad(π) =
  AI(θ/θ^σ) ⊞ η_{K/F}).
- `TauCeti.Functoriality.lift_std` (compatibility): R = std: the lift of π is π itself, and
  IsFunctorialLift agrees with equality of rec at every place.

*Acceptance.*
- R = Sym^{n−1} on GL₂ recovers ML.3/symmetric-power-lifting; R = std ⊗ std′ on GL₂ × GL₂ is
  Ramakrishnan's lift.

*Depends on:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6`,
`ML.0/archimedean-langlands-conventions`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`.

*Source.*
- newton-thorne-I, Introduction, 'Context', p. 1 (arXiv:1912.11261v3) — Newton–Thorne I define the functorial
  lift R(π) through local parameters at every place.

### Theorems, comparisons and registers

#### `ML.3/eigenvariety-propagation` — Automorphy of Sym^{n−1} is constant on eigencurve components (NT I Theorem 2.33)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.automorphic_of_same_component` in `TauCeti/NumberTheory/SymmetricPower/Eigenvariety`.

Let (π₀, χ₀), (π′₀, χ′₀) be refined points of the eigencurve E₀ (tame level N, prime p) with
corresponding points z₀, z′₀. Suppose either (1) χ₀ is numerically non-critical and n-regular,
(2) χ′₀ is n-regular, (3) the Zariski closures of r_{π₀,ι}(G_{ℚ_p}) and r_{π′₀,ι}(G_{ℚ_p})
contain SL₂, (4) Sym^{n−1}r_{π₀,ι} is automorphic; or (1ord) χ₀ is ordinary, (2ord) π₀, π′₀ are
not CM, (3ord) Sym^{n−1}r_{π₀,ι} is automorphic. If z₀, z′₀ lie on a common irreducible
component of E_{0,ℂ_p}, then Sym^{n−1}r_{π′₀,ι} is automorphic.

*Hypotheses.*
- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic
  newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois
  representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
- E₀ the Coleman–Mazur eigencurve and E_n the eigenvariety of a definite unitary group in n
  variables (PadicFamilies L2).

*Construction and proof.*
- Transfer to definite unitary groups G₂ and G_n over a CM field (Theorem 2.24): the map σ_n ∘
  i₂ sends E₂ into E_n near z₂ when an infinitesimal R = T holds.
- The R = T theorem follows from vanishing of the adjoint Bloch–Kato Selmer group of Sym^{n−1}
  (Newton–Thorne 2020, cited; Kisin and Bellaïche–Chenevier's method).
- Irreducible components: the locus where the image lies in E_n is Zariski closed and contains
  a neighbourhood of z₂, hence the component.

*Acceptance.*
- Check the ordinary variant: an ordinary refinement is automatically numerically non-critical,
  and Hida families replace eigencurve components.

*Depends on:* `ML.3/symmetric-power-lifting`, `ML.3/accessible-regular-refinement`,
`PadicFamilies:L2`, `AutomorphicGaloisRepresentationsPartII:AG2.3`,
`PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation`.

*Source.*
- newton-thorne-I, §2, Theorem 2.33, pp. 50–51 (arXiv v3) — Theorem 2.33 (with Theorem 2.24 on p. 40).

#### `ML.3/buzzard-kilford-eigencurve` — The tame-level-one 2-adic eigencurve near the boundary (Buzzard–Kilford)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.buzzardKilford` in `TauCeti/NumberTheory/SymmetricPower/Eigenvariety`.

For p = 2 and N = 1, E₀ lies over the component W₀⁺ (χ(−1) = 1) of weight space, and w = χ_u(5)
− 1 identifies W₀⁺ with {|w| < 1}. Over the annulus W₀(b) = {|8| < |w| < 1}, E₀(b) =
κ^{−1}(W₀(b)) is a disjoint union ⊔_{i≥1}X_i of admissible opens with κ|_{X_i} an isomorphism
onto W₀(b), and on X_i the slope is i·v₂(w).

*Hypotheses.*
- p = 2, tame level 1.

*Construction and proof.*
- Buzzard–Kilford 2005 (explicit overconvergence of U₂ in the boundary region; cited, not
  read).

*Acceptance.*
- Check the consequence used: every irreducible component of E₀ meets κ^{−1}(W₀(b)), so it
  contains some X_i.

*Depends on:* `PadicFamilies:L2`.

*Source.*
- newton-thorne-I, §3, Theorem 3.2, pp. 53–54 (arXiv v3) — Theorem 3.2, quoting Buzzard–Kilford.

#### `ML.3/level-one-ping-pong` — Symmetric powers for one level-one form give them for all (NT I Theorem 3.1 = Theorem D)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.symPower_levelOne_propagate` in `TauCeti/NumberTheory/SymmetricPower/LevelOne`.

Fix n ≥ 2. If π₀ is an everywhere unramified cuspidal π of weight k ≥ 2 with Sym^{n−1}r_{π₀,ι}
automorphic for some (equivalently any) p and ι, then Sym^{n−1}r_{π,ι} is automorphic for every
everywhere unramified cuspidal π of weight ≥ 2.

*Hypotheses.*
- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic
  newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois
  representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

*Construction and proof.*
- Work on the 2-adic tame-level-1 eigencurve E₀ (all points share the trivial residual
  representation).
- By eigenvariety-propagation, automorphy of Sym^{n−1} is constant on components; each
  component contains some annulus X_i (buzzard-kilford-eigencurve).
- Ping pong: a level-one f of weight k gives the two points (f, α), (f, β) on X_i, X_{i′} with
  i + i′ = (k − 1)/v₂(w(κ)); alternating swaps (f′, α′) ↔ (f′, β′) with moves inside annuli
  reach every X_i from a well-chosen starting point (classical points ramified at 2 are used to
  reach the boundary annulus).

*Acceptance.*
- Check the key numerical identity v₂(α) + v₂(β) = k − 1 for the two roots of X² − a₂X +
  2^{k−1}, which gives i + i′ = (k − 1)/v₂(w).

*Depends on:* `ML.3/eigenvariety-propagation`, `ML.3/buzzard-kilford-eigencurve`,
`ML.3/symmetric-power-lifting`.

*Source.*
- newton-thorne-I, §3, Theorem 3.1, p. 53; Introduction pp. 3–4 (arXiv v3) — Theorem 3.1 (Theorem D) and the ping-pong strategy.

#### `ML.3/steinberg-level-raising` — Level raising to Steinberg for symmetric powers of theta series (NT I Theorems 4.1, 6.1, 7.1)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.exists_steinberg_levelRaising` in `TauCeti/NumberTheory/SymmetricPower/LevelRaising`.

Let n ≥ 3, p ≡ 1 (mod 48·n!), q ≠ p, X₀ a finite set of places of K prime to 2pq and ω a de
Rham character with ωω^c = ε³, unramified on X₀. Then there is a soluble CM F/K, X₀-split, and
a RACSDC ι-ordinary Π on GL_n(𝔸_F) with r_{Π,ι} ≅ ω^{n−1}|_{G_F} ⊗ Sym^{n−1}r_{σ₀,ι}|_{G_F},
the same Hodge–Tate numbers, and Π_v an unramified twist of Steinberg at some v | q (Theorem
7.1; proved here for n odd, Proposition 7.4; for n even via Anastassiades–Thorne).

*Hypotheses.*
- σ₀ a theta series congruent to the chosen level-one form (NT I §7); K an imaginary quadratic
  field.

*Construction and proof.*
- Theorem 4.1: automorphic level raising with depth-zero types for unitary groups (for n = 3:
  the cuspidal unipotent representation of U₃(q) stays irreducible mod p when q is a primitive
  6th root of unity mod p, Proposition 1.15).
- Theorem 6.1: a Steinberg local component via the "R_p = T_p" theorem of Allen–Newton–Thorne
  for residually reducible representations, using reducible-deformation-finiteness.
- Proposition 7.4 assembles these for odd n; Anastassiades–Thorne 2021 passes from Sym^{n−1} to
  Sym^{2n−1} (cited).

*Acceptance.*
- Check the arithmetic condition p ≡ 1 (mod 48·n!) on a small case: for n = 3, 48·3! = 288 and
  p = 577 is a prime ≡ 1 (mod 288) (suggested file).

*Depends on:* `PotentialAutomorphyInfrastructurePartII:PL.7/sum-of-characters-finiteness`,
`ML.3/symmetric-power-lifting`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

*Source.*
- newton-thorne-I, §7, Theorem 7.1, p. 82; §4 Theorem 4.1, p. 59; §6 Theorem 6.1, p. 75 (arXiv
  v3) — The level-raising results and their assembly.

#### `ML.3/one-level-one-symmetric-power` — One level-one form with automorphic Sym^{n−1} (NT I Theorem 7.6 = Theorem E)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.exists_levelOne_symPower` in `TauCeti/NumberTheory/SymmetricPower/LevelOne`.

For every n ≥ 3 there is a cuspidal, everywhere unramified π of GL₂(𝔸_ℚ) of weight k ≥ 2 such
that Sym^{n−1}r_{π,ι} is automorphic for every ι.

*Hypotheses.*
- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic
  newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois
  representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

*Construction and proof.*
- Choose a level-one form f congruent mod p to a theta series (r̄_{f,ι} ≅ Ind_{G_K}^{G_ℚ}ψ̄),
  so Sym^{n−1}r̄ restricted to G_K is a sum of characters, residually automorphic by the
  endoscopic classification (ML.4).
- steinberg-level-raising provides a residually matching automorphic Π with a Steinberg
  component; the Allen–Newton–Thorne / Thorne automorphy lifting theorem for residually
  reducible representations (requiring a Steinberg component) makes Sym^{n−1}r_{f,ι}|_{G_F}
  automorphic; soluble descent.

*Acceptance.*
- Check that the strategy uses small residual image and large p, in contrast to Clozel–Thorne's
  large image and small p.

*Depends on:* `ML.3/steinberg-level-raising`, `ML.3/symmetric-power-lifting`,
`PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`,
`PotentialAutomorphyInfrastructurePartII:PL.0/automorphy-under-twist`,
`PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`.

*Source.*
- newton-thorne-I, §7, Theorem 7.6, p. 89; Introduction p. 4 (arXiv v3) — Theorem 7.6 (Theorem E) and the theta-series
  strategy.

#### `ML.3/level-one-symmetric-powers` — Symmetric power functoriality in level one (NT I Theorem 7.7 = Theorem A) ★

*Kind:* theorem. *Planet:* Symmetric power functoriality in level one.
*Declaration:* `TauCeti.SymmetricPower.symPower_levelOne` in `TauCeti/NumberTheory/SymmetricPower/LevelOne`.

For every n ≥ 2 and every regular algebraic cuspidal automorphic representation π of GL₂(𝔸_ℚ)
of level 1, Sym^{n−1}π exists as a regular algebraic cuspidal automorphic representation of
GL_n(𝔸_ℚ).

*Hypotheses.*
- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic
  newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois
  representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
- π everywhere unramified.

*Construction and proof.*
- n = 2 is trivial; for n ≥ 3 combine one-level-one-symmetric-power with level-one-ping-pong,
  then symmetric-power-lifting (Galois criterion).

*Acceptance.*
- Check on Δ (weight 12, level 1): Sym^{n−1}Δ exists for every n, so L(Sym^{n−1}Δ, s) is
  entire.

*Depends on:* `ML.3/one-level-one-symmetric-power`, `ML.3/level-one-ping-pong`,
`ML.3/symmetric-power-lifting`.

*Source.*
- newton-thorne-I, Introduction, Theorem A, p. 2; §7, Theorem 7.7, p. 90 (arXiv v3) — Theorem A and its proof as Theorem 7.7.

#### `ML.3/n-regular-congruences` — Congruences to n-regular forms (NT I Proposition 8.3)

*Kind:* lemma.
*Declaration:* `TauCeti.SymmetricPower.exists_nRegular_congruence` in `TauCeti/NumberTheory/SymmetricPower/HigherLevel`.

Let π be non-CM of weight k ≥ 2 with π_l non-supercuspidal for every l. Then there are a prime
p > max(2(n + 1), (n − 1)k), ι, and π′ of weight k with r̄_{π,ι}(G_ℚ) ⊇ a conjugate of
SL₂(F_p), π_p and π′_p unramified, r̄_{π,ι} ≅ r̄_{π′,ι}, and π′_l non-supercuspidal with all
accessible refinements n-regular wherever π′_l is ramified.

*Hypotheses.*
- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic
  newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois
  representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

*Construction and proof.*
- Choose p with large residual image (Ribet); change the level at each ramified l by level
  raising/lowering to reach n-regular refinements (NT I §8, not decomposed).

*Acceptance.*
- Check the numerical bound p > (n − 1)k: it keeps Sym^{n−1} of the residual representation in
  the Fontaine–Laffaille range.

*Depends on:* `ML.3/accessible-regular-refinement`, `ML.3/symmetric-power-lifting`.

*Source.*
- newton-thorne-I, §8, Proposition 8.3, pp. 92–93 (arXiv v3) — Proposition 8.3.

#### `ML.3/non-supercuspidal-symmetric-powers` — Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.symPower_of_not_supercuspidal` in `TauCeti/NumberTheory/SymmetricPower/HigherLevel`.

Let π be a non-CM regular algebraic cuspidal π of GL₂(𝔸_ℚ) such that π_l has nonzero Jacquet
module for every prime l. Then for every n ≥ 3, Sym^{n−1}r_{π,ι} is automorphic, so Sym^{n−1}π
exists. In particular (Corollary C) for a semistable elliptic curve E/ℚ the completed Λ(Sym^nE,
s) is entire.

*Hypotheses.*
- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic
  newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois
  representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

*Construction and proof.*
- Proposition 8.2 (all ramified refinements n-regular) by induction on the number of ramified
  primes, "killing ramification" along l-adic eigencurves (eigenvariety-propagation) down to
  level one (level-one-symmetric-powers).
- General π: n-regular-congruences gives π′ satisfying 8.2 with r̄_{π,ι} ≅ r̄_{π′,ι} and large
  image; pd-automorphy-lifting (BLGGT Theorem 4.2.1) transfers automorphy of Sym^{n−1}r_{π′,ι}
  to Sym^{n−1}r_{π,ι}.
- Corollary C: semistable E is modular (BCDT, Wiles) with Γ₀(N), N squarefree, so every π_l is
  unramified or Steinberg; Λ(Π, s) is entire for cuspidal Π (Godement–Jacquet, AL.2).

*Acceptance.*
- Check that Γ₀(N) with N squarefree gives only unramified or Steinberg π_l, never
  supercuspidal.

*Depends on:* `ML.3/n-regular-congruences`, `ML.3/eigenvariety-propagation`,
`ML.3/level-one-symmetric-powers`,
`PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`,
`ML.3/symmetric-power-lifting`, `AutomorphicLFunctionsAndLocalFactors:AL.2`.

*Source.*
- newton-thorne-I, §8, Theorem 8.1, p. 91; Introduction, Theorem B and Corollary C, p. 2 (arXiv
  v3) — Theorem 8.1 (Theorem B) and Corollary C.

#### `ML.3/symmetric-power-automorphy-lifting` — Automorphy lifting for symmetric powers (NT II Theorem 2.1)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.symPower_lifting` in `TauCeti/NumberTheory/SymmetricPower/Lifting`.

Let π, π′ be regular algebraic cuspidal on GL₂(𝔸_F), F totally real, such that π′ has weight 2
and is non-CM, r_{π′,ι}|_{G_{F_v}} is not ordinary for v | p, r̄_{π′,ι} ≅ r̄_{π,ι}, π_v is a
twist of Steinberg iff π′_v is (v ∤ p), and Sym^{n−1}r_{π′,ι} is automorphic. Then
Sym^{n−1}r_{π,ι} is automorphic. No irreducibility of Sym^{n−1}r̄ is required (p ≤ n allowed).

*Hypotheses.*
- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic
  newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois
  representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.
- F totally real.

*Construction and proof.*
- Reduce by soluble base change to conditions (6)–(11) of NT II p. 6, and pass to Π = π_K over
  a CM quadratic K.
- Patch the map P → R from the pseudodeformation ring P of Sym^{n−1}r̄ to the deformation ring
  R of r̄: P_∞ → R_∞, with R_∞ a domain acting faithfully on patched rank-2 forms (Kisin).
- Newton–Thorne 2020: Spec P is regular of dimension 0 at the pseudocharacter of
  Sym^{n−1}r_{π′,ι}, hence Spec P_∞ is regular there; so Spec R_∞ maps into the support of
  patched rank-n forms.

*Acceptance.*
- Check that the theorem avoids killing the dual Selmer group of Sym^{n−1}r̄, which fails when
  p ≤ n.

*Depends on:* `ML.3/symmetric-power-lifting`,
`PotentialAutomorphyInfrastructurePartII:PL.4/minimal-automorphy-lifting`,
`GlobalGaloisDeformations:G7/polarized-representability`.

*Source.*
- newton-thorne-II, §2, Theorem 2.1 and proof, pp. 5–6 (arXiv v2) — Theorem 2.1, the preliminary reductions and the
  patching argument sketched on pp. 2–3.

#### `ML.3/non-cm-symmetric-powers` — Symmetric power functoriality for all non-CM modular forms (NT II Theorem A, Corollary B) ★

*Kind:* theorem. *Planet:* Symmetric power functoriality for non-CM forms.
*Declaration:* `TauCeti.SymmetricPower.symPower_nonCM` in `TauCeti/NumberTheory/SymmetricPower/Lifting`.

Let π be a regular algebraic, cuspidal, non-CM automorphic representation of GL₂(𝔸_ℚ). Then for
every n ≥ 1, Sym^nπ exists as a regular algebraic cuspidal automorphic representation of
GL_{n+1}(𝔸_ℚ). In particular (Corollary B), for every elliptic curve E/ℚ without CM and n ≥ 2,
Λ(Sym^nE, s) is entire.

*Hypotheses.*
- π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic
  newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois
  representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

*Construction and proof.*
- Induction on #sc(π), the primes where π_p is supercuspidal; sc(π) = ∅ is
  non-supercuspidal-symmetric-powers.
- Killing ramification: a "seasoned" good-dihedral π′ (with an auxiliary Steinberg prime r so
  that r_{π′,ι_q} has large image) congruent to π with sc(π′) = sc(π) ∖ {p};
  symmetric-power-automorphy-lifting transfers automorphy (NT II Theorem 3.1, Propositions
  3.7–3.11).
- Corollary B: modularity of elliptic curves over ℚ (BCDT) and Godement–Jacquet.

*Acceptance.*
- Check the scope: CM forms and weight-one forms are excluded here and handled by
  cm-and-weight-one-symmetric-powers.

*Depends on:* `ML.3/non-supercuspidal-symmetric-powers`,
`ML.3/symmetric-power-automorphy-lifting`, `ML.3/symmetric-power-lifting`,
`AutomorphicLFunctionsAndLocalFactors:AL.2`.

*Source.*
- newton-thorne-II, Introduction, Theorem A and Corollary B, pp. 1–2; §3, Theorem 3.1, p. 20
  (arXiv v2) — Theorem A (Theorem 3.1) and
  Corollary B.

#### `ML.3/cm-and-weight-one-symmetric-powers` — Symmetric powers of CM and weight-one forms (NT II Theorem A.1)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.symPower_CM_weightOne` in `TauCeti/NumberTheory/SymmetricPower/Lifting`.

Let π be cuspidal on GL₂(𝔸_ℚ) with π_∞ a holomorphic limit of discrete series, or π the
automorphic induction of a Hecke character of a quadratic field. Then Sym^nπ exists for every n
≥ 1 (usually not cuspidal).

*Hypotheses.*
- π as stated.

*Construction and proof.*
- CM case: Sym^n of an induced representation decomposes into inductions of characters and
  characters.
- Weight one: the Artin image is dihedral, tetrahedral, octahedral or icosahedral; the
  icosahedral case uses Kim–Shahidi tensor-product and symmetric-power functoriality (Kim 2004,
  Theorem 6.4; cited).

*Acceptance.*
- Check the CM decomposition for n = 2 (symmetric-power-lifting test cm_not_cuspidal).

*Depends on:* `ML.3/symmetric-power-lifting`, `GL2AutomorphicRepresentationsAndTransfer:R17.5`.

*Source.*
- newton-thorne-II, Appendix A, Theorem A.1, p. 27 (arXiv v2) — Theorem A.1.

#### `ML.3/l-function-equidistribution-criterion` — Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.equidistributed_of_lFunctions` in `TauCeti/NumberTheory/SymmetricPower/SatoTate`.

Let K be a compact group with conjugacy-class space X, x_i ∈ X with norms N(x_i) ≥ 2, such that
∏(1 − N(x_i)^{−s})^{−1} converges for Re s > 1 and continues to a neighbourhood of Re s ≥ 1
with no zeros or poles except a simple pole at 1, and for each irreducible ρ, L(s, ρ) = ∏ det(1
− ρ(x_i)N(x_i)^{−s})^{−1} continues likewise with no zeros or poles on Re s ≥ 1 except possibly
at 1. Then #{i : N(x_i) ≤ n} ~ n/log n, Σ_{N(x_i)≤n}χ(x_i) = c(χ)n/log n + o(n/log n) with
−c(χ) the order of vanishing of L(s, ρ) at 1; if at most boundedly many x_i share a norm, the
x_i are Haar-equidistributed iff c(χ) = 0 for every nontrivial irreducible χ (Peter–Weyl/Weyl
criterion).

*Hypotheses.*
- K a compact group (a compact Lie group in the application); ρ irreducible continuous
  representations.

*Construction and proof.*
- Prime-number-theorem argument for each L(s, ρ): logarithmic derivative, Wiener–Ikehara
  (AnalyticNumberTheory AN.2), Kedlaya Theorem 24.2.
- Peter–Weyl: finite linear combinations of irreducible characters are dense in the continuous
  class functions; orthogonality gives the integrals.

*Acceptance.*
- Check the Chebotarev instance: K finite, ρ irreducible, recovering Kedlaya §22.5.

*Depends on:* `AnalyticNumberTheory:AN.2`.

*Source.*
- kedlaya-ant-2025, §§24.1–24.3, Theorem 24.1, Theorem 24.2 and Conjecture 24.3, printed pp.
  133–134 — The equidistribution formalism
  (Conjecture 24.3 as printed is the criterion; see ModularityAndLanglandsExtensions/E6).

#### `ML.3/sato-tate-elliptic-curves` — The Sato–Tate theorem for elliptic curves over ℚ ★

*Kind:* theorem. *Planet:* Sato–Tate for elliptic curves over ℚ.
*Declaration:* `TauCeti.SymmetricPower.satoTate_elliptic` in `TauCeti/NumberTheory/SymmetricPower/SatoTate`.

Let E/ℚ be an elliptic curve without complex multiplication, and for good p let α_p be the root
of X² − a_pX + p with nonnegative imaginary part and θ_p = arg(α_p/√p) ∈ [0, π]. Then (θ_p) is
equidistributed for (2/π)sin²θ dθ, the push-forward of Haar measure on SU(2).

*Hypotheses.*
- E/ℚ non-CM (End E = ℤ).

*Construction and proof.*
- K = SU(2): classes are diag(e^{iθ}, e^{−iθ}), Haar measure is the Sato–Tate measure, and the
  irreducible representations are the Sym^n (Kedlaya §24.5).
- L(s, Sym^n) = L(Sym^nE, s + n/2) (shift of the abscissa by n/2) is the L-function of the
  cuspidal Sym^nπ_E (non-cm-symmetric-powers), hence entire and nonvanishing on Re s ≥ 1 after
  the shift (Jacquet–Shalika, AL.3); for n ≥ 1 there is no pole, so c(χ) = 0.
- Apply l-function-equidistribution-criterion. (Historically:
  Clozel–Harris–Shepherd-Barron–Taylor for non-integral j via potential automorphy;
  Barnet-Lamb–Geraghty–Harris–Taylor for all non-CM E over totally real fields.)

*Acceptance.*
- Check the Haar-measure computation: the Weyl integration formula for SU(2) gives (2/π)sin²θ
  dθ on [0, π] (suggested file: the normalisation ∫₀^π sin²θ dθ = π/2).
- Check that potential automorphy suffices: meromorphic continuation with no zeros or poles on
  Re s ≥ 1 (ML.2) already gives Sato–Tate; Newton–Thorne's entireness is not needed.

*Depends on:* `ML.3/l-function-equidistribution-criterion`, `ML.3/non-cm-symmetric-powers`,
`AutomorphicLFunctionsAndLocalFactors:AL.3`, `ML.2/compatible-system-l-function-continuation`.

*Source.*
- kedlaya-ant-2025, §§24.4–24.5, Conjecture 24.4 and Theorems 24.5–24.6, printed pp. 134–135:
  “Hence Sato–Tate reduces to the follow” — The Sato–Tate conjecture and its reduction to the
  symmetric power L-functions (with the corrections E4, E5).

#### `ML.3/bcgnt-potential-automorphy-det-cyclotomic` — Purity and potential automorphy of symmetric powers when det r_λ = ε^{−m} (BCGNT Theorem 6.2.1)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.bcgnt_detCyclotomic` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of
rank 2 of G_F with H_τ = {0, m} (m ≥ 1) and det r_λ = ε^{−m}. Then R is pure of weight m, and
for each n ≥ 1 there is a finite CM extension F_n/F, Galois over ℚ, such that
Sym^{n−1}R|_{G_{F_n}} is automorphic. For m = 1 the argument simplifies to ACC+ Corollary
7.1.12 (Remark 6.2.2).

*Hypotheses.*
- As stated.

*Construction and proof.*
- Purity: ML.3/purity-from-symmetric-powers applied with
  ML.2/potential-weak-automorphy-symmetric-powers.
- Automorphy (not only weak automorphy): once R is pure, the residual images are large for
  density-one primes and the ACC+ lifting theorems (PotentialAutomorphyInfrastructure PA.4)
  upgrade weak automorphy.

*Acceptance.*
- The heart of BCGNT's Theorem C.

*Depends on:* `ML.2/potential-weak-automorphy-symmetric-powers`,
`PotentialAutomorphyInfrastructure:PA.4`,
`PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`.

*Source.*
- bcgnt-2025, Theorem 6.2.1 and proof, Remark 6.2.2, §6.2, arXiv v3 pp. 59–60 (published p.
  53); ACC+ inputs also in the proof of Theorem 7.1.1, arXiv p. 69 (published p. 61) — BCGNT
  Theorem 6.2.1 and Remark 6.2.2.

#### `ML.3/one-prime-criterion` — One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.onePrime` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be totally real and π a non-CM RAESDC automorphic representation of GL₂(𝔸_F) (π ≇ π ⊗ (χ
∘ det) for every non-trivial Hecke character χ), and n ≥ 1. The following are equivalent: (1)
there is a cuspidal Π of GL_n(𝔸_F) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) for every place v; (2)
for every prime p and ι : Q̄_p ≅ ℂ, Sym^{n−1} r_{π,ι} is automorphic; (3) for some p and ι,
Sym^{n−1} r_{π,ι} is automorphic (ML.0/nt26-automorphy-predicate).

*Hypotheses.*
- F totally real; π non-CM RAESDC.

*Construction and proof.*
- (3) ⇒ (1): Sym^{n−1} r_{π,ι} ≅ r_{Π,ι} for a RAESDC Π; local–global compatibility at every
  finite place (Caraiani) and the archimedean weights give rec(Π_v) ≅ Sym^{n−1} rec(π_v); Π
  cuspidal since Sym^{n−1} r_{π,ι} is irreducible (non-CM, Ribet's open image).
- (1) ⇒ (2): Π is RAESDC; r_{Π,ι} ≅ Sym^{n−1} r_{π,ι} by Chebotarev.

*Acceptance.*
- Reduces symmetric power functoriality to automorphy of a single Galois representation.

*Depends on:* `ML.0/nt26-automorphy-predicate`, `ML.3/symmetric-power-lift-over-number-fields`,
`AutomorphicGaloisRepresentationsPartII:AG2.2`,
`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

*Source.*
- nt-2026, Lemma 2.1, §2, p. 9; proof pp. 9–10 (arXiv v2) — Newton–Thorne Lemma
  2.1.

#### `ML.3/clozel-thorne-reductions` — Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.clozelThorne_reductions` in `TauCeti/NumberTheory/SymmetricPower`.

(Newton–Thorne Proposition 6.1) Let F be totally real, π a non-CM RAESDC representation of
GL₂(𝔸_F), p ≥ 5 prime and 0 < r < p. There are a soluble totally real E/F, ι : Q̄_p ≅ ℂ and a
RAESDC π′ of GL₂(𝔸_E) of weight 0 with: Sym^{p+r−1}r_{π,ι} automorphic iff Sym^{p+r−1}r_{π′,ι}
is; π′_v an unramified twist of Steinberg for v | p; det r_{π′,ι} = ε^{−1}; a place v₀ with
q_{v₀} ≡ −1 mod p and π′_{v₀} tamely dihedral of order p; a place v₁ with q_{v₁} ≡ 1 mod p and
π′_{v₁} Steinberg; and the potential-diagonalisability conditions. (Clozel–Thorne) Theorem 7.1
reduces the mixed-parity case to the RAESDC case, Lemma 7.4 twists π_E to a RACSDC
representation over a CM extension, and Proposition 7.6 deduces symmetric powers over a CM
field from those over its maximal totally real subfield (using an odd extension R̄ of r̄_ι(Π) ⊗
φ); and, for π with discrete series at infinity, 'not CM-induced' is equivalent to 'Sym²π
cuspidal'.

*Hypotheses.*
- As in the cited statements; corrections recorded in the CT17 and NT26 extractions applied.

*Construction and proof.*
- Soluble base change and descent (EndoscopicTransferAndUnitaryTraceComparison ET.7a;
  PotentialAutomorphyInfrastructurePartII PL.0/soluble-descent); BLGGT Theorem 4.2.1
  (PL.5/pd-automorphy-lifting) and Theorems 4.4.1, 5.5.2 (ML.2/change-of-weight-and-level,
  ML.2/irreducibility-density-one).
- Moret-Bailly to realise the local conditions at v₀, v₁ over a soluble extension.

*Acceptance.*
- Every symmetric-power endpoint over totally real or CM fields uses one of these reductions.

*Depends on:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`,
`PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent`,
`PotentialAutomorphyInfrastructurePartII:PL.5/pd-automorphy-lifting`,
`ML.2/change-of-weight-and-level`, `ML.2/irreducibility-density-one`,
`ML.3/one-prime-criterion`.

*Source.*
- nt-2026, Proposition 6.1, §6, pp. 45–46; proof pp. 46–49 (arXiv v2); also proof of Theorem
  6.5, p. 50 — Newton–Thorne Proposition 6.1.
- ct-2017, §7, Lemma 7.4, manuscript p. 47 — Clozel–Thorne Lemma
  7.4.
- ct-2017, §7, Proposition 7.6 and proof, manuscript p. 49 — Clozel–Thorne Proposition 7.6.

#### `ML.3/all-regular-symmetric-powers` — Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.sp_all` in `TauCeti/NumberTheory/SymmetricPower`.

SP_n holds for all n ≥ 2: for every totally real F and every non-CM cuspidal regular algebraic
π of GL₂(𝔸_F), Sym^{n−1}π exists as a RAESDC automorphic representation of GL_n(𝔸_F), in each
of the senses of ML.3/one-prime-criterion.

*Hypotheses.*
- F totally real; π non-CM, cuspidal, regular algebraic.

*Construction and proof.*
- Induction on n ≥ 6, with the cases n ≤ 5 known (ML.3/low-rank-symmetric-powers).
- Write n = p + r with p ≥ 5 prime and 0 < r < p (Bertrand); Proposition 6.1
  (ML.3/clozel-thorne-reductions) reduces to π′ with the local conditions; Newton–Thorne's
  level-raising and tensor-product theorems (§§3–5; owners: the proposed Part IIs
  SymmetricPowersByUnitaryLevelRaising and SymmetricPowersByTensorFunctorialityLifting,
  recorded as a gap) give automorphy of Sym^{p+r−1}r_{π′,ι} from SP_p, SP_r and SP_{p−r}.

*Acceptance.*
- SP_6 recovers Clozel–Thorne's Sym⁵ without their disjointness hypothesis.

*Depends on:* `ML.3/sp-statement`, `ML.3/low-rank-symmetric-powers`,
`ML.3/clozel-thorne-reductions`, `ML.3/one-prime-criterion`.

*Source.*
- nt-2026, Theorem 6.4 and its proof, §6, p. 50 (arXiv v2) — Newton–Thorne Theorem 6.4.

#### `ML.3/hilbert-symmetric-powers` — Symmetric power functoriality for Hilbert modular forms (Newton–Thorne, Theorem A = Theorem 6.5(1)) ★

*Kind:* theorem. *Planet:* Symmetric powers of Hilbert modular forms.
*Declaration:* `TauCeti.SymmetricPower.hilbert` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be totally real and π a cuspidal automorphic representation of GL₂(𝔸_F) without CM such
that π_∞ is essentially square-integrable (each π_v, v | ∞, a twist of a discrete series of
weight k_v ≥ 2; the parity of k_v may vary). Then for every n ≥ 2 there is a cuspidal
automorphic representation Π_n of GL_n(𝔸_F) with rec(Π_{n,v}) ≅ Sym^{n−1} ∘ rec(π_v) at every
place v. These π are those of cuspidal non-CM Hilbert modular forms of weights k_v ≥ 2.

*Hypotheses.*
- F totally real; π non-CM with discrete-series archimedean components (mixed parity allowed).

*Construction and proof.*
- Same parity: π is regular algebraic up to twist; ML.3/all-regular-symmetric-powers.
- Mixed parity: Clozel–Thorne Theorem 7.1 reduces to the RAESDC case over a CM extension
  (ML.3/clozel-thorne-reductions).

*Acceptance.*
- For F = ℚ it recovers Newton–Thorne II Theorem A (ML.3/non-cm-symmetric-powers).

*Depends on:* `ML.3/all-regular-symmetric-powers`, `ML.3/clozel-thorne-reductions`,
`AutomorphicGaloisRepresentations:R19.2`.

*Source.*
- nt-2026, Theorem A, §1, p. 1 = Theorem 6.5(1), §6, p. 50 (arXiv v2) — Newton–Thorne Theorem A = Theorem 6.5(1).

#### `ML.3/cm-field-symmetric-powers` — Symmetric powers of conjugate self-dual GL₂ representations over CM fields (Newton–Thorne, Theorem 6.5(2))

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.cmField` in `TauCeti/NumberTheory/SymmetricPower`.

Let E be a CM field and π a RAECSDC automorphic representation of GL₂(𝔸_E) not automorphically
induced from a quadratic extension. Then for every n ≥ 2 Sym^{n−1}π exists: there is a cuspidal
Π_n of GL_n(𝔸_E) with rec(Π_{n,w}) ≅ Sym^{n−1} ∘ rec(π_w) for every place w.

*Hypotheses.*
- E CM; π RAECSDC, not dihedral.

*Construction and proof.*
- Clozel–Thorne Proposition 7.6: descend to the maximal totally real subfield via an auxiliary
  character and an odd extension, apply ML.3/all-regular-symmetric-powers there, and base
  change back (ML.3/clozel-thorne-reductions).

*Acceptance.*
- Over an imaginary quadratic field this covers conjugate self-dual Bianchi forms, not general
  Bianchi forms (ML.3/bianchi-sato-tate covers those up to potential automorphy).

*Depends on:* `ML.3/all-regular-symmetric-powers`, `ML.3/clozel-thorne-reductions`,
`EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

*Source.*
- nt-2026, Theorem 6.5(2) and its proof, §6, p. 50 (arXiv v2) — Newton–Thorne Theorem
  6.5(2).

#### `ML.3/sym6-sym8` — Sixth and eighth symmetric powers over totally real fields (Clozel–Thorne, Theorem 6.1)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.sym6_sym8` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be totally real and (π, χ) a RAESDC automorphic representation of GL₂(𝔸_F) not
automorphically induced from a quadratic CM extension. (1) If F ∩ ℚ(ζ₅) = ℚ, Sym⁶π exists as a
cuspidal automorphic representation of GL₇(𝔸_F). (2) If F ∩ ℚ(ζ₇) = ℚ, Sym⁸π exists as a
cuspidal automorphic representation of GL₉(𝔸_F). Theorem 6.1 is reduced to Theorem 6.2 (level
raising for Sym^{n−1} of a Steinberg-at-q form) by reference to Clozel–Thorne II §6; the
level-raising method is owned by the proposed Part II SymmetricPowersByUnitaryLevelRaising.

*Hypotheses.*
- F totally real with the stated disjointness; π RAESDC, not CM.

*Construction and proof.*
- Reduction to Theorem 6.2 ([CT15, §6]) and potential automorphy inputs from BLGGT (ML.2) — the
  level-raising method is a gap here.

*Acceptance.*
- Superseded for totally real F by ML.3/all-regular-symmetric-powers, which removes the
  disjointness.

*Depends on:* `ML.3/symmetric-power-lift-over-number-fields`,
`ML.2/potential-automorphy-theorem`, `ML.3/clozel-thorne-reductions`.

*Source.*
- ct-2017, §6, Theorem 6.1 (= Theorem 1.1), manuscript p. 44 (Theorem 1.1 on p. 2) — Clozel–Thorne Theorem 6.1.

#### `ML.3/symmetric-powers-up-to-eight` — Symmetric powers up to eight and holomorphy of L(s, Sym^n π) (Clozel–Thorne, Corollary 7.2)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.upToEight` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be totally real, π cuspidal on GL₂(𝔸_F) with π_∞ essentially square-integrable, not
induced from a quadratic CM extension. Then there is a cuspidal Π on GL_{r+1}(𝔸_F) with Sym^r
rec(π_v) ≅ rec(Π_v) for all finite v in each case: (1) any F, 1 ≤ r ≤ 4; (2) F ∩ ℚ(ζ₅) = ℚ, r ∈
{5, 6}; (3) F ∩ ℚ(ζ₃₅) = ℚ, r = 7; (4) F ∩ ℚ(ζ₇) = ℚ, r = 8. Consequently (Corollary 1.3) L(s,
Sym^n π) is entire with the expected functional equation for n ≤ 8 under the corresponding
disjointness.

*Hypotheses.*
- As stated.

*Construction and proof.*
- (1): ML.3/low-rank-symmetric-powers; (2)–(4): ML.3/sym6-sym8 and the reductions of Theorem
  7.1 (mixed parity).
- Holomorphy: Godement–Jacquet for the cuspidal Π (AutomorphicLFunctionsAndLocalFactors AL.2).

*Acceptance.*
- Superseded by ML.3/hilbert-symmetric-powers, which needs no disjointness.

*Depends on:* `ML.3/sym6-sym8`, `ML.3/low-rank-symmetric-powers`,
`AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`.

*Source.*
- ct-2017, §7, Corollary 7.2, manuscript pp. 46–47 (Corollaries 1.2, 1.3 on p. 2) — Clozel–Thorne Corollary 7.2.

#### `ML.3/large-residual-image-density-one` — Large residual image for a density-one set of primes (Clozel–Thorne, Lemma 7.5)

*Kind:* lemma.
*Declaration:* `TauCeti.SymmetricPower.largeImage` in `TauCeti/NumberTheory/SymmetricPower`.

Let E be an imaginary CM field and π a RACSDC automorphic representation of GL₂(𝔸_E) with Sym²π
cuspidal. Then there is a set L of rational primes of Dirichlet density one such that for all l
∈ L and ι : Q̄_l ≅ ℂ, r̄_ι(π) is irreducible with image containing a conjugate of SL₂(F_l).

*Hypotheses.*
- E imaginary CM; π RACSDC with Sym²π cuspidal.

*Construction and proof.*
- Irreducibility of r_ι(π) for density-one l (ML.2/irreducibility-density-one) and the
  classification of subgroups of GL₂(F_l) (large image unless dihedral/exceptional, excluded by
  Sym²π cuspidal and potential diagonalizability inputs of BLGGT).

*Acceptance.*
- Used for the adequacy hypotheses in Proposition 7.6.

*Depends on:* `ML.2/irreducibility-density-one`,
`PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one`.

*Source.*
- ct-2017, §7, Lemma 7.5 and proof, manuscript p. 48 — Clozel–Thorne
  Lemma 7.5.

#### `ML.3/nt21-semistable-l-functions` — Analytic continuation of symmetric power L-functions of semistable elliptic curves (Newton–Thorne I, Corollary C)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.semistable_entire` in `TauCeti/NumberTheory/SymmetricPower`.

Let E/ℚ be a semistable elliptic curve. Then for every n ≥ 2 the completed symmetric power
L-function Λ(Sym^n E, s) (ML.3/completed-symmetric-power-l-function) admits an analytic
continuation to ℂ.

*Hypotheses.*
- E/ℚ semistable (hence non-CM).

*Construction and proof.*
- Theorem B of Newton–Thorne I (ML.3/non-supercuspidal-symmetric-powers): no local component of
  π_E is supercuspidal.
- Godement–Jacquet for the cuspidal Sym^nπ_E and the comparison of completed L-functions
  (ML.0).

*Acceptance.*
- Superseded by Newton–Thorne II Corollary B (all non-CM E).

*Depends on:* `ML.3/non-supercuspidal-symmetric-powers`,
`ML.3/completed-symmetric-power-l-function`,
`AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`.

*Source.*
- newton-thorne-I, Introduction, Corollary C, arXiv v3 p. 2 (Publ. IHÉS 134, p. 2) — Newton–Thorne I Corollary C.

#### `ML.3/acc-elliptic-symmetric-powers` — Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.acc_ellipticSymPowers` in `TauCeti/NumberTheory/SymmetricPower`.

Let 𝓜 be a finite set of positive integers, E/ℚ a non-CM elliptic curve, 𝓛 a finite set of
primes of good reduction and F^avoid/ℚ finite. There are a finite Galois F₂^avoid/ℚ linearly
disjoint from F^avoid and a finite totally real Galois F^suffices/ℚ unramified above 𝓛 and
linearly disjoint from F^avoid F₂^avoid, such that for every finite totally real F′/F^suffices
linearly disjoint from F₂^avoid and every m ∈ 𝓜 there is a regular algebraic cuspidal
polarizable π of GL_{m+1}(𝔸_{F′}) of weight 0 with Sym^m r_{E,l}^∨|_{G_{F′}} ≅ r_{l,ı}(π)
(ι-ordinary, unramified above 𝓛).

*Hypotheses.*
- As stated; corrections E103–E107 of the ACC+ extraction applied to the proof.

*Construction and proof.*
- ML.2/acc-symplectic-potential-automorphy applied to Sym^m of E[l] twisted by an induced
  character ψ_m of a CM field to make the residual representation symplectic, then
  PotentialAutomorphyInfrastructurePartII PL.5 lifting.

*Acceptance.*
- The seed of Qian's argument (ML.2/elliptic-symmetric-power-seed) and of ACC+ Theorem 7.1.11.

*Depends on:* `ML.2/acc-symplectic-potential-automorphy`,
`PotentialAutomorphyInfrastructurePartII:PL.5`.

*Source.*
- acc-2023, §7.2.1, Corollary 7.2.4, arXiv v2 pp. 205–206 (Annals pp. 1100–1101); proof pp.
  206–208 (Annals pp. 1101–1103) — ACC+ Corollary 7.2.4.

#### `ML.3/acc-purity-rank-two` — Purity and analytic continuation for rank-two systems of weight zero over CM fields (ACC+, Corollary 7.1.13) ★

*Kind:* theorem. *Planet:* Sato–Tate for elliptic curves over CM fields.
*Declaration:* `TauCeti.SymmetricPower.acc_purity` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be a CM field and R an irreducible rank-2 very weakly compatible system of G_F with H_τ =
{0, 1} for all τ, and m ≥ 0. Then (1) R is pure of weight 1; (2) L^S(ı Sym^m R, s) has
meromorphic continuation to ℂ; (3) with Euler factors at v ∈ S of degree ≤ m + 1, Λ(ı Sym^m R,
s) satisfies a functional equation, and L^S(ı Sym^m R, s) is holomorphic and non-vanishing for
Re s ≥ m/2 + 1. In particular elliptic curves over CM fields satisfy Sato–Tate (ACC+ Theorem
1.0.1).

*Hypotheses.*
- F CM; R irreducible of rank 2 with Hodge–Tate numbers {0, 1}.

*Construction and proof.*
- Potential automorphy of all Sym^m R (ACC+ Theorem 7.1.11, Corollary 7.1.12, assembled from
  ML.2/acc-auxiliary-primes and ML.3/acc-elliptic-symmetric-powers).
- Purity: unitary cuspidal π_{ι,m} and the Jacquet–Shalika bound
  (ML.3/purity-from-symmetric-powers).

*Acceptance.*
- Over ℚ this recovers Sato–Tate for elliptic curves (ML.3/sato-tate-elliptic-curves).

*Depends on:* `ML.2/acc-auxiliary-primes`, `ML.3/acc-elliptic-symmetric-powers`,
`ML.3/purity-from-symmetric-powers`, `ML.0/compatible-system-archimedean-factors`.

*Source.*
- acc-2023, §7.1, Corollary 7.1.13, arXiv v2 p. 201 (Annals p. 1096) — ACC+ Corollary 7.1.13.
- acc-2023, §7.1, proof of Corollary 7.1.13, arXiv v2 p. 202 (Annals p. 1097) — ACC+: the Jacquet–Shalika bound in
  the proof.

#### `ML.3/purity-from-symmetric-powers` — Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.purity_of_symPowers` in `TauCeti/NumberTheory/SymmetricPower`.

Let R be a very weakly compatible system of rank 2 of G_F with H_τ = {0, m} for all τ, and v₀ ∉
S a finite place. If for infinitely many n ≥ 1 there is a finite Galois F_n/F such that
Sym^{n−1}R|_{F_n} is weakly automorphic of level prime to the places above v₀, then the roots
α₁, α₂ of Q_{v₀}(X) satisfy |ια_i|² = q_{v₀}^m for every ι.

*Hypotheses.*
- As stated.

*Construction and proof.*
- Jacquet–Shalika bound for the unitary cuspidal constituents of the weakly automorphic
  Sym^{n−1}R|_{F_n} at places above v₀ (AutomorphicLFunctionsAndLocalFactors
  AL.2/jacquet-shalika-satake-bound): |α|^{n−1} ≤ q^{(n−1)m/2 + 1/2} for infinitely many n,
  hence |α|² = q^m (using det).

*Acceptance.*
- The mechanism of ML.5/symmetric-power-functoriality-implies-ramanujan in the potential
  setting.

*Depends on:* `AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound`,
`PotentialModularityAndCompatibleSystems:R24.5:operations`.

*Source.*
- bcgnt-2025, Lemma 6.1.3 and proof (Jacquet–Shalika bound [JS81, Cor. 2.5]), §6.1, arXiv v3 p.
  58 (published p. 52; arXiv pagination differs) — BCGNT Lemma 6.1.3.

#### `ML.3/bcgnt-symmetric-powers-purity` — Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.bcgnt_theoremC` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be a CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F
with H_τ = {0, m}, m ≥ 1. Then R is pure of weight m and for each n ≥ 1 there is a finite CM
F′/F, Galois over ℚ, with Sym^{n−1}R|_{G_{F′}} automorphic. If R is irreducible but not
strongly irreducible, R is pure of weight m and each Sym^{n−1}R is a direct sum of automorphic
compatible systems of dimension ≤ 2.

*Hypotheses.*
- F CM; R as stated.

*Construction and proof.*
- Twist to det = ε^{−m} and apply ML.3/bcgnt-potential-automorphy-det-cyclotomic; the induced
  case by automorphic induction (EndoscopicTransferAndUnitaryTraceComparison ET.7a).

*Acceptance.*
- Theorem C of BCGNT.

*Depends on:* `ML.3/bcgnt-potential-automorphy-det-cyclotomic`,
`EndoscopicTransferAndUnitaryTraceComparison:ET.7a`.

*Source.*
- bcgnt-2025, Theorem 7.2.1 and proof, §7.2, arXiv v3 p. 69 (published pp. 61–62); Theorem C,
  §1, arXiv p. 4 (published p. 4) — BCGNT
  Theorem 7.2.1.

#### `ML.3/bianchi-ramanujan` — The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1) ★

*Kind:* theorem. *Planet:* Ramanujan conjecture for Bianchi modular forms.
*Declaration:* `TauCeti.SymmetricPower.bianchi_ramanujan` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be an imaginary CM field and π a regular algebraic cuspidal automorphic representation of
GL₂(𝔸_F) of parallel weight. Then π_v is (essentially) tempered at every finite place v; for v
prime to the level and parallel weight k ≥ 2, the Satake parameters in the classical
normalisation (the eigenvalues α_v, β_v of rec^T(π_v)(Frob_v) = rec(π_v ⊗
|det|^{−1/2})(Frob_v)) satisfy |α_v| = |β_v| = N(v)^{(k−1)/2}; equivalently q_v^{−w/2}
rec(π_v)(Frob_v) is unitary, w = k − 2 (the normalisation of ML.3/sato-tate-group).

*Hypotheses.*
- F imaginary CM; π cuspidal regular algebraic of parallel weight.

*Construction and proof.*
- The compatible system R_π (AutomorphicGaloisRepresentationsPartII AG2.2;
  Harris–Lan–Taylor–Thorne, Scholze) has H_τ = {0, m} by parallel weight;
  ML.3/bcgnt-symmetric-powers-purity gives purity of R_π at unramified v, i.e. Ramanujan;
  temperedness at ramified v from Varma's local–global compatibility (AG2.5).

*Acceptance.*
- Weight 2 recovers ACC+ Theorem 1.0.2.

*Depends on:* `ML.3/bcgnt-symmetric-powers-purity`, `ML.3/parallel-weight-and-clozel-purity`,
`AutomorphicGaloisRepresentationsPartII:AG2.2`, `AutomorphicGaloisRepresentationsPartII:AG2.5`.

*Source.*
- bcgnt-2025, Theorem 7.1.1 and proof, §7.1, arXiv v3 pp. 68–69 (published p. 61); Theorem A,
  §1, arXiv p. 3 (published p. 3) — BCGNT Theorem 7.1.1 and
  Theorem A.

#### `ML.3/serre-equidistribution-criterion` — Serre's equidistribution criterion through L-functions of representations of ST(π)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.serre_criterion` in `TauCeti/NumberTheory/SymmetricPower`.

Let ST be a compact group and ([π_v])_{v ∉ S} conjugacy classes indexed by the finite places.
For an irreducible representation ρ of ST put L^S(π, ρ, s) = ∏_{v ∉ S} det(1 −
q_v^{−s}ρ([π_v]))^{−1}, absolutely convergent for Re s > 1. If for every non-trivial
irreducible ρ, L^S(π, ρ, s) has meromorphic continuation to ℂ, holomorphic and non-vanishing on
Re s = 1, then the [π_v] are equidistributed for the Haar probability measure of ST (Serre, Ch.
I, Appendix). This is the general form of ML.3/l-function-equidistribution-criterion.

*Hypotheses.*
- ST compact; L-functions as stated.

*Construction and proof.*
- Peter–Weyl: characters of irreducible representations span the conjugation-invariant
  continuous functions (Tau Ceti CompactGroups layers 5–6).
- Wiener–Ikehara/Tauberian theorem for each L^S(π, ρ, s) (AnalyticNumberTheory AN.2).

*Acceptance.*
- For ST = SU(2) and ρ = Sym^n it is ML.3/l-function-equidistribution-criterion.

*Depends on:* `ML.3/l-function-equidistribution-criterion`, `AnalyticNumberTheory:AN.2`,
`tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`,
`tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-6-characters-of-compact-groups`.

*Source.*
- bcgnt-2025, Proof of Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62; arXiv pagination
  differs) — BCGNT proof of Theorem 7.2.3:
  Serre's criterion.

#### `ML.3/bianchi-sato-tate` — The Sato–Tate conjecture in parallel weight over imaginary CM fields (BCGNT Theorem B = Theorem 7.2.3)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.bianchi_satoTate` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be an imaginary CM field and π a cuspidal regular algebraic representation of GL₂(𝔸_F) of
parallel weight, not CM, with ω_π = |·|^{−w}ψ. Let S_π be the set of finite places where π is
ramified (printed 'unramified': a source issue). Then the classes [π_v] ∈ ST(π), v ∉ S_π, are
equidistributed for the Haar probability measure of ST(π).

*Hypotheses.*
- As stated.

*Construction and proof.*
- Serre's criterion (ML.3/serre-equidistribution-criterion): for non-trivial irreducible ρ of
  ST(π), ρ is (a twist of) Sym^{n−1} ⊗ det^k; potential automorphy of Sym^{n−1}R_π
  (ML.3/bcgnt-symmetric-powers-purity) with Brauer induction and the Jacquet–Shalika
  non-vanishing on Re s = 1 (AutomorphicLFunctionsAndLocalFactors AL.3) give the analytic
  properties.

*Acceptance.*
- For elliptic curves over CM fields it recovers ACC+ Theorem 1.0.1's Sato–Tate.

*Depends on:* `ML.3/sato-tate-group`, `ML.3/serre-equidistribution-criterion`,
`ML.3/bcgnt-symmetric-powers-purity`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`.

*Source.*
- bcgnt-2025, Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62); Theorem B, §1, arXiv p. 3
  (published p. 3) — BCGNT Theorem 7.2.3.

#### `ML.3/bianchi-fourier-ramanujan` — The Ramanujan bound for Fourier coefficients of Bianchi eigenforms (BCGNT Theorem E)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.bianchi_coeff_bound` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be imaginary quadratic, f a cuspidal Bianchi eigenform of level 𝔫 and weight k normalised
by c(O_F, f) = 1, and 𝔭 a prime ideal not dividing 𝔫. Then |c(𝔭, f)| ≤ 2N(𝔭)^{(k−1)/2}.

*Hypotheses.*
- As stated.

*Construction and proof.*
- c(𝔭, f) = α + β with α, β the Satake parameters scaled by N(𝔭)^{(k−1)/2};
  ML.3/bianchi-ramanujan gives |α| = |β|.

*Acceptance.*
- Weight 2 gives the Hasse-type bound |c(𝔭, f)| ≤ 2√N(𝔭).

*Depends on:* `ML.3/bianchi-ramanujan`, `ML.3/bianchi-modular-forms`.

*Source.*
- bcgnt-2025, Theorem E, §1.3, arXiv v3 p. 10 (published p. 8; arXiv pagination differs) — BCGNT Theorem E.

#### `ML.3/bianchi-parabolic-cohomology-ramanujan` — The Ramanujan bound for Hecke eigenvalues on parabolic cohomology of Bianchi groups (BCGNT Theorem F)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.bianchi_cohomology_bound` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be imaginary quadratic, 𝔫 ≠ 0, k ≥ 2, and H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗
\overline{Sym^{k−2}ℂ²}) (or the sum over the components when h_F > 1). For a principal prime 𝔭
∤ 𝔫 and an eigenvalue a_𝔭 of T_𝔭 on H_par, |a_𝔭| ≤ 2N(𝔭)^{(k−1)/2}.

*Hypotheses.*
- As stated.

*Construction and proof.*
- Eichler–Shimura–Harder: H_par is spanned by Bianchi eigenforms (ML.3/bianchi-modular-forms);
  apply ML.3/bianchi-fourier-ramanujan.

*Acceptance.*
- The cohomological form used for computations.

*Depends on:* `ML.3/bianchi-fourier-ramanujan`, `ML.3/bianchi-modular-forms`.

*Source.*
- bcgnt-2025, Theorem F, §1.3, arXiv v3 p. 11 (published p. 9; arXiv pagination differs) — BCGNT Theorem F.

#### `ML.3/bianchi-mass-equidistribution` — Mass equidistribution for level-one Bianchi eigenforms of growing weight (BCGNT Theorem G)

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.bianchi_massEquidistribution` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be imaginary quadratic of class number one and Γ = SL₂(O_F). For any sequence of
level-one Bianchi eigenforms f of weight tending to ∞, the normalised measures μ_f on Γ\ℍ³
(Marshall) converge weakly to the normalised hyperbolic volume.

*Hypotheses.*
- F imaginary quadratic of class number one; level one.

*Construction and proof.*
- Marshall's Corollary 3 is conditional on the Ramanujan bound for the forms involved;
  ML.3/bianchi-ramanujan supplies it.

*Acceptance.*
- An application of Theorem A to quantum unique ergodicity in the weight aspect.

*Depends on:* `ML.3/bianchi-ramanujan`, `ML.3/bianchi-modular-forms`.

*Source.*
- bcgnt-2025, Theorem G and proof, §1.3, arXiv v3 p. 11 (published p. 10; arXiv pagination
  differs) — BCGNT Theorem
  G.

#### `ML.3/cg18-conditional-sato-tate` — Conditional Sato–Tate for elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(2))

*Kind:* theorem.
*Declaration:* `TauCeti.SymmetricPower.cg18_satoTate` in `TauCeti/NumberTheory/SymmetricPower`.

Assume Calegari–Geraghty's Conjecture B. Let F be any number field and E/F a non-CM elliptic
curve. Then the Sato–Tate conjecture holds for E. Status: conditional
(ML.0/endpoint-status-register).

*Hypotheses.*
- Hypothesis: Conjecture B.

*Construction and proof.*
- Potential automorphy of all symmetric powers (ML.2/cg18-odd-symmetric-powers with the tensor
  product trick and ML.2/cg18-conditional-potential-modularity) and the equidistribution
  criterion (ML.3/l-function-equidistribution-criterion) with Brauer induction.

*Acceptance.*
- Not unconditional: potential automorphy alone does not prove equidistribution without the
  analytic step (acceptance of ML.3).

*Depends on:* `ML.2/cg18-conditional-potential-modularity`,
`ML.3/l-function-equidistribution-criterion`, `ML.0/endpoint-status-register`.

*Source.*
- cg-2018, Theorem 1.1(2), §1, p. 3 (arXiv v2) = Invent. p. 300; reduction in §10, p. 97 (arXiv
  v2) = Invent. p. 428 — Calegari–Geraghty Theorem 1.1(2).

#### `ML.3/gelbart-jacquet` — Gelbart–Jacquet: the symmetric square (adjoint) lift from GL₂ to GL₃

*Kind:* theorem.
*Declaration:* `TauCeti.Functoriality.gelbartJacquet` in `TauCeti/NumberTheory/SymmetricPower`.

Let π be a cuspidal automorphic representation of GL₂(𝔸_F), F a number field. Then Sym²π
(equivalently Ad(π) = Sym²π ⊗ ω_π^{−1}) exists as an automorphic representation of GL₃(𝔸_F) in
the sense of ML.3/functorial-lift, and Ad(π) is cuspidal iff π is not dihedral (not
automorphically induced from a Hecke character of a quadratic extension).

*Hypotheses.*
- F a number field; π cuspidal on GL₂(𝔸_F).

*Construction and proof.*
- Gelbart–Jacquet (Ann. Sci. ÉNS 1978): Shimura's integral representation of L(s, Ad π) and the
  converse theorem for GL₃.
- Local compatibility at every place by the local theory of Gelbart–Jacquet and the local
  Langlands correspondence for GL₂.

*Acceptance.*
- For π attached to a non-CM elliptic curve over ℚ, Ad(π) is cuspidal on GL₃; for a CM curve it
  is not.

*Depends on:* `ML.3/functorial-lift`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`,
`AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet`.

*Source.*
- newton-thorne-I, Introduction, 'Context', p. 1 (arXiv:1912.11261v3) — Newton–Thorne I: Sym² was proved by Gelbart–Jacquet.
- gelbart-jacquet-1978, §9, (9.3) Theorem, p. 534 (Ann. Sci. ÉNS 11) — Gelbart–Jacquet's main theorem.

#### `ML.3/kim-shahidi-sym3` — Kim–Shahidi: functorial products GL₂ × GL₃ → GL₆ and the symmetric cube

*Kind:* theorem.
*Declaration:* `TauCeti.Functoriality.kimShahidi` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be a number field, π a cuspidal automorphic representation of GL₂(𝔸_F) and σ one of
GL₃(𝔸_F). Then the functorial product π ⊠ σ exists as an automorphic representation of
GL₆(𝔸_F), and Sym³π exists as an automorphic representation of GL₄(𝔸_F); Sym³π is cuspidal
unless π is dihedral or tetrahedral (Ad(π) ≅ Ad(π) ⊗ χ for a cubic χ).

*Hypotheses.*
- F a number field; π cuspidal on GL₂(𝔸_F), σ cuspidal on GL₃(𝔸_F).

*Construction and proof.*
- Kim–Shahidi (Ann. of Math. 2002): the Langlands–Shahidi method for the Levi GL₂ × GL₃ of
  SL₅-type groups gives the analytic properties of L(s, π × σ × τ) for cuspidal τ on GL_m, m ≤
  4, and Cogdell–Piatetski-Shapiro's converse theorem.
- Sym³π is a constituent of π ⊠ Sym²π (Gelbart–Jacquet), split off by the central character.
- Kim–Shahidi prove local compatibility outside the places above 2 and 3; Newton–Thorne I quote
  Sym³ as a functorial lift at every place (with Henniart's local results).

*Acceptance.*
- For π attached to a non-CM elliptic curve over ℚ, Sym³π is cuspidal of symplectic type with
  multiplier ω_π³.

*Depends on:* `ML.3/gelbart-jacquet`, `ML.3/functorial-lift`,
`AutomorphicLFunctionsAndLocalFactors:AL.4`.

*Source.*
- newton-thorne-I, Introduction, 'Context', p. 1 (arXiv:1912.11261v3) — Newton–Thorne I: m = 3, 4 by Kim–Shahidi and Kim.
- kim-shahidi-2002, Introduction, Theorem A, p. 838 (= Theorem 5.1) (Ann. of Math. 155;
  arXiv:math/0409607v1) — Kim–Shahidi's statement.

#### `ML.3/kim-sym4` — Kim: the exterior square GL₄ → GL₆ and the symmetric fourth power GL₂ → GL₅ (with Henniart)

*Kind:* theorem.
*Declaration:* `TauCeti.Functoriality.kim_exteriorSquare` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be a number field. (a) For Π cuspidal on GL₄(𝔸_F), ∧²Π exists as an automorphic
representation of GL₆(𝔸_F) (Kim 2003, with local compatibility at the places over 2 and 3
completed by Henniart 2009, so that ∧²Π is a functorial lift in the sense of
ML.3/functorial-lift at every place). (b) For π cuspidal on GL₂(𝔸_F), Sym⁴π exists as an
automorphic representation of GL₅(𝔸_F) (Kim 2003), cuspidal unless π is dihedral, tetrahedral
or octahedral (Kim–Shahidi).

*Hypotheses.*
- F a number field.

*Construction and proof.*
- Kim: Langlands–Shahidi method for the Levi GL₂ × GL₄ (and GL₃ × GL₄) in Spin groups and the
  converse theorem, giving ∧² for GL₄; Sym⁴ is extracted from ∧²(Sym³π).
- Henniart: local compatibility of ∧² at every place.
- Gee–Taïbi use (a) in their proof of the multiplicity formula for GSp₄; BCGP Theorem 9.3.1
  uses (a) with Theorem 2.9.3.

*Acceptance.*
- For π attached to a non-CM elliptic curve over ℚ, Sym⁴π is cuspidal on GL₅.

*Depends on:* `ML.3/kim-shahidi-sym3`, `ML.3/functorial-lift`,
`AutomorphicLFunctionsAndLocalFactors:AL.4`.

*Source.*
- bcgp-2021, Proof of Theorem 9.3.1, §9.3, p. 258 (arXiv v3) — BCGP §9.3: the main result of Henniart, a refinement of Kim's.
- gee-taibi-2019, §1.1, p. 2 (arXiv v1) — Gee–Taïbi: Kim's exterior square, completed by
  Henniart, is an input.
- kim-2003, §1, Theorem A, p. 139 (= Theorem 5.3.1) (J. Amer. Math. Soc. 16) — Kim's Theorems A and B.

#### `ML.3/ramakrishnan-tensor-product` — Ramakrishnan: the automorphic tensor product GL₂ × GL₂ → GL₄

*Kind:* theorem.
*Declaration:* `TauCeti.Functoriality.ramakrishnan` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be a number field and π₁, π₂ cuspidal automorphic representations of GL₂(𝔸_F). Then π₁ ⊠
π₂ exists as an automorphic (isobaric) representation of GL₄(𝔸_F) with L(s, π₁ ⊠ π₂) = L(s, π₁
× π₂), and it is cuspidal unless π₁, π₂ are both dihedral with a common inducing field, or π₂ ≅
π₁ ⊗ χ for a Hecke character χ.

*Hypotheses.*
- F a number field; π₁, π₂ cuspidal on GL₂(𝔸_F).

*Construction and proof.*
- Ramakrishnan (Ann. of Math. 2000): Rankin–Selberg theory for GL₂ × GL₂ twisted by GL₂ and
  GL₁, and the converse theorem of Cogdell–Piatetski-Shapiro for GL₄.

*Acceptance.*
- Newton–Thorne II Appendix A use GL₂ × GL₂ → GL₄ for icosahedral weight-one forms.

*Depends on:* `ML.3/functorial-lift`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`.

*Source.*
- newton-thorne-II, Appendix A, proof of Theorem A.1, p. 28 (arXiv:2009.07180v2) —
  Newton–Thorne II App. A use the tensor product functorialities GL₂ × GL₂ → GL₄ and GL₂ × GL₃
  → GL₆.
- ramakrishnan-2000, §3, Theorem M, p. 54 (Ann. of Math. 152; arXiv:math/0007203v1):
  “Existence. There exists an isobaric automorphic representation π ⊠ π ′ of GL(4, AF )
  satisfying (at every finite place v)” — Ramakrishnan's main theorem.

#### `ML.3/low-rank-symmetric-powers` — Symmetric powers of GL₂ in degrees at most five (SP_n for n ≤ 5)

*Kind:* theorem.
*Declaration:* `TauCeti.Functoriality.sp_le_five` in `TauCeti/NumberTheory/SymmetricPower`.

Let F be a totally real field and π a cuspidal regular algebraic automorphic representation of
GL₂(𝔸_F) without CM. Then for 1 ≤ n ≤ 5 the lift Sym^{n−1}π exists as a regular algebraic
essentially self-dual cuspidal automorphic representation of GL_n(𝔸_F): this is the statement
SP_n of Newton–Thorne for n ≤ 5, the base case of their induction.

*Hypotheses.*
- F totally real; π regular algebraic cuspidal non-CM.

*Construction and proof.*
- n ≤ 3: π itself and Gelbart–Jacquet (cuspidal since non-CM ⇒ non-dihedral).
- n = 4, 5: Kim–Shahidi and Kim; cuspidality since a regular algebraic non-CM π is not
  tetrahedral or octahedral (its Galois representations have open image, Ribet).
- Regular algebraic and essentially self-dual: Sym^{n−1}π ≅ (Sym^{n−1}π)^∨ ⊗ ω_π^{n−1};
  regularity from the Hodge–Tate weights of Sym^{n−1} r_ι(π). Newton–Thorne take the base case
  as known without citation (recorded as a source issue).

*Acceptance.*
- Newton–Thorne 2026 §1: SP_n is known for 1 ≤ n ≤ 5.

*Depends on:* `ML.3/gelbart-jacquet`, `ML.3/kim-shahidi-sym3`, `ML.3/kim-sym4`,
`ML.3/sp-statement`.

*Source.*
- nt-2026, Proof of Theorem 6.4, §6, p. 50 (arXiv:2212.03595v2) — Newton–Thorne prove Theorem 6.4 by induction on
  n ≥ 6, the cases n ≤ 5 being known.
- nt-2026, §1, p. 3 (arXiv:2212.03595v2): “Unconditional knowledge of conjectures LRm and TPm ,
  together with the known cases of SPn for 1 ≤ n ≤ 5, would therefore imply SPn for all n ≥ 1.”
  — Newton–Thorne §1: the known cases of SP_n for 1 ≤ n ≤ 5.

**Remaining refinements.**
- The Newton–Thorne methods (level raising on unitary groups, analytic continuation of
  eigenvarieties, tensor-functoriality lifting) are owned by the proposed Part IIs named in the
  gap; ML.3 plans the endpoints and reductions only.
- Dummigan–Martin–Watkins (2009) was not available: the normalisation of Λ(Sym^n E, s) is the
  ML.0 one, not checked against DMW09.

## Layer ML.4: Classical-group classification and trace sources (`TauCeti/RepresentationTheory/ArthurClassification/…`)

ML.4 follows option (b) of RT-AREA-langlands-3/1: it states Arthur's, Mok's and
Kaletha–Mínguez–Shin–White's classifications, and the GSp₄ results of Gan–Takeda and Gee–Taïbi
used by the GSp₄ modularity papers, with their conditional status visible on every node
(ML.0/arthur-dependency-gate) and their proofs recorded as an external gap; option (a), a
constructive owner, is proposed in the packet's `restructure`. The symplectic branch has a
named verification task (`symplectic-branch-status`) and is never marked unconditional because
a unitary theorem is available. Packets of non-split odd orthogonal groups (Gan–Ichino,
Ishimoto), Xu's packets for GSp_{2n}, and the archimedean packets of Adams–Johnson and
Mœglin–Renard complete the layer.

*Coverage.* Checkpoint 3: classification registry with conditional status
(RT-AREA-langlands-3/1 option (b)): self-dual cuspidal types, global parameters, extended
Langlands parameters, Arthur's Theorems 1.5.1–1.5.2, Mok, KMSW, Vogan packets and Gan–Ichino's
(6.1), Jiang–Zhang B.1, Gan–Takeda, Gee–Taïbi's GSp₄ classification with BCGP §2.9 and
CG20/Pilloni's uses, Xu, Adams–Johnson and Mœglin–Renard packets, the trace-formula input
register and the symplectic-branch verification task.

### Objects

#### `ML.4/self-dual-cuspidal-type` — Symplectic and orthogonal type of a self-dual cuspidal representation

*Kind:* definition.
*Declaration:* `TauCeti.Arthur.IsSymplecticType` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let π be a unitary cuspidal automorphic representation of GL_N(𝔸_F) with π ≅ π^∨, and S a
finite set of places containing the archimedean places and those where π ramifies. π is of
symplectic type if the partial exterior-square L-function L^S(s, π, ∧²) has a pole at s = 1,
and of orthogonal type if L^S(s, π, Sym²) has a pole at s = 1. Exactly one of the two holds:
L^S(s, π × π) = L^S(s, π, Sym²)·L^S(s, π, ∧²) has a simple pole at s = 1 because π ≅ π^∨, and
neither factor vanishes at s = 1. Symplectic type forces N even and ω_π = 1. Arthur's Theorem
1.5.3 identifies the type with the dual group from which π is a twisted-endoscopic transfer:
symplectic type exactly when π comes from a generic parameter of split SO_{N+1} (Ĝ = Sp_N(ℂ)),
orthogonal type exactly when π comes from Sp_{N−1} (N odd) or from the quasi-split SO_N
attached to ω_π (N even).

*Hypotheses.*
- F a number field; π a unitary cuspidal automorphic representation of GL_N(𝔸_F) with π ≅ π^∨.
- The type does not depend on S: the local factors at finitely many places are holomorphic and
  non-zero at s = 1.

*Construction and proof.*
- Factorisation L^S(s, π × π^∨) = L^S(s, π, Sym²) L^S(s, π, ∧²) of unramified Euler factors,
  from Sym²V ⊕ ∧²V = V ⊗ V.
- Jacquet–Shalika: L^S(s, π × π^∨) has a simple pole at s = 1
  (AutomorphicLFunctionsAndLocalFactors AL.3).
- Shahidi: L^S(s, π, Sym²) and L^S(s, π, ∧²) are non-zero at s = 1 and have at most simple
  poles there (Langlands–Shahidi method), so exactly one of them has the pole.
- Arthur, Theorem 1.5.3: the pole determines the twisted-endoscopic group G with π = ψ for a
  simple generic ψ ∈ Ψ_2(G).

*Uses.*
- Arthur 2013, §1.4: the parity condition on the summands μ_i ⊠ ν_{b_i} of a global parameter ψ
  ∈ Ψ_2(G)
- Gan–Ichino 2018, §1.1: the symplectic/orthogonal split of the summands of A-parameters of
  Mp_{2n} and SO_{2n+1}
- Boxer–Calegari–Gee–Pilloni 2021, §2.9: a cuspidal Π on GL₄ of symplectic type (twisted ∧²)
  descends to GSp₄
- ModularityAndLanglandsExtensions:ML.5/ckpss-generic-transfer: the image of the generic
  transfer from SO_{2n+1}

| API | role | statement |
|---|---|---|
| `TauCeti.Arthur.IsSymplecticType` | data | π is of symplectic type: L^S(s, π, ∧²) has a pole at s = 1. |
| `TauCeti.Arthur.IsOrthogonalType` | data | π is of orthogonal type: L^S(s, π, Sym²) has a pole at s = 1. |
| `TauCeti.Arthur.selfDual_type_dichotomy` | characterisation | For π ≅ π^∨ cuspidal unitary: exactly one of IsSymplecticType π and IsOrthogonalType π holds. |
| `TauCeti.Arthur.IsSymplecticType.even` | relation | IsSymplecticType π implies N is even. |
| `TauCeti.Arthur.IsSymplecticType.centralCharacter_eq_one` | relation | IsSymplecticType π implies ω_π = 1. |
| `TauCeti.Arthur.IsSymplecticType.independent_of_S` | extensionality | The pole at s = 1 does not depend on the finite set S. |
| `TauCeti.Arthur.selfDualType_iff_transfer` | characterisation | Arthur Theorem 1.5.3: IsSymplecticType π iff π is the transfer of a simple generic parameter of split SO_{N+1}. |

*Unit tests.*
- `TauCeti.Arthur.quadraticCharacter_orthogonal` (computation): N = 1: a Hecke character χ with
  χ² = 1 is of orthogonal type (L^S(s, χ²) = ζ_F^S(s) has a pole; ∧² of a line is 0).
- `TauCeti.Arthur.gl2_trivialCentral_symplectic` (characterisation): N = 2: a cuspidal π with
  ω_π = 1 is of symplectic type, since ∧²π = ω_π and L^S(s, ω_π) = ζ_F^S(s).
- `TauCeti.Arthur.ellipticCurve_symplectic` (computation): The unitary cuspidal π_E of GL₂(𝔸_ℚ)
  attached to an elliptic curve E/ℚ (with or without CM) is of symplectic type.
- `TauCeti.Arthur.cubicCharacter_noType` (non-example): A Hecke character χ of order 3 is not
  self-dual, and neither L^S(s, χ²) nor L^S(s, ∧²χ) = 1 has a pole.

*Acceptance.*
- The type of a quadratic Hecke character (N = 1) is orthogonal; that of a cuspidal GL₂
  representation with trivial central character is symplectic; a non-self-dual π has no type.

*Depends on:* `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`,
`AutomorphicLFunctionsAndLocalFactors:AL.4`,
`AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

*Source.*
- arthur-2013, §1.5, Theorem 1.5.3 and the paragraph before it, pp. 47–48 (2011 manuscript):
  “Observe that (a) gives an independent characterization of the group Gφ of Theorem 1.4.1.” —
  Gan–Ichino recall the dichotomy of self-dual cuspidal representations into symplectic and
  orthogonal type that Arthur's classification rests on.

#### `ML.4/global-arthur-parameter` — Discrete global Arthur parameters of a quasi-split classical group ★

*Kind:* definition. *Planet:* Global Arthur parameter.
*Declaration:* `TauCeti.Arthur.GlobalParameter` in `TauCeti/RepresentationTheory/ArthurClassification`.

A discrete global Arthur parameter for G is a formal unordered sum ψ = μ₁ ⊠ ν_{b₁} ⊞ ⋯ ⊞ μ_r ⊠
ν_{b_r}, where μ_i is a unitary cuspidal automorphic representation of GL_{m_i}(𝔸_F) with μ_i ≅
μ_i^∨, ν_b is the b-dimensional irreducible representation of SL₂(ℂ), Σ m_i b_i = N, the pairs
(μ_i, b_i) are pairwise distinct, every summand μ_i ⊠ ν_{b_i} has the parity of Ĝ (for Ĝ
symplectic: μ_i of symplectic type with b_i odd or of orthogonal type with b_i even; for Ĝ
orthogonal: μ_i of orthogonal type with b_i odd or of symplectic type with b_i even), and ∏_i
ω_{μ_i}^{b_i} = η_G. Ψ_2(G) denotes the set of these (for G = SO_{2n} taken up to the outer
automorphism, Ψ̃_2(G)). ψ is generic when every b_i = 1. Its global component group S_ψ ≅
(ℤ/2ℤ)^r modulo the image of the centre has one generator per summand, and Arthur attaches to ψ
a sign character ε_ψ of S_ψ built from symplectic root numbers ε(1/2, μ_i × μ_j). At each place
v, ψ localises to ψ_v : L_{F_v} × SL₂(ℂ) → ^LG through the local Langlands correspondence for
the GL_{m_i}.

*Hypotheses.*
- F a number field, 𝔸_F its adèles; G a quasi-split symplectic or special orthogonal group over
  F (Sp_{2n}, split SO_{2n+1}, or quasi-split SO_{2n} attached to a quadratic character η_G),
  whose dual group Ĝ has a standard representation of dimension N (N = 2n + 1, 2n, 2n
  respectively).

*Construction and proof.*
- The parity condition is the condition that ψ, viewed as an N-dimensional representation of
  L_F × SL₂(ℂ), preserves a form of the type of Ĝ: ν_b is symplectic for b even and orthogonal
  for b odd, and types multiply.
- S_ψ is the group of components of the centraliser of the image of ψ in Ĝ, modulo Z(Ĝ)^Γ; each
  self-dual irreducible summand of the right type contributes one factor ℤ/2ℤ.
- ε_ψ is Arthur's (1.5.6): a product of root numbers ε(1/2, μ_i × μ_j) = ±1 over the pairs of
  summands where the Rankin–Selberg product is of symplectic type.

*Uses.*
- ModularityAndLanglandsExtensions:ML.4/arthur-multiplicity-formula: the index set of the
  decomposition of L²_disc
- ModularityAndLanglandsExtensions:ML.4/gsp4-arthur-classification: the parameter types (a)–(f)
  for GSp₄ are global parameters of Sp₄ ≅ Spin₅ twisted by the similitude
- Gan–Ichino 2018, §1.3: A-parameters of Mp_{2n} and SO_{2n+1} and the sign character ε_ψ in
  the multiplicity formula
- Chenevier–Taïbi 2020, §§1.4, 5.2: level one parameters are counted by their archimedean
  components

| API | role | statement |
|---|---|---|
| `TauCeti.Arthur.GlobalParameter` | structure | The finite multiset of pairs (μ_i, b_i) with the dimension, distinctness, parity and central-character conditions. |
| `TauCeti.Arthur.GlobalParameter.IsGeneric` | data | Every b_i equals 1. |
| `TauCeti.Arthur.GlobalParameter.componentGroup` | data | S_ψ, an elementary abelian 2-group with one generator per summand modulo the centre. |
| `TauCeti.Arthur.GlobalParameter.signCharacter` | data | Arthur's character ε_ψ : S_ψ → {±1}. |
| `TauCeti.Arthur.GlobalParameter.localize` | projection | ψ_v : L_{F_v} × SL₂(ℂ) → ^LG obtained from rec(μ_{i,v}) ⊗ ν_{b_i}. |
| `TauCeti.Arthur.GlobalParameter.toIsobaric` | projection | The isobaric automorphic representation ⊞_i Speh(μ_i, b_i) of GL_N(𝔸_F) attached to ψ. |
| `TauCeti.Arthur.GlobalParameter.ofSelfDualCuspidal` | constructor | A unitary self-dual cuspidal μ of GL_N(𝔸_F) of the type of Ĝ (with ω_μ = η_G) is a simple generic parameter. |
| `TauCeti.Arthur.GlobalParameter.signCharacter_generic_trivial_of_rootNumbers` | relation | If every symplectic root number ε(1/2, μ_i × μ_j) occurring in ε_ψ equals 1 then ε_ψ = 1; in particular ε_ψ = 1 for generic ψ. |

*Unit tests.*
- `TauCeti.Arthur.GlobalParameter.so3_trivial` (computation): G = SO₃ ≅ PGL₂, N = 2: ψ = 1 ⊠ ν₂
  is in Ψ_2(SO₃), S_ψ = 1, and Π_ψ(ε_ψ) is the trivial representation of PGL₂(𝔸_F).
- `TauCeti.Arthur.GlobalParameter.so3_generic_iff` (characterisation): G = SO₃: a cuspidal μ of
  GL₂(𝔸_F) is a generic element of Ψ_2(SO₃) iff ω_μ = 1.
- `TauCeti.Arthur.GlobalParameter.sp0_empty` (degenerate): N = 0 (G = SO₁, the trivial group):
  Ψ_2(G) consists of the empty sum only.
- `TauCeti.Arthur.GlobalParameter.repeated_not_discrete` (non-example): μ ⊠ ν₁ ⊞ μ ⊠ ν₁ (a
  repeated summand) is not a discrete parameter: discrete parameters are multiplicity free.
- `TauCeti.Arthur.GlobalParameter.wrongParity` (non-example): For G = SO₃, the summand χ ⊠ ν₁ ⊞
  χ′ ⊠ ν₁ of two quadratic characters is not in Ψ_2(SO₃): each χ ⊠ ν₁ is orthogonal while Ĝ =
  SL₂ = Sp₂ is symplectic.

*Acceptance.*
- For G = SO₃ ≅ PGL₂ (N = 2) the parameter 1 ⊠ ν₂ is discrete and its packet is the trivial
  representation; a generic μ ∈ Ψ_2(SO₃) is exactly a cuspidal GL₂ representation with trivial
  central character.

*Depends on:* `ML.4/self-dual-cuspidal-type`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`,
`EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

*Source.*
- arthur-2013, §1.4, (1.4.4), p. 30 (2011 manuscript) — Arthur
  §1.4: formal global parameters as a substitute for the global Langlands group.
- mok-2015, §2.3, p. 15 (arXiv v5) — Mok §2.3: the
  same definition for unitary groups.

#### `ML.4/extended-langlands-parameter` — Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group

*Kind:* definition.
*Declaration:* `TauCeti.Arthur.ExtendedParameter` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be a non-archimedean local field of characteristic 0 and G° a quasi-split classical group
over F (symplectic, special orthogonal or unitary). A Langlands parameter is a Ĝ°-conjugacy
class of admissible homomorphisms ϱ : W_F × SL₂(ℂ) → ^LG°; its component group S_ϱ =
π₀(Cent_{Ĝ°}(ϱ)/Z(Ĝ°)^{Γ_F}) is an elementary abelian 2-group. An extended Langlands parameter
is a pair (ϱ, χ_ϱ) with χ_ϱ a character of S_ϱ, and Lang(G°) is the set of extended parameters.
The local Langlands correspondence of Arthur and Mok, normalised by a Whittaker datum, is a
bijection LL : Irr(G°) → Lang(G°) (for even special orthogonal groups, up to the outer
automorphism), under which the L-packet Π_ϱ is the fibre over ϱ.

*Hypotheses.*
- F non-archimedean of characteristic 0; G° quasi-split classical; a Whittaker datum fixed (it
  normalises χ_ϱ).

*Construction and proof.*
- S_ϱ is computed from the decomposition of the standard representation of ϱ into irreducibles:
  each irreducible summand of the type of Ĝ° (orthogonal, symplectic or conjugate-self-dual of
  the right sign) occurring with odd multiplicity contributes a factor ℤ/2ℤ.
- LL is ML.4/local-arthur-packets (c) for tempered ϱ, extended to all parameters by the
  Langlands classification.

*Uses.*
- Kurinczuk–Skodlerack–Stevens 2021, §1.20: endo-parameters are matched with the restriction of
  extended parameters to wild inertia
- ModularityAndLanglandsExtensions:ML.4/local-arthur-packets: the bijection Π_φ ≅ Ŝ_φ for
  tempered φ
- ModularityAndLanglandsExtensions:ML.4/vogan-packets-so-v: Vogan packets over all pure inner
  forms are indexed by all characters of S_φ, not only those trivial on the centre

| API | role | statement |
|---|---|---|
| `TauCeti.Arthur.ExtendedParameter` | structure | A pair (ϱ, χ_ϱ) with χ_ϱ a character of S_ϱ. |
| `TauCeti.Arthur.ExtendedParameter.parameter` | projection | The underlying Langlands parameter ϱ. |
| `TauCeti.Arthur.ExtendedParameter.character` | projection | The character χ_ϱ of S_ϱ. |
| `TauCeti.Arthur.componentGroup_elementaryAbelianTwo` | relation | S_ϱ is an elementary abelian 2-group. |
| `TauCeti.Arthur.lPacket_equiv_characters` | equivalence | For G° quasi-split, LL restricts to a bijection Π_ϱ ≃ Ŝ_ϱ. |
| `TauCeti.Arthur.ExtendedParameter.generic_iff` | characterisation | For tempered ϱ, the generic member of Π_ϱ (for the fixed Whittaker datum) is the one with χ_ϱ = 1. |

*Unit tests.*
- `TauCeti.Arthur.ExtendedParameter.sl2_klein_four` (computation): G° = SL₂, p odd, ϱ with
  image the Klein four-group in SO₃(ℂ): S_ϱ ≅ (ℤ/2ℤ)², so |Π_ϱ| = 4.
- `TauCeti.Arthur.ExtendedParameter.so2_split` (degenerate): G° = split SO₂ ≅ GL₁: every S_ϱ is
  trivial and, with even orthogonal groups taken up to the outer automorphism, Lang(G°) ≅
  Hom(F^×, ℂ^×)/(χ ∼ χ^{−1}) (local class field theory).
- `TauCeti.Arthur.ExtendedParameter.sl2_size_two` (non-example): G° = SL₂: a parameter ϱ : W_F
  → SO₃(ℂ) ≅ PGL₂(ℂ) lifting to an irreducible dihedral Ind_{W_E}^{W_F} θ with θ/θ^c not
  quadratic has S_ϱ ≅ ℤ/2ℤ and an L-packet of size 2, not a singleton as for GL₂.
- `TauCeti.Arthur.ExtendedParameter.unramified_trivial` (characterisation): An unramified
  tempered ϱ of Sp_{2n} whose standard representation is a sum of distinct characters has S_ϱ =
  1 and Π_ϱ is the unramified representation.

*Acceptance.*
- For G° = SL₂ = Sp₂, a parameter ϱ : W_F → SO₃(ℂ) with image the Klein four-group has S_ϱ ≅
  (ℤ/2ℤ)² and an L-packet of four supercuspidal representations (Labesse–Langlands).

*Depends on:* `ML.4/global-arthur-parameter`,
`EndoscopicTransferAndUnitaryTraceComparison:ET.6`,
`tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

*Source.*
- kss-2021, §1.20, p. 8 (arXiv v3); p. 604 in the version of record — KSS §1.20 defines extended
  Langlands parameters (ϱ, χ_ϱ) and Lang(G°).

#### `ML.4/gsp4-discrete-spectrum-types` — Discrete automorphic representations of GSp₄: symplectic type, general type and transfer

*Kind:* definition.
*Declaration:* `TauCeti.Arthur.GSp4.IsGeneralType` in `TauCeti/RepresentationTheory/ArthurClassification`.

An automorphic representation π of GSp₄(𝔸_F) is discrete if it occurs in the discrete spectrum
of L² automorphic forms with central character ω_π (every cuspidal one is). A cuspidal Π of
GL₄(𝔸_F) is of symplectic type with multiplier χ if L^S(s, Π, ∧² ⊗ χ^{−1}) has a pole at s = 1
for some (equivalently every) finite S; then Π ≅ Π^∨ ⊗ χ. A discrete π is of general type if
there is a cuspidal Π of GL₄(𝔸_F) of symplectic type with multiplier ω_π such that, for every
place v, the L-parameter of π_v (rec_GT(π_v) at finite v, the archimedean Langlands parameter
at infinite v) composed with GSp₄(ℂ) ⊂ GL₄(ℂ) is rec(Π_v); Π is then the transfer of π.
Arthur's classification divides the discrete spectrum into six families (a)–(f), (a) being
general type and (b)–(f) the Yoshida, Soudry, Saito–Kurokawa, Howe–Piatetski-Shapiro and
one-dimensional types (Gee–Taïbi Remark 6.1.4 list S_ψ = 1, ℤ/2ℤ, 1, ℤ/2ℤ, ℤ/2ℤ, 1
respectively, with ε_ψ non-trivial only in the Saito–Kurokawa case with ε(1/2, π ⊗ η^{−1}) =
−1).

*Hypotheses.*
- F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni
  over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete
  automorphic representation of GSp₄(𝔸_F) with central character ω_π.

*Construction and proof.*
- The six types are read off from the transfer π̃ of π to GL₄ under Arthur's classification:
  (a) π̃ cuspidal and χ_π-self-dual; (b) μ₁ ⊞ μ₂ with μ_i distinct cuspidal on GL₂ with central
  characters χ_π; (c) μ|·|^{1/2} ⊞ μ|·|^{−1/2} with μ cuspidal of orthogonal type; (d)
  λ|·|^{1/2} ⊞ λ|·|^{−1/2} ⊞ μ with χ_μ = λ² = χ_π; (e), (f) isobaric sums of Hecke characters.
- At archimedean places BCGP's 'rec_GT(π_v)' is read as the archimedean Langlands parameter
  (recorded as a source issue).

*Uses.*
- Boxer–Calegari–Gee–Pilloni 2021, Lemma 2.9.1 and Theorem 2.9.3: only general-type
  representations contribute after localising at a non-Eisenstein ideal; GL₄ representations of
  symplectic type descend
- Calegari–Geraghty 2020, proof of Theorem 7.11: classes (b)–(f) are excluded by the
  irreducibility of the residual representation
- Pilloni 2020, §5.1.7 and §15.2.4: non-general type gives reducible Galois representations;
  packets with a holomorphic limit of discrete series are of general, Yoshida or Saito–Kurokawa
  type

| API | role | statement |
|---|---|---|
| `TauCeti.Arthur.GSp4.IsDiscrete` | data | π occurs in L²_disc(GSp₄(F)\GSp₄(𝔸_F), ω_π). |
| `TauCeti.Arthur.GSp4.IsSymplecticTypeWith` | data | Π cuspidal on GL₄ with L^S(s, Π, ∧² ⊗ χ^{−1}) having a pole at s = 1. |
| `TauCeti.Arthur.GSp4.IsGeneralType` | data | π has a cuspidal transfer Π of symplectic type with multiplier ω_π. |
| `TauCeti.Arthur.GSp4.transfer` | projection | The transfer Π of a general-type π (unique by strong multiplicity one). |
| `TauCeti.Arthur.GSp4.IsSymplecticTypeWith.selfDual` | relation | IsSymplecticTypeWith Π χ ⇒ Π ≅ Π^∨ ⊗ χ. |
| `TauCeti.Arthur.GSp4.ArthurType` | data | The six types (a)–(f) of a discrete π. |
| `TauCeti.Arthur.GSp4.isGeneralType_iff_typeA` | characterisation | IsGeneralType π ↔ ArthurType π = (a). |

*Unit tests.*
- `TauCeti.Arthur.GSp4.yoshida_not_general` (non-example): A Yoshida lift (transfer μ₁ ⊞ μ₂ of
  two distinct weight-2 newforms with equal central characters) is discrete but not of general
  type.
- `TauCeti.Arthur.GSp4.oneDimensional_typeF` (degenerate): The one-dimensional representation χ
  ∘ ν of GSp₄(𝔸_F) is discrete, of type (f), with transfer χ|·|^{3/2} ⊞ χ|·|^{1/2} ⊞
  χ|·|^{−1/2} ⊞ χ|·|^{−3/2}.
- `TauCeti.Arthur.GSp4.sym3_symplectic` (computation): For π cuspidal on GL₂ non-dihedral and
  non-tetrahedral, Sym³π (ML.3/kim-shahidi-sym3) is cuspidal on GL₄ of symplectic type with
  multiplier ω_π³.
- `TauCeti.Arthur.GSp4.symplectic_iff_gl2` (compatibility): For GL₂ (the analogue for GSp₂ =
  GL₂), every cuspidal Π is of symplectic type with multiplier ω_Π, since ∧²Π = ω_Π.

*Acceptance.*
- The cuspidal π of a non-endoscopic genus-2 Siegel eigenform of weight (k, j) ≥ (3, 0) is of
  general type; a Yoshida lift is of type (b).

*Depends on:* `ML.4/self-dual-cuspidal-type`, `ML.4/gan-takeda-llc-gsp4`,
`ML.0/archimedean-langlands-conventions`.

*Source.*
- bcgp-2021, §2.9, p. 38 (arXiv v3) — BCGP §2.9: discrete representations and the
  six families.
- bcgp-2021, §2.9, definition of general type, p. 38 (arXiv v3) — BCGP
  §2.9: the definition of general type.
- gee-taibi-2019, Remark 6.1.4, p. 35 (arXiv v1) — Gee–Taïbi Remark 6.1.4: the six kinds of discrete
  parameters with S_ψ and ε_ψ.

### Theorems, comparisons and registers

#### `ML.4/local-arthur-packets` — Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1) ★

*Kind:* theorem. *Planet:* Local Arthur packets.
*Declaration:* `TauCeti.Arthur.localPacket` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be a local field of characteristic 0, G a quasi-split Sp_{2n}, SO_{2n+1} or SO_{2n} over
F with a fixed Whittaker datum, and ψ : L_F × SL₂(ℂ) → ^LG a local Arthur parameter whose
restriction to L_F is bounded. Then there are a finite multiset Π̃_ψ of irreducible unitary
representations of G(F) (for SO_{2n}, orbits under the outer automorphism) and a map π ↦ ⟨·, π⟩
from Π̃_ψ to the characters of S_ψ such that: (a) the distribution f ↦ Σ_{π ∈ Π̃_ψ} ⟨s_ψ, π⟩
f_G(π) is stable and is the transfer of the twisted character of the representation of GL_N(F)
⋊ θ attached to ψ; (b) for every endoscopic datum (G′, s) through which ψ factors as ψ′, f′(ψ′)
= Σ_{π ∈ Π̃_ψ} ⟨s_ψ x, π⟩ f_G(π) (the endoscopic character identities); (c) if ψ = φ is trivial
on SL₂(ℂ) (a tempered L-parameter) then Π̃_φ is a set of tempered representations, π ↦ ⟨·, π⟩
is injective, and bijective onto Ŝ_φ when F is p-adic; the packets Π̃_φ for φ ∈ Φ̃_bdd(G) are
disjoint and exhaust the tempered dual. Part (c) is the local Langlands correspondence for G.

*Hypotheses.*
- F local of characteristic 0; G quasi-split symplectic or special orthogonal over F with a
  fixed Whittaker datum.
- The statement is conditional as recorded in
  ModularityAndLanglandsExtensions:ML.0/arthur-dependency-gate: Arthur's proof uses the
  stabilisation of the twisted trace formula and results he announces in [A24]–[A27].

*Construction and proof.*
- Arthur's proof (2013, Chapters 2–7) is a long induction comparing the stabilised twisted
  trace formula of GL_N ⋊ θ with the stable trace formulas of the twisted endoscopic groups G,
  using the local intertwining relation.
- The packets are defined by (a) and (b) through the twisted transfer of characters of GL_N
  (Mœglin–Waldspurger stabilisation; Waldspurger's transfer; the fundamental lemma).
- No roadmap plans these proofs: they are recorded as the gap 'Arthur's endoscopic
  classification is an external conditional input' (see ML.4/trace-formula-inputs-register).

*Acceptance.*
- The packets of a tempered φ with S_φ = 1 are singletons; for G = SL₂-type groups the packet
  sizes are |Ŝ_φ| ∈ {1, 2, 4}.

*Depends on:* `ML.4/extended-langlands-parameter`, `ML.4/trace-formula-inputs-register`,
`ML.0/arthur-dependency-gate`, `EndoscopicTransferAndUnitaryTraceComparison:ET.6`.

*Source.*
- arthur-2013, §1.5, Theorem 1.5.1 and the paragraph before it, pp. 41–42 (2011 manuscript):
  “The first theorem concerns the case that F is local.” — Arthur's Theorem 1.5.1: local
  packets defined by endoscopic transfer of characters.
- arthur-2013, §1.5, after Theorem 1.5.1, p. 42 (2011 manuscript) — Mœglin's multiplicity-freeness for non-archimedean F.
- mok-2015, §2.5, Theorem 2.5.1, p. 32 (arXiv v5) — Mok Theorem 2.5.1, the unitary
  analogue.

#### `ML.4/arthur-multiplicity-formula` — Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2) ★

*Kind:* theorem. *Planet:* Arthur's multiplicity formula.
*Declaration:* `TauCeti.Arthur.multiplicity_formula` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let G be as in ML.4/global-arthur-parameter. Then L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ̃_2(G)} ⊕_{π ∈
Π̃_ψ(ε_ψ)} m_ψ π, where Π̃_ψ = ⊗'_v Π̃_{ψ_v} is the global packet (π_v unramified with ⟨·, π_v⟩
= 1 for almost all v; the local components ψ_v lie in Ψ̃⁺_unit(G_v), not necessarily bounded
since the Ramanujan conjecture is unknown, and their packets are defined from the bounded case
by Arthur's (1.5.1)–(1.5.2)), Π̃_ψ(ε_ψ) is the set of π = ⊗π_v ∈ Π̃_ψ whose character ⟨·, π⟩ =
∏_v ⟨·, π_v⟩, restricted to S_ψ, equals ε_ψ, and m_ψ ∈ {1, 2} is Arthur's multiplicity (m_ψ = 2
exactly when N is even, Ĝ = SO(N, ℂ) and every N_i = m_i b_i is even; otherwise m_ψ = 1). In
particular every discrete automorphic representation of G has a parameter ψ, its transfer to
GL_N(𝔸_F) is the isobaric representation of ψ, and the summands with generic ψ are the discrete
representations whose transfer is a sum of distinct self-dual cuspidals.

*Hypotheses.*
- F a number field, 𝔸_F its adèles; G a quasi-split symplectic or special orthogonal group over
  F (Sp_{2n}, split SO_{2n+1}, or quasi-split SO_{2n} attached to a quadratic character η_G),
  whose dual group Ĝ has a standard representation of dimension N (N = 2n + 1, 2n, 2n
  respectively).
- Conditional as recorded in ModularityAndLanglandsExtensions:ML.0/arthur-dependency-gate.

*Construction and proof.*
- Arthur 2013, Chapters 3–8: comparison of the stable multiplicity formula with the discrete
  part of the stabilised trace formula of G and the twisted trace formula of GL_N, by induction
  on N.
- The local packets and the pairing ⟨·, π_v⟩ are those of ML.4/local-arthur-packets.
- The global sign ε_ψ arises from the global intertwining operators normalised by
  Langlands–Shahidi; its computation uses the root numbers of the Rankin–Selberg products.

*Acceptance.*
- Recover the trivial representation of PGL₂ = SO₃ from ψ = 1 ⊠ ν₂, and the cuspidal spectrum
  of PGL₂ from the generic parameters of ML.4/global-arthur-parameter's test so3_generic_iff
  (multiplicity one for SL₂-packets after restriction is not claimed: SL₂ is not SO₃).

*Depends on:* `ML.4/global-arthur-parameter`, `ML.4/local-arthur-packets`,
`ML.4/trace-formula-inputs-register`, `ML.0/arthur-dependency-gate`,
`AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

*Source.*
- arthur-2013, §1.5, Theorem 1.5.2 and (1.5.3)–(1.5.7), pp. 45–47 (2011 manuscript) — Arthur's Theorem
  1.5.2.

#### `ML.4/mok-unitary-classification` — Endoscopic classification for quasi-split unitary groups (Mok) ★

*Kind:* theorem. *Planet:* Mok's classification for unitary groups.
*Declaration:* `TauCeti.Arthur.mok_multiplicity_formula` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let E/F be a quadratic extension of number fields and G = U_{E/F}(N) the quasi-split unitary
group. Global parameters are formal sums ψ = ⊞_i μ_i ⊠ ν_{b_i} with μ_i conjugate-self-dual
unitary cuspidal representations of GL_{m_i}(𝔸_E), Σ m_i b_i = N, pairwise distinct, each μ_i ⊠
ν_{b_i} conjugate-self-dual of sign (−1)^{N−1} (through the standard base change embedding
ξ_{χ₊}). Then (local) for every place v there are packets Π_{ψ_v} with characters ⟨·, π_v⟩ of
S_{ψ_v} satisfying the endoscopic character identities, and the tempered packets give the local
Langlands correspondence for U(N)(F_v); and (global) L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ_2(G,
ξ_{χ₊})} ⊕_{π ∈ Π_ψ(ε_ψ)} π, each with multiplicity one.

*Hypotheses.*
- E/F a quadratic extension of number fields; G = U_{E/F}(N) quasi-split; Whittaker datum
  fixed.
- Conditional exactly as Arthur's book on which Mok's proof depends
  (ML.0/arthur-dependency-gate).

*Construction and proof.*
- Mok follows Arthur's method: comparison of the stabilised twisted trace formula of
  R_{E/F}GL_N ⋊ θ with the stable trace formulas of the unitary groups U(N₁) × U(N₂).
- Multiplicity one: unlike SO_{2n} there is no outer automorphism ambiguity, so m_ψ = 1.

*Acceptance.*
- Check the sign convention: for N = 1, U(1) parameters are conjugate-orthogonal characters μ
  of 𝔸_E^×/E^× (μ|_{𝔸_F^×} = 1), and the multiplicity formula is Hilbert 90 / Pontryagin
  duality for U(1)(F)\U(1)(𝔸_F).

*Depends on:* `ML.4/global-arthur-parameter`, `ML.4/trace-formula-inputs-register`,
`ML.0/arthur-dependency-gate`, `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

*Source.*
- mok-2015, §2.5, Theorem 2.5.2 and Remark 2.5.3, pp. 34–35 (arXiv v5) —
  Mok's local and global classification theorems for quasi-split unitary groups.

#### `ML.4/kmsw-inner-forms` — Endoscopic classification for inner forms of unitary groups (Kaletha–Mínguez–Shin–White)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.kmsw_multiplicity_formula` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let G be an inner form of the quasi-split unitary group U_{E/F}(N), realised as an extended
pure inner twist. Then (local) for every tempered L-parameter φ of G at a place v there is a
packet Π_φ(G_v) with a bijection to the characters of the group S_φ^+ that restrict to the
character of Z(Ĝ)^+ determined by the inner twist, satisfying the refined endoscopic character
identities; and (global) for generic global parameters ψ the ψ-part of L²_disc(G(F)\G(𝔸_F)) is
⊕_{π ∈ Π_ψ(ε_ψ)} π, with the multiplicity formula of Mok, under the hypotheses stated by KMSW.

*Hypotheses.*
- E/F a quadratic extension of number fields (local statements for the completions); G an inner
  form of U_{E/F}(N) given as an extended pure inner twist.
- Conditional on Mok's classification and on the further hypotheses KMSW list
  (ML.0/arthur-dependency-gate).

*Construction and proof.*
- KMSW compare the trace formula of G with the stable trace formulas of the endoscopic groups,
  using Mok's results for the quasi-split inner form and the theory of extended pure inner
  twists (Kottwitz's B(G)).
- The global statement is proved for generic parameters; non-tempered local packets of inner
  forms are not constructed.

*Acceptance.*
- Check the degenerate case: for G quasi-split the statement is Mok's
  (ML.4/mok-unitary-classification).

*Depends on:* `ML.4/mok-unitary-classification`, `ML.4/trace-formula-inputs-register`,
`ML.0/arthur-dependency-gate`.

*Source.*
- kmsw-2014, §1.6.1, Theorem* 1.6.1 and the sentence before it, p. 80 (arXiv v3) — KMSW's local (tempered) and global (generic) classification
  for inner forms of unitary groups.

#### `ML.4/trace-formula-inputs-register` — Register of the trace-formula inputs of Arthur's classification and their owners

*Kind:* comparison.
*Declaration:* `TauCeti.Arthur.traceFormulaInputs` in `TauCeti/RepresentationTheory/ArthurClassification`.

Arthur's classification (ML.4/local-arthur-packets, ML.4/arthur-multiplicity-formula) and its
unitary analogues (ML.4/mok-unitary-classification, ML.4/kmsw-inner-forms) rest on: (1) the
invariant trace formula of G and the twisted trace formula of GL_N ⋊ θ (Arthur; owner
AutomorphicSpectralTheory:AS.6 for the untwisted formula); (2) the stabilisation of the
ordinary and of the twisted trace formula (Arthur; Mœglin–Waldspurger 2016); (3) the transfer
of orbital integrals (Waldspurger) and the fundamental lemma (Ngô) with its twisted and
weighted variants (Chaudouard–Laumon; the twisted weighted fundamental lemma); (4) the local
intertwining relation (Arthur §2.4, proved by Arthur for quasi-split groups modulo [A25]–[A27]
and by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin in further cases). Each input is registered with
its owner stage and its status: proved in print, announced, or open. No input is assumed proved
because a related unitary or GL_N result is.

*Hypotheses.*
- The registry lists statements and owners; it proves nothing.

*Construction and proof.*
- Owners: AutomorphicSpectralTheory AS.6 (coarse, fine and invariant trace formula);
  EndoscopicTransferAndUnitaryTraceComparison (transfer, fundamental lemma and unitary trace
  comparison); no roadmap of the atlas plans the stabilisation of the twisted trace formula or
  the twisted weighted fundamental lemma: these are recorded as gaps.
- Status of each input is read from Arthur's book §3.2 and from
  Atobe–Gan–Ichino–Kaletha–Mínguez–Shin §§0.3–0.4.

*Acceptance.*
- Every theorem node of ML.4 lists this register among its prerequisites, so that its
  conditional status is visible.

*Depends on:* `AutomorphicSpectralTheory:AS.6/invariant-trace-formula`,
`EndoscopicTransferAndUnitaryTraceComparison:ET.3`,
`EndoscopicTransferAndUnitaryTraceComparison:ET.4`, `ML.0/arthur-dependency-gate`.

*Source.*
- bcgp-2021, §1.4.1, p. 14 (arXiv v3) — AGIKMS
  §§0.3–0.4 state which inputs of Arthur's classification remain conditional.

#### `ML.4/symplectic-branch-status` — The symplectic (GSp₄) branch is conditional: its verification task

*Kind:* comparison.
*Declaration:* `TauCeti.Arthur.symplecticBranchStatus` in `TauCeti/RepresentationTheory/ArthurClassification`.

The symplectic branch of ML.4 (Gee–Taïbi's classification of the discrete spectrum of GSp₄,
ML.4/gsp4-arthur-classification, and everything that uses it: ML.4/gl4-symplectic-descent,
ML.4/non-general-type-reducible and the GSp₄ modularity theorems of Boxer–Calegari–Gee–Pilloni
and Calegari–Geraghty) is conditional on Arthur's classification for Sp₄ and SO₅ with the
inputs of ML.4/trace-formula-inputs-register. It is not made unconditional by the availability
of Mok's or KMSW's unitary results. The verification task is: (i) list the statements of
Arthur's book that rest on the announced references [A24]–[A27] and on the twisted weighted
fundamental lemma; (ii) check, for each, whether a published proof now exists
(Mœglin–Waldspurger for the stabilisation; Atobe–Gan–Ichino–Kaletha–Mínguez–Shin for the local
intertwining relation); (iii) record the remaining hypotheses as explicit hypotheses of every
GSp₄ endpoint.

*Hypotheses.*
- Status register; the hypotheses it lists are carried by the consumer nodes.

*Construction and proof.*
- Gee–Taïbi deduce GSp₄ from Arthur's classification for Sp₄ and SO₅ (restriction to Sp₄ and
  the similitude character); they inherit Arthur's hypotheses.
- Boxer–Calegari–Gee–Pilloni §1.4.1 and Calegari–Geraghty §1.4 state the dependence explicitly;
  BCGP 2025 §1.6 isolates the remaining twisted weighted fundamental lemma.

*Acceptance.*
- The acceptance criterion of ML.4: the symplectic branch has a named verification task and is
  never marked unconditional because a unitary theorem is available.

*Depends on:* `ML.4/trace-formula-inputs-register`, `ML.0/arthur-dependency-gate`.

*Source.*
- bcgp-2021, §1.4.1, p. 14 (arXiv v3) — The sources'
  own statements that the GSp₄ results depend on Arthur's unproved inputs.

#### `ML.4/vogan-packets-so-v` — Vogan packets for odd special orthogonal groups of all quadratic spaces

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.voganPacket_so` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be a local field of characteristic 0 and φ : L_F → Sp_{2n}(ℂ) an L-parameter. For each
(2n+1)-dimensional quadratic space V over F with trivial discriminant there is a (possibly
empty) L-packet Π_φ(SO(V)), and Irr SO(V) = ⊔_φ Π_φ(SO(V)); moreover there is a bijection ⊔_V
Π_φ(SO(V)) ↔ Ŝ_φ, σ_η ↔ η, onto the characters of the component group S_φ of the centraliser of
Im φ in Sp_{2n}(ℂ), where σ_η is a representation of SO(V) only if η(z_φ) = ε(V) (the
normalised Hasse–Witt invariant), with equality of the two conditions for F non-archimedean or
F = ℂ. σ ∈ Π_φ(SO(V)) is square-integrable iff φ is multiplicity-free and of good parity, and
tempered iff φ is tempered.

*Hypotheses.*
- F local of characteristic 0; V of odd dimension 2n + 1 with trivial discriminant (SO(V⁺)
  split, SO(V⁻) its pure inner form).
- Conditional: the split case is Arthur's (ML.0/arthur-dependency-gate); the non-split case is
  Mœglin–Renard's, which assumes Arthur-type results for inner forms (proved for generic
  parameters by Ishimoto).

*Construction and proof.*
- Split SO(V⁺): ML.4/local-arthur-packets (c) for SO_{2n+1}.
- Non-split SO(V⁻): Mœglin–Renard, with Ishimoto's local intertwining relation and endoscopic
  character relations for generic parameters; Gan–Ichino (5.3) record the combined statement.
- Square-integrability and temperedness criteria follow from the packet construction (Mœglin).

*Acceptance.*
- For n = 1: SO(V⁺) ≅ PGL₂ and SO(V⁻) ≅ D^×/F^× for the quaternion division algebra D; the
  Vogan packet of a discrete parameter φ with S_φ = ℤ/2ℤ is {the discrete series of PGL₂, its
  Jacquet–Langlands transfer to D^×/F^×}.

*Depends on:* `ML.4/local-arthur-packets`, `ML.4/extended-langlands-parameter`,
`ML.4/trace-formula-inputs-register`, `ML.0/arthur-dependency-gate`.

*Source.*
- gan-ichino-2018, §5.2, (5.3), p. 17 (arXiv v3); published p. 987 — Gan–Ichino (5.3): the LLC for SO(V) over all V as a
  partition into Vogan packets.
- gan-ichino-2018, §1.2, p. 4 (arXiv v3); published p. 969 — Gan–Ichino §1.2: Arthur for SO(V⁺), Mœglin–Renard for
  SO(V⁻).

#### `ML.4/amf-nonsplit-so-v` — Arthur's multiplicity formula for non-split odd orthogonal groups, generic parameters (Gan–Ichino's hypothesis (6.1))

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.multiplicity_formula_so_nonsplit` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be a number field, V a (2n+1)-dimensional quadratic space over F with trivial
discriminant, and Φ a generic elliptic A-parameter for SO(V), with global component group S_Φ,
S_{Φ,𝔸} = ∏_v S_{Φ_v} and diagonal map Δ : S_Φ → S_{Φ,𝔸}. Then (i) L²_disc(SO(V)) = ⊕_Φ
L²_Φ(SO(V)) (the near-equivalence decomposition by parameters), and (ii) L²_Φ(SO(V)) ≅ ⊕_η m_η
Σ_η, the sum over continuous characters η = ⊗_v η_v of S_{Φ,𝔸} with η_v ∈ Ŝ_{Φ_v,V_v} for all
v, Σ_η = ⊗_v Σ_{η_v} through the Vogan packets of ML.4/vogan-packets-so-v, and m_η = 1 if Δ*η =
1, m_η = 0 otherwise.

*Hypotheses.*
- F a number field; V odd-dimensional with trivial discriminant; Φ generic elliptic.
- For split SO(V) this is Arthur's Theorem 1.5.2; for non-split SO(V) Gan–Ichino assume it
  (their hypothesis (6.1) with the decomposition of §3.1), and Ishimoto proves it for generic
  parameters; conditional on ML.0/arthur-dependency-gate.

*Construction and proof.*
- Split case: ML.4/arthur-multiplicity-formula.
- Non-split case: comparison of the trace formula of SO(V) with that of its quasi-split inner
  form (Ishimoto, following Kaletha–Mínguez–Shin–White's method for unitary groups), using the
  local results of ML.4/vogan-packets-so-v.

*Acceptance.*
- Gan–Ichino's Theorem 1.4 (the multiplicity formula for Mp_{2n}) is stated under this
  hypothesis; the node keeps the hypothesis visible for every consumer.

*Depends on:* `ML.4/vogan-packets-so-v`, `ML.4/arthur-multiplicity-formula`,
`ML.4/kmsw-inner-forms`, `ML.4/trace-formula-inputs-register`, `ML.0/arthur-dependency-gate`.

*Source.*
- gan-ichino-2018, §6.2, (6.1), p. 22 (arXiv v3); published p. 993 — Gan–Ichino (6.1): Arthur's multiplicity formula for SO(V), assumed
  when SO(V) is non-split.
- gan-ichino-2018, §3.1, p. 10 (arXiv v3); published p. 977 — Gan–Ichino §3.1: the decomposition
  by parameters, expected for non-split SO(V).

#### `ML.4/packet-member-irreducibility` — Irreducibility of the induced representations building almost tempered packets (Gan–Ichino, Lemmas 5.1 and 5.5)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.induced_irreducible_of_almostTempered` in `TauCeti/RepresentationTheory/ArthurClassification`.

(Lemma 5.1) Let F be local of characteristic 0, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀ an almost tempered symplectic
parameter, V = H^k ⊕ V₀ (k = dim ϕ), Q ⊂ SO(V) the parabolic with Levi GL_k × SO(V₀) and τ ∈
Irr GL_k(F) attached to ϕ. Then Ind_Q^{SO(V)}(τ ⊗ σ₀) is irreducible for every σ₀ ∈
Π_{φ₀}(SO(V₀)). (Lemma 5.5) Let φ′ = φ ⊕ S_{2r−2n} with φ a 2n-dimensional almost tempered
symplectic representation of L_F, 2n < r − 1, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀, φ′₀ = φ₀ ⊕ S_{2r−2n}, Q′ ⊂
SO_{2r+1} with Levi GL_k × SO_{2r−2k+1}. Then Ind_{Q′}^{SO_{2r+1}}(τ ⊗ σ′₀) is irreducible for
every irreducible subrepresentation σ′₀ of every member of the A-packet Π_{φ′₀}(SO_{2r−2k+1}).

*Hypotheses.*
- F local of characteristic 0; 'almost tempered' as in Gan–Ichino §5.2: ϕ with exponents in
  (−1/2, 1/2) after the tempered part is split off.

*Construction and proof.*
- Lemma 5.1, F non-archimedean: Mœglin–Waldspurger §2.14 with the Gross–Prasad–Rallis
  conjecture proved by Gan–Ichino (Appendix B of their Formal degrees paper); archimedean F by
  Arthur's refined inductive property.
- Lemma 5.5: Mœglin (non-archimedean) and Mœglin–Renard (F = ℂ).

*Acceptance.*
- The lemmas are what makes the members σ_η of almost tempered packets irreducible (Gan–Ichino
  Proposition 5.4).

*Depends on:* `ML.4/vogan-packets-so-v`, `ML.4/local-arthur-packets`.

*Source.*
- gan-ichino-2018, §5.2, Lemma 5.1 and proof, p. 18 (arXiv v3); published p. 987 — Gan–Ichino Lemma 5.1.
- gan-ichino-2018, §5.4, Lemma 5.5 and proof, p. 20 (arXiv v3); published p. 990 — Gan–Ichino Lemma 5.5.

#### `ML.4/generic-packets-standard-modules` — Members of generic L-packets of classical groups are irreducible standard modules (Jiang–Zhang, Proposition B.1)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.genericPacket_standardModule` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be a local field of characteristic 0, G a classical group over F (quasi-split, or a pure
inner form) and φ a generic L-parameter (its L-packet contains a generic member for some
Whittaker datum of the quasi-split form). Then every member of the L-packet Π_φ(G) is an
irreducible standard module, i.e. the full induced representation from the tempered data of its
Langlands quotient is irreducible.

*Hypotheses.*
- F local of characteristic 0; G classical (symplectic, orthogonal or unitary, or a pure inner
  form); φ generic.
- Conditional through the packets used (ML.0/arthur-dependency-gate).

*Construction and proof.*
- Mœglin–Waldspurger (generic packets and standard modules), Gan–Ichino (the
  Gross–Prasad–Rallis conjecture), Heiermann (the standard module conjecture for classical
  groups), Adams–Barbasch–Vogan (archimedean case), as assembled in Jiang–Zhang Appendix B.

*Acceptance.*
- For G = GL_n (not classical, but the model case) the statement is Zelevinsky's standard
  module result for generic representations.

*Depends on:* `ML.4/local-arthur-packets`, `ML.4/vogan-packets-so-v`,
`ML.0/arthur-dependency-gate`.

*Source.*
- jiang-zhang-2020, Appendix B, Proposition B.1 and proof, p. 85 (arXiv v4); published p. 818:
  “If F is non-archimedean, this proposition is proved by Mœglin and Waldspurger in [68] for
  orthogonal groups, by Gan and Ichino in [18, Proposition 9.1], and by Heiermann in [29] for
  general reductive groups.” — Jiang–Zhang Proposition B.1 and its proof.

#### `ML.4/gan-takeda-llc-gsp4` — The local Langlands correspondence for GSp₄ (Gan–Takeda) ★

*Kind:* theorem. *Planet:* Local Langlands correspondence for GSp₄.
*Declaration:* `TauCeti.Arthur.recGT` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let K be a non-archimedean local field of characteristic 0. There is a surjective finite-to-one
map rec_GT : π ↦ φ_π from irreducible smooth complex representations of GSp₄(K) to
GSp₄(ℂ)-conjugacy classes of L-parameters WD_K → GSp₄(ℂ) such that: (i) π is essentially
discrete series iff φ_π does not factor through a proper Levi subgroup; (ii) the fibre
(L-packet) L_φ is parametrised by the characters of A_φ = π₀(Z(Im φ)/Z_{GSp₄}), which is
trivial or ℤ/2ℤ, and when A_φ = ℤ/2ℤ exactly one member, the one indexed by the trivial
character, is generic; (iii) the similitude character of φ_π is ω_π; (iv) φ_{π ⊗ (χ ∘ ν)} = φ_π
⊗ χ; (v) for π generic or non-supercuspidal and every irreducible σ of GL_r(K), the γ-, L- and
ε-factors of π × σ (Shahidi) equal those of φ_π ⊗ φ_σ; (vi) the analogous identity of
Plancherel measures for non-generic supercuspidal π; (vii) L_φ contains a generic
representation iff the adjoint L-factor L(s, ad ∘ φ) is holomorphic at s = 1; (viii) the map is
uniquely determined by (i), (iii), (v) and (vi) with r ≤ 2. BCGP normalise it so that rec_GT(π
⊗ (χ ∘ ν)) = rec_GT(π) ⊗ rec(χ) and ν ∘ rec_GT(π) = rec(ω_π), and the Roberts–Schmidt
parameters of constituents of unramified principal series agree with it (Gan–Takeda 2011b,
Proposition 13.1).

*Hypotheses.*
- K non-archimedean of characteristic 0 (BCGP use K/ℚ_l finite); complex coefficients (BCGP
  transport to Q̄_p through ı, ML.0/gsp4-galois-l-packet).

*Construction and proof.*
- Gan–Takeda construct rec_GT through the theta correspondences for (GSp₄, GO(V)) with dim V =
  4, 6 and the LLC for GL₂, GL₄ (Harris–Taylor, Henniart) and for the inner forms, and prove
  the properties by computing γ-factors.
- Unramified principal series: comparison with Roberts–Schmidt's tables (Gan–Takeda 2011b,
  Proposition 13.1); BCGP Proposition 2.4.6 records the consequences (Sally–Tadić
  irreducibility criterion and rec_GT of constituents).

*Acceptance.*
- Check BCGP Proposition 2.4.6: χ₁ × χ₂ ⋊ σ is irreducible iff none of χ₁, χ₂, χ₁χ₂^{±1} is
  |·|^{±1}, and rec_GT(π)^{ss} = σ ⊗ (χ₁χ₂ ⊕ χ₁ ⊕ χ₂ ⊕ 1) (characters through Art_K^{−1}) for
  every constituent π.

*Depends on:* `EndoscopicTransferAndUnitaryTraceComparison:ET.6`,
`GL2AutomorphicRepresentationsAndTransfer:R16.3`, `MetaplecticAutomorphicForms:MP.3`.

*Source.*
- bcgp-2021, §2.3, p. 18 (arXiv v3) — BCGP §2.3 recall rec_GT as a
  surjective finite-to-one map with its normalisations.
- bcgp-2021, Proof of Proposition 2.4.22, §2.4.21, p. 25 (arXiv v3) — BCGP use part (vii) of Gan–Takeda's main theorem (generic member iff the
  adjoint L-factor is holomorphic at s = 1).

#### `ML.4/gsp4-arthur-classification` — Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi) ★

*Kind:* theorem. *Planet:* Arthur's classification for GSp₄.
*Declaration:* `TauCeti.Arthur.GSp4.classification` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be a number field. Every discrete automorphic representation π of GSp₄(𝔸_F) has a
transfer π̃ to GL₄(𝔸_F) (its global parameter) of one of the six types (a)–(f) of
ML.4/gsp4-discrete-spectrum-types, and the discrete spectrum is described by Arthur's
multiplicity formula for GSp₄. In particular: (i) the transfer is compatible with rec_GT at
every finite place; (ii) for a parameter ψ = π̃ ⊠ 1 of general type the global component group
S_ψ is trivial, so for every choice of local packet members π′_v ∈ Π_{ψ_v} (π′_v unramified for
almost all v) ⊗′_v π′_v is automorphic; (iii) such representations occur with multiplicity one;
and for a general-type ψ the archimedean packet Π_{ψ_∞} is the L-packet of the archimedean
parameter.

*Hypotheses.*
- F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni
  over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete
  automorphic representation of GSp₄(𝔸_F) with central character ω_π.
- Conditional on ML.0/arthur-dependency-gate: Gee–Taïbi prove Arthur's 2004 announcement from
  Arthur 2013 for Sp₄ and SO₅, and the result is only as unconditional as Arthur 2013 and
  Mœglin–Waldspurger's stabilisation.

*Construction and proof.*
- Gee–Taïbi: restrict from GSp₄ to Sp₄ and use Arthur's classification for Sp₄ (Ĝ = SO₅) and
  for SO₅ ≅ PGSp₄ (Ĝ = Sp₄), together with the similitude character, and prove compatibility
  with rec_GT.
- Parts (ii)–(iii) for general type: ψ is stable (S_ψ = 1), so ε_ψ = 1 and every member of the
  global packet occurs once.

*Acceptance.*
- Calegari–Geraghty Theorem 7.11 and Pilloni Proposition 15.2.4.1 use exactly (ii) and (iii) to
  move between the holomorphic and generic limits of discrete series at infinity.

*Depends on:* `ML.4/gsp4-discrete-spectrum-types`, `ML.4/arthur-multiplicity-formula`,
`ML.4/gan-takeda-llc-gsp4`, `ML.4/symplectic-branch-status`, `ML.0/arthur-dependency-gate`.

*Source.*
- cg-2020, Proof of Theorem 7.11, §7.2, publ. p. 854; arXiv v1 p. 40 — Calegari–Geraghty quote the six classes (a)–(f)
  of Arthur's classification.
- cg-2020, Proof of Theorem 7.11, publ. p. 855 (copy p. 55) — Part (ii) of Arthur's classification theorem as used by
  Calegari–Geraghty.
- bcgp-2021, §2.9 'Arthur's classification', first paragraph, p. 38 (arXiv v3) — BCGP §2.9: Gee–Taïbi prove the classification
  announced by Arthur and its compatibility with rec_GT.

#### `ML.4/non-general-type-reducible` — Discrete representations of GSp₄ not of general type have reducible Galois representations (BCGP Lemma 2.9.1)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.GSp4.reducible_of_not_generalType` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be totally real and π a discrete automorphic representation of GSp₄(𝔸_F) such that for
each v | ∞, π_v has the infinitesimal character of the L-packet of φ_{(2; k_v−1, l_v−2)} with
k_v ≡ l_v (mod 2) and k_v ≥ l_v ≥ 2. If π is not of general type, there is a compatible system
of reducible Galois representations ρ_{π,p} : G_F → GSp₄(Q̄_p) with WD(ρ_{π,p}|_{G_{F_v}})^{ss}
≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2})^{ss} for all but finitely many v. Pilloni (§5.1.7) records the
same for F = ℚ and discrete-series π_∞: in types (b)–(f), ρ_{π,λ} is a sum of representations
attached to GL₁ and regular algebraic GL₂ forms. For general type, irreducibility of ρ_{π,p} is
only expected (BCGP Remark 2.9.2).

*Hypotheses.*
- F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni
  over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete
  automorphic representation of GSp₄(𝔸_F) with central character ω_π.
- The archimedean condition of the lemma; conditional on ML.0/arthur-dependency-gate.

*Construction and proof.*
- By ML.4/gsp4-arthur-classification, π falls into one of the classes (b)–(f).
- In each class the transfer is an isobaric sum of Hecke characters and cuspidal GL₂
  representations (possibly twisted by |·|^{±1/2}), all regular algebraic or algebraic by the
  archimedean condition; take the sum of their Galois representations (class field theory;
  AutomorphicGaloisRepresentations for Hilbert modular forms).
- In class (b) the GL₂ constituents have central character ω_π (BCGP print µ_π: recorded as a
  source issue).

*Acceptance.*
- Check case (b): a Yoshida lift has ρ_{π,p} = ρ_{μ₁,p} ⊕ ρ_{μ₂,p}.

*Depends on:* `ML.4/gsp4-arthur-classification`, `ML.0/gsp4-galois-l-packet`,
`AutomorphicGaloisRepresentations:R19.1`.

*Source.*
- bcgp-2021, Lemma 2.9.1, §2.9, p. 38 (arXiv v3) — BCGP Lemma 2.9.1.
- pilloni-2020, §5.1.7, paragraph after Remark 5.1.7.1, p. 23 (author version 17 June 2019):
  “According to Arthur’s classiﬁcation [1], the representation π in the theorem can fall into
  six categories.” — Pilloni §5.1.7: the six categories and the reducibility outside general
  type.

#### `ML.4/gl4-symplectic-descent` — Descent from GL₄ of symplectic type to GSp₄ (BCGP Theorem 2.9.3)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.GSp4.descent_of_symplecticType` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be totally real and Π a cuspidal automorphic representation of GL₄(𝔸_F) of symplectic
type with multiplier χ. Then there is a discrete automorphic representation π of GSp₄(𝔸_F) with
central character χ whose transfer is Π. More precisely, if for each place v π_v is any element
of the L-packet corresponding to (rec_p(Π_v), χ_v), then π := ⊗′_v π_v is automorphic and
occurs with multiplicity one in the discrete spectrum; if moreover Π is algebraic, π is
cuspidal.

*Hypotheses.*
- F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni
  over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete
  automorphic representation of GSp₄(𝔸_F) with central character ω_π.
- Π cuspidal of symplectic type with multiplier χ; conditional on ML.0/arthur-dependency-gate.

*Construction and proof.*
- The first two statements are immediate from the multiplicity formula of
  ML.4/gsp4-arthur-classification (S_ψ = 1 for ψ = Π ⊠ 1).
- Cuspidality for algebraic Π: Clozel's purity lemma makes Π_∞ essentially tempered, and
  Wallach's criterion (a discrete representation with tempered archimedean component is
  cuspidal) applies.

*Acceptance.*
- Consumers: BCGP Lemma 8.3.2 (soluble descent of GSp₄ automorphy), Theorem 9.3.1 and §7.13.

*Depends on:* `ML.4/gsp4-arthur-classification`, `AutomorphicFormsOnReductiveGroups:AF.4`.

*Source.*
- bcgp-2021, Theorem 2.9.3, §2.9, p. 39 (arXiv v3) — BCGP Theorem 2.9.3.
- bcgp-2021, Proof of Theorem 2.9.3, p. 39 (arXiv v3) —
  BCGP's proof: immediate from the multiplicity formula proved by Gee–Taïbi.

#### `ML.4/shahidi-exterior-square` — Holomorphy and non-vanishing of twisted exterior-square L-functions on Re s = 1 (Shahidi)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.exteriorSquare_nonvanishing` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let Π be a cuspidal automorphic representation of GL₄(𝔸_F) (more generally GL_{2n}) and ω a
unitary Hecke character. Then the partial L-function L^S(s, Π, ∧² ⊗ ω) is non-vanishing on Re s
= 1 and holomorphic there except for at most a simple pole at s = 1, which occurs iff Π is of
symplectic type with multiplier ω^{−1}. Consequently, for a cyclic extension F′/F of prime
degree and Π′ = BC_{F′/F}(Π) cuspidal, in the factorisation L^S(s, Π′, ∧² ⊗ ω_{F′}) = ∏_ψ
L^S(s, Π, ∧² ⊗ ωψ) over the characters ψ of 𝔸_F^×/F^×N𝔸_{F′}^× at most one factor has a pole at
s = 1, all others being holomorphic and non-zero there.

*Hypotheses.*
- F a number field; Π cuspidal on GL₄(𝔸_F); ω unitary.
- The 'at most one pole' clause uses, besides Shahidi's non-vanishing, that two poles would
  force Π ≅ Π ⊗ ψψ′^{−1}, impossible for Π′ cuspidal (BCGP's use; recorded in the node, not in
  Shahidi).

*Construction and proof.*
- Shahidi 1997 (Pacific J. Math.): the Langlands–Shahidi method for the Levi GL₄ in Spin₁₀ (or
  GL_{2n} in GSpin_{4n+2}) gives continuation and non-vanishing on Re s = 1
  (AutomorphicLFunctionsAndLocalFactors).
- Pole criterion: definition of symplectic type (ML.4/gsp4-discrete-spectrum-types).
- Factorisation: base change of unramified local factors.

*Acceptance.*
- BCGP Lemma 8.3.2 deduces from this that a GSp₄ representation over F′ whose transfer is a
  base change descends to F.

*Depends on:* `ML.4/gsp4-discrete-spectrum-types`, `AutomorphicLFunctionsAndLocalFactors:AL.4`.

*Source.*
- bcgp-2021, Proof of Lemma 8.3.2, §8.3, p. 247 (arXiv v3) — BCGP's use of Shahidi 1997 in the proof of Lemma 8.3.2.

#### `ML.4/gsp4-archimedean-limit-packets` — The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.GSp4.limitPacket` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let λ = (λ₁, 0; c) with λ₁ < 0. The limits of discrete series of GSp₄(ℝ) with infinitesimal
character λ attached to the two Weyl chambers positive for λ are π(λ)^h (containing the
holomorphic and antiholomorphic limits of discrete series of Sp₄(ℝ)) and π(λ)^g (the generic
one), and the archimedean L-packet containing π(λ)^h is {π(λ)^g, π(λ)^h}
(Blasius–Harris–Ramakrishnan, Proposition 5.3.7). In Calegari–Geraghty's notation this is the
packet {π(λ, C₀), π(λ, C₁)}, λ = (a − 1, 0; 4 − a), and for a global parameter ψ of general
type the archimedean Arthur packet Π_{ψ_∞} is this L-packet.

*Hypotheses.*
- λ = (λ₁, 0; c) with λ₁ < 0 (Pilloni's Proposition 15.2.4.1 prints λ₁ > 0: recorded as a
  source issue).
- The identification of Π_{ψ_∞} with the L-packet uses Arthur's classification
  (ML.0/arthur-dependency-gate).

*Construction and proof.*
- Harish-Chandra parametrisation of (limits of) discrete series by Weyl chambers
  (AutomorphicFormsOnReductiveGroups).
- Blasius–Harris–Ramakrishnan Proposition 5.3.7 / Mok §3.1: the L-packet of the parameter with
  infinitesimal character λ.
- For general-type ψ, ψ_∞ is trivial on SL₂ (S_ψ = 1), so Π_{ψ_∞} is the L-packet (Wallach
  Theorem 2.1, as cited by CG).

*Acceptance.*
- Pilloni's Proposition 15.2.4.1 and CG's Theorem 7.11 switch between π(λ)^h and π(λ)^g using
  this packet.

*Depends on:* `ML.4/gsp4-arthur-classification`, `ML.0/archimedean-langlands-conventions`,
`AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`.

*Source.*
- pilloni-2020, §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version) — Pilloni: Π_∞
  is the L-packet {π(λ)^g, π(λ)^h} (BHR Prop. 5.3.7).
- cg-2020, Proof of Theorem 7.11, point (2), publ. p. 855; arXiv v1 p. 41 — Calegari–Geraghty:
  the packet consists of the pair π(λ, C₀), π(λ, C₁).

#### `ML.4/limit-discrete-series-packet-types` — Global packets with a holomorphic limit of discrete series at infinity are of general, Yoshida or Saito–Kurokawa type

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.GSp4.generalType_of_limitDiscreteSeries` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let π = π_f ⊗ π(λ)^h be a discrete automorphic representation of GSp₄(𝔸_ℚ) with λ = (λ₁, 0; c),
λ₁ < 0. Then its global Arthur packet is of general, Yoshida or Saito–Kurokawa type (Schmidt
2018, §§1.1–1.2, compared with the archimedean parameters of π(λ)^h in Schmidt 2017). If
moreover the Hecke eigensystem of π_f is congruent to a non-Eisenstein maximal ideal (residual
Galois representation irreducible), the packet is of general type, and then π_f ⊗ π(λ)^h is
automorphic iff π_f ⊗ π(λ)^g is, both with multiplicity one (Pilloni, Proposition 15.2.4.1).

*Hypotheses.*
- F = ℚ; λ₁ < 0; conditional on ML.0/arthur-dependency-gate.

*Construction and proof.*
- Compare the archimedean parameter of π(λ)^h with the archimedean components allowed in each
  of Arthur's six types (Schmidt's tables).
- Yoshida and Saito–Kurokawa types give reducible Galois representations
  (ML.4/non-general-type-reducible), contradicting irreducibility of the residual
  representation.
- For general type: ML.4/gsp4-archimedean-limit-packets and parts (ii)–(iii) of
  ML.4/gsp4-arthur-classification. Pilloni's 'hence Π is stable and tempered' overstates Arthur
  (temperedness needs Ramanujan); what is used is that ψ is trivial on SL₂ (recorded as a
  source issue).

*Acceptance.*
- Calegari–Geraghty's proof of Theorem 7.11 excludes classes (b)–(f) by the same reducibility
  argument in weight (a, 2).

*Depends on:* `ML.4/gsp4-archimedean-limit-packets`, `ML.4/non-general-type-reducible`,
`ML.4/gsp4-arthur-classification`.

*Source.*
- pilloni-2020, §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version) — Pilloni: Π can be of
  generic, Yoshida or Saito–Kurokawa type.
- pilloni-2020, §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version) — Pilloni
  Proposition 15.2.4.1.

#### `ML.4/gsp4-gl4-archimedean-transfer` — Infinitesimal character of the transfer of π_∞ from GSp₄(ℝ) to GL₄(ℝ) (Calegari–Geraghty Theorem 5.6)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.GSp4.transfer_infinitesimalCharacter` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let µ = (a, b; c) be a dominant weight, w = −(a + b + 2c), and π = π^∞ ⊗ π_∞ a discrete
automorphic representation of GSp₄(𝔸_ℚ) contributing to the coherent cohomology H^i(X,
W_µ)_(2). Then (1) π_∞ has infinitesimal character χ_{(a−1, b−2; −w)}; (2) the transfer π̃_∞ of
π_∞ to GL₄(ℝ) (the archimedean parameter composed with the spin embedding GSp₄(ℂ) ⊂ GL₄(ℂ)) has
infinitesimal character χ_τ with τ = ((a+b−3−w)/2, (a−b+1−w)/2, (−a+b−1−w)/2, (−a−b+3−w)/2);
(3) if π_∞ is tempered it is the (limit of) discrete series π((a−1, b−2; −w), C_i) for a
chamber C_i.

*Hypotheses.*
- F = ℚ; Calegari–Geraghty's normalisation of weights and of coherent cohomology (§5.3).

*Construction and proof.*
- (1) from the (𝔭, K)-cohomology computation of π_∞ ⊗ V_σ (Harris; CG §5.3).
- (2) the weights of the spin representation: with (λ₁, λ₂; λ₀) = (a−1, b−2; −w), τ =
  ((λ₁+λ₂+λ₀)/2, (λ₁−λ₂+λ₀)/2, (−λ₁+λ₂+λ₀)/2, (−λ₁−λ₂+λ₀)/2) (Sorensen §2.1.2).
- (3) tempered representations with regular-or-singular integral infinitesimal character are
  (limits of) discrete series.

*Acceptance.*
- CG Remark 5.12: for µ = (a, b), w = a + b − 6, τ = (0, −(b−2), −(a−1), −(a+b−3)) + (3/2)(1,
  1, 1, 1), consistent with (2).

*Depends on:* `ML.0/archimedean-langlands-conventions`, `ML.4/gsp4-archimedean-limit-packets`,
`AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`.

*Source.*
- cg-2020, Theorem 5.6(2), §5.3, publ. p. 829; quoted from arXiv v1 p. 22 — Calegari–Geraghty Theorem 5.6(2).
- cg-2020, Proof of Theorem 5.6, publ. p. 829 (copy p. 29) — CG: the second part can be inferred from Sorensen §2.1.2.

#### `ML.4/unitary-descent-of-gl4-transfer` — Descent of the GL₄ transfer of a Siegel form to a unitary group, and the symplectic sign

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.GSp4.symplectic_of_unitaryDescent` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let f be a cuspidal Siegel eigenform for GSp₄/ℚ of general type, π the transfer to GL₄(𝔸_ℚ) of
the automorphic representation it generates, and r_f its ℓ-adic Galois representations. Choose
an imaginary quadratic K/ℚ such that r_f|_{G_K} is absolutely irreducible. Then BC_{K/ℚ}(π) is
conjugate self-dual and descends to an automorphic representation Π of a unitary group U(4)
over ℚ (Mok), whose Galois representations are r_f|_{G_K}; by Bellaïche–Chenevier's sign
theorem the pairing preserved by r_f is symplectic, so an absolutely irreducible reduction r̄_m
preserves a symplectic pairing (Calegari–Geraghty, Lemma 6.9).

*Hypotheses.*
- f of general type; K imaginary quadratic with r_f|_{G_K} absolutely irreducible.
- Conditional on ML.0/arthur-dependency-gate (the transfer and Mok's descent).

*Construction and proof.*
- Transfer π: ML.4/gsp4-arthur-classification.
- Base change to K: Arthur–Clozel (EndoscopicTransferAndUnitaryTraceComparison ET.7a);
  conjugate self-duality from π ≅ π^∨ ⊗ ω.
- Descent to U(4): ML.4/mok-unitary-classification (a conjugate-self-dual cuspidal of sign
  (−1)^{N−1} = −1 for N = 4 is a simple generic parameter of U(4)).
- Sign: Bellaïche–Chenevier (Compositio 2011, Theorem 1.2). CG state the descent without these
  details (recorded as a source issue).

*Acceptance.*
- The conclusion used by CG: r̄_m symplectic when absolutely irreducible.

*Depends on:* `ML.4/gsp4-arthur-classification`, `ML.4/mok-unitary-classification`,
`EndoscopicTransferAndUnitaryTraceComparison:ET.7a`,
`AutomorphicGaloisRepresentationsPartII:AG2.2`.

*Source.*
- cg-2020, Proof of Lemma 6.9, §6.2, publ. p. 840 (copy p. 40); arXiv v1 p. 30 —
  Calegari–Geraghty's proof of Lemma 6.9.

#### `ML.4/xu-gsp2n-packets` — Xu's L-packets for similitude groups GSp_{2n} (as used for PGSp₆)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.xuPacket` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be a non-archimedean local field of characteristic 0 and φ♭ an L-parameter of Sp_{2n}
whose L-packet Π_{φ♭} has trivial central character (for n = 3: φ♭ lifts to Spin₇(ℂ)). Let
Π̃_{φ♭} be the set of irreducible representations of PGSp_{2n}(F) whose restriction to
Sp_{2n}(F) has constituents in Π_{φ♭}, and Φ̃_{φ♭} the finite set of lifts φ of φ♭ to the dual
group of PGSp_{2n}, a homogeneous set under Hom(W_F, μ₂). Xu partitions Π̃_{φ♭} into packets
Π̃^X_{φ♭} with: (a) the packets are the twists Π̃^X_{φ♭} ⊗ χ by quadratic characters χ of the
similitude; (b) restriction to Sp_{2n} gives a bijection Π̃^X_{φ♭} → Π_{φ♭}/PGSp_{2n}(F); (c)
there is a natural bijection Π̃^X_{φ♭} ↔ Irr(S_φ/Z) for any lift φ ∈ Φ̃_{φ♭}; (d) with respect
to (c) the packets satisfy the stability and endoscopic character identities; (e) the
stabiliser of a member in Hom(F^×, μ₂) equals the stabiliser of φ in Hom(W_F, μ₂), so the
packets and the lifts are non-canonically isomorphic homogeneous sets. Xu does not determine
which lift φ is the parameter of which packet.

*Hypotheses.*
- F non-archimedean of characteristic 0; statement as specialised by Gan–Savin to n = 3;
  conditional through Arthur's classification for Sp_{2n} (ML.0/arthur-dependency-gate).

*Construction and proof.*
- Xu (Compositio 2016, Prop. 6.27–6.28, Thm 6.30; Math. Ann. 2017, Prop. 4.4, Thm 4.6; Amer. J.
  Math. 2025, Thm 4.1): restrict to Sp_{2n}, use Arthur's packets there and the twisted
  endoscopic character identities for GSp_{2n}.
- Gan–Savin §9 resolve the matching of (e) when φ♭ factors through G₂.

*Acceptance.*
- For n = 2 Xu's packets for GSp₄ agree with the Gan–Takeda L-packets
  (ML.4/gan-takeda-llc-gsp4) up to the ambiguity (e).

*Depends on:* `ML.4/local-arthur-packets`, `ML.4/extended-langlands-parameter`,
`ML.0/arthur-dependency-gate`.

*Source.*
- gan-savin-2023-g2, §7, (7.1), p. 22 (published) — Gan–Savin (7.1)–(7.2): the sets Π̃_{φ♭} and
  Φ̃_{φ♭}.
- gan-savin-2023-g2, §7 (a)–(b), p. 22 (published) — Gan–Savin §7 (a)–(b).
- gan-savin-2023-g2, §7 (e), p. 23 (published) — Gan–Savin §7 (e).

#### `ML.4/xu-multiplicity-formula` — Xu's multiplicity formula for the tempered discrete spectrum of PGSp_{2n}

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.xu_multiplicity_formula` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let F be a number field. Xu describes the tempered part of the discrete automorphic spectrum of
PGSp_{2n} (as used: n = 3) by global packets Π̃^X_{Ψ♭} = ⊗_v Π̃^X_{Ψ♭_v} built from the local
packets of ML.4/xu-gsp2n-packets, indexed by generic A-parameters Ψ♭ of Sp_{2n}, with an
Arthur-type multiplicity formula. In particular, if Σ is a cuspidal automorphic representation
of PGSp₆ whose restriction to Sp₆ has a generic A-parameter Ψ♭ with trivial global component
group, every element of the global packet containing Σ is automorphic.

*Hypotheses.*
- F a number field; tempered part only; conditional through Arthur's classification
  (ML.0/arthur-dependency-gate).

*Construction and proof.*
- Xu (Amer. J. Math. 2025, Theorem 4.1): from Arthur's multiplicity formula for Sp_{2n} and the
  local results (a)–(e).
- Trivial component group: ε_Ψ = 1 and the sign condition is empty, so every member occurs.

*Acceptance.*
- Gan–Savin §12.8 apply it to a cuspidal Σ on PGSp₆ in the proof of Theorem 12.7.

*Depends on:* `ML.4/xu-gsp2n-packets`, `ML.4/arthur-multiplicity-formula`,
`ML.0/arthur-dependency-gate`.

*Source.*
- gan-savin-2023-g2, §7 (f), p. 23 (published) — Gan–Savin §7 (f).
- gan-savin-2023-g2, §12.8, proof of Theorem 12.7, pp. 39–40 (published) —
  Gan–Savin §12.8.

#### `ML.4/adams-johnson-packets` — Archimedean Arthur packets of cohomological parameters are Adams–Johnson packets

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.adamsJohnson_eq_arthurPacket` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let G be a real form of a symplectic, special orthogonal or unitary group which is quasi-split,
and ψ_ℝ a cohomological (Adams–Johnson) Arthur parameter, i.e. one whose restriction to ℂ^× ×
SL₂(ℂ) has regular integral infinitesimal character and factors through a Levi L as ξ ∘ ψ_L
with Π_{ψ_L} a single unitary character. Then Arthur's packet Π(ψ_ℝ) coincides with the
Adams–Johnson packet {A_{𝔮_w}(w^{−1}λ)} of cohomologically induced modules, each member
occurring with multiplicity one, and the characters ⟨·, π⟩ are those predicted by Adams–Johnson
(Arancibia–Mœglin–Renard for the symplectic and orthogonal groups; Arancibia–Mœglin–Renard and
Johnson's description for U(p, q)).

*Hypotheses.*
- G quasi-split real symplectic, special orthogonal or unitary; ψ_ℝ cohomological.
- Global applications (Chenevier–Taïbi; Ichino–Prasanna) are conditional on
  ML.0/arthur-dependency-gate; Ichino–Prasanna use KMSW Theorem* 1.7.1 for non-generic
  parameters, which KMSW prove only for generic ones (recorded at the node).

*Construction and proof.*
- Arancibia–Mœglin–Renard (Ann. Fac. Sci. Toulouse 2018): compare Arthur's endoscopic character
  identities with Adams–Johnson's stable combinations of cohomologically induced modules
  A_𝔮(λ).
- For U(p, q) the representatives w ∈ (𝔖_{n₁} × ⋯ × 𝔖_{n_r})\𝔖_n/(𝔖_p × 𝔖_q) index the members
  (Ichino–Prasanna §11.2).

*Acceptance.*
- Chenevier–Taïbi (5.2.1): for Sp_{2g} and holomorphic discrete series ρ_k (k_g > g), ρ_k ∈
  Π(ψ_ℝ) iff d_{i₀} = 1, with the character values given there.

*Depends on:* `ML.4/local-arthur-packets`, `ML.4/mok-unitary-classification`,
`AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`, `ML.0/arthur-dependency-gate`.

*Source.*
- chenevier-taibi-2020, §5.2.1, p. 303 (published) —
  Chenevier–Taïbi §5.2.1: Arthur's packet coincides with Adams–Johnson's (AMR18).
- ichino-prasanna-2023, §11.2, p. 70 (arXiv v2); published p. 81: “Suppose that v is real. If
  Gv is quasi-split and ψv is “cohomological”, then it follows from the result of
  Arancibia-Mœglin-Renard [3] (the unitary group case had already been treated by Johnson
  [32])” — Ichino–Prasanna §11.2: the U(p, q) case.

#### `ML.4/moeglin-renard-packets` — Arthur packets of Sp_{2g}(ℝ) containing scalar unitary lowest weight modules (Mœglin–Renard)

*Kind:* theorem.
*Declaration:* `TauCeti.Arthur.moeglinRenard_packet` in `TauCeti/RepresentationTheory/ArthurClassification`.

Let ρ_k(g) be the scalar holomorphic unitary lowest weight module of Sp_{2g}(ℝ) of weight k, 1
≤ k ≤ g (singular infinitesimal character). For a global Arthur parameter ψ of Sp_{2g} with ψ_∞
of the corresponding infinitesimal character, ρ_k(g) ∈ Π(ψ_ℝ) iff ψ is in one of two cases: (I)
([MR, Thm 7.1(i)], whose content Chenevier–Taïbi do not reproduce) or (H) ([MR, Thm 7.1(ii)],
with subcases (H1): some i₀ with d_{i₀} = 2(g − k) + 1 and L((π_{i₀})_∞) containing ε_{ℂ/ℝ}^k,
(H2): some i₀ with d_{i₀} = 2(g − k) + 3 and L((π_{i₀})_∞) containing ε_{ℂ/ℝ}^{k−1}). In both
cases ρ_k(g) has multiplicity one in Π(ψ_ℝ), and its character χ_{ρ_k(g)} is given by [MR,
Prop. 18.3] in terms of a sign δ representing the archimedean Whittaker datum; its restriction
to C_ψ does not depend on δ.

*Hypotheses.*
- Sp_{2g}(ℝ); 1 ≤ k ≤ g; conditional for global uses on ML.0/arthur-dependency-gate.

*Construction and proof.*
- Mœglin–Renard (Nagoya Math. J. 2019): explicit description of archimedean Arthur packets of
  Sp_{2g}(ℝ) with unipotent-type infinitesimal character via cohomological induction and Aubert
  duality.
- Chenevier–Taïbi §5.2.2 translate their n, m, π_n(m)* into g, k, ρ_k(g).

*Acceptance.*
- Used by Chenevier–Taïbi to count level-one Siegel modular forms of small weight.

*Depends on:* `ML.4/local-arthur-packets`,
`AutomorphicFormsOnReductiveGroups:AF.1/discrete-series`, `ML.0/arthur-dependency-gate`.

*Source.*
- chenevier-taibi-2020, §5.2.2, pp. 303–305 (published) — Chenevier–Taïbi §5.2.2: the two cases (I) and (H).
- chenevier-taibi-2020, §5.2.2, case (H), p. 305 (published): “Case (H). — This corresponds to
  case (ii) in [MR, Théorème 7.1]. According to Theorem 7.2 loc. cit. there are two subcases:”
  — Chenevier–Taïbi §5.2.2: case (H) and its subcases.

**Remaining refinements.**
- Arthur's, Mok's and KMSW's proofs are external conditional inputs (gap); a constructive owner
  (RT-AREA-langlands-3/1 option (a)) is proposed in `restructure`.
- Sources read on secondary quotation only: Mœglin–Renard, Arancibia–Mœglin–Renard, Xu's
  papers, Schmidt 2017/2018, Blasius–Harris–Ramakrishnan, Sorensen, Shahidi 1997.

## Layer ML.5: Known functorial transfers and frontiers (`TauCeti/NumberTheory/Functoriality/…`)

ML.5 registers the transfers with exact hypotheses and owners — cyclic and soluble base change
and automorphic induction (EndoscopicTransferAndUnitaryTraceComparison ET.7a; GL₂ cases R17.4,
R17.5 by RS-21), the generic transfer from classical groups
(Cogdell–Kim–Piatetski-Shapiro–Shahidi) with the descent of Ginzburg–Rallis–Soudry and
Jiang–Soudry, and Gan–Ichino's local descent — and states the frontier conjectures as
propositions: functoriality, global reciprocity, local Langlands for general groups and
Fargues–Scholze's categorical conjecture. The one conditional implication planned is Langlands'
deduction of Ramanujan from symmetric power functoriality. No general correspondence is
inferred from a semisimple parametrisation or a known GL_n case.

*Coverage.* Checkpoint 3: cyclic/soluble base change for GL_n and the automorphic-induction
register (owners ET.7a, R17.4, R17.5), CKPSS with GRS and Jiang–Soudry, Gan–Ichino's local
descent, the frontier statements (functoriality, reciprocity, local and categorical local
Langlands) and the conditional implication from symmetric power functoriality to Ramanujan.

### Objects

#### `ML.5/functoriality-conjecture` — Langlands' principle of functoriality (frontier statement) ★

*Kind:* definition. *Planet:* Langlands functoriality.
*Declaration:* `TauCeti.Functoriality.Functoriality` in `TauCeti/NumberTheory/Functoriality`.

Let F be a global field, G, G′ connected reductive groups over F with G quasi-split, and ρ :
ᴸG′ → ᴸG an L-homomorphism (compatible with the projections to the Galois group).
Functoriality(G′, G, ρ) is the proposition: for every automorphic representation π′ of G′(𝔸_F)
there is an automorphic representation π of G(𝔸_F) with c_v(π) = ρ(c_v(π′)) (Satake parameters)
for all places v outside a finite set where π and π′ are unramified. The refined form asks
local compatibility through local Langlands at every place. The statement is a conjecture; this
roadmap uses it only as a named hypothesis of conditional implications, and its known cases are
the theorem nodes of ML.5.

*Hypotheses.*
- G quasi-split; ρ an L-homomorphism; frontier statement with status conjectural in
  ML.0/endpoint-status-register.

*Construction and proof.*
- Definition of the proposition; no proof.

*Uses.*
- ModularityAndLanglandsExtensions:ML.5/symmetric-power-functoriality-implies-ramanujan: the
  hypothesis of the conditional implication
- Newton–Thorne 2021, §1: symmetric power functoriality is a special case
- ModularityAndLanglandsExtensions:ML.0/endpoint-status-register: registered as conjectural

| API | role | statement |
|---|---|---|
| `TauCeti.Functoriality.Functoriality` | data | The proposition Functoriality(G′, G, ρ). |
| `TauCeti.Functoriality.Functoriality.comp` | functoriality | Functoriality(G′, G, ρ) and Functoriality(G, G″, ρ′) imply Functoriality(G′, G″, ρ′ ∘ ρ) (weak form). |
| `TauCeti.Functoriality.Functoriality.id` | functoriality | Functoriality(G, G, id) holds. |
| `TauCeti.Functoriality.Functoriality.of_gelbartJacquet` | example | Functoriality(GL₂, GL₃, Sym²) holds (Gelbart–Jacquet). |
| `TauCeti.Functoriality.Functoriality.sym` | other | Functoriality(GL₂, GL_{n+1}, Sym^n) for all n is the symmetric power conjecture of ML.3. |

*Unit tests.*
- `TauCeti.Functoriality.functoriality_trivialGroup` (degenerate): G′ = {1}, G = GL₁:
  Functoriality is the statement that the trivial character is automorphic (true).
- `TauCeti.Functoriality.functoriality_det` (computation): G′ = GL_n, G = GL₁, ρ = det:
  Functoriality holds, the lift of π being ω_π.
- `TauCeti.Functoriality.functoriality_reciprocity` (characterisation): G′ = {1} over F with
  ᴸG′ = Gal(E/F), G = GL_n: Functoriality is the strong Artin conjecture for Galois
  representations of Gal(E/F) (ML.1/strong-artin-conjecture).
- `TauCeti.Functoriality.functoriality_not_from_parameters` (non-example): A semisimple
  parametrisation of local representations (Fargues–Scholze) does not imply any instance of
  Functoriality: the statement asks for automorphic π.

*Acceptance.*
- A known instance (e.g. G′ = GL₂, G = GL₃, ρ = Sym²: ML.3/gelbart-jacquet) proves
  Functoriality for that triple only.

*Depends on:* `ML.3/functorial-lift`, `ML.0/endpoint-status-register`,
`tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

*Source.*
- arthur-2003, §4, Conjecture (Langlands [L1]), pp. 44–45 (Bull. AMS 40 (2003)) — Arthur 2003 §4: Langlands' conjecture (principle of
  functoriality).

#### `ML.5/global-langlands-reciprocity-conjecture` — Global Langlands reciprocity for GL_n (frontier statement)

*Kind:* definition.
*Declaration:* `TauCeti.Functoriality.Reciprocity` in `TauCeti/NumberTheory/Functoriality`.

Reciprocity(F, n) is the proposition: for every continuous irreducible representation r :
Gal(F̄/F) → GL_n(ℂ) with finite image there is a cuspidal automorphic representation π of
GL_n(𝔸_F) with c_v(π) = r(Frob_v) at almost all v (Langlands' conjecture; for G′ = {1} it is
functoriality). Its ℓ-adic refinement (Clozel's conjecture) asks a bijection between regular
algebraic cuspidal π and irreducible geometric ℓ-adic representations with distinct Hodge–Tate
weights. Known: n = 1 (class field theory), n = 2 with soluble image (Langlands–Tunnell), n = 2
odd over ℚ (Khare–Wintenberger), nilpotent image (Arthur–Clozel).

*Hypotheses.*
- Frontier statement; status conjectural in ML.0/endpoint-status-register.

*Construction and proof.*
- Definition of the proposition; the known cases are theorem nodes of ML.1 and the GL₂ roadmap.

*Uses.*
- ModularityAndLanglandsExtensions:ML.1/odd-artin-modularity-over-q: the proved case n = 2,
  odd, over ℚ
- ModularityAndLanglandsExtensions:ML.0/nt26-automorphy-predicate: the automorphy predicate is
  the ℓ-adic matching

| API | role | statement |
|---|---|---|
| `TauCeti.Functoriality.Reciprocity` | data | The proposition Reciprocity(F, n). |
| `TauCeti.Functoriality.Reciprocity.one` | example | Reciprocity(F, 1) holds (class field theory). |
| `TauCeti.Functoriality.Reciprocity.of_functoriality` | relation | Functoriality({1}, GL_n, r) for all r implies Reciprocity(F, n). |
| `TauCeti.Functoriality.Reciprocity.implies_artin` | relation | Reciprocity for r implies the Artin conjecture for r (Godement–Jacquet). |

*Unit tests.*
- `TauCeti.Functoriality.reciprocity_gl1` (degenerate): n = 1: Reciprocity(F, 1) is Artin
  reciprocity.
- `TauCeti.Functoriality.reciprocity_dihedral` (computation): An induced r = Ind_{G_K}^{G_ℚ} χ
  (K quadratic) corresponds to the automorphic induction of χ.
- `TauCeti.Functoriality.reciprocity_reducible_not_cuspidal` (non-example): For reducible r =
  χ₁ ⊕ χ₂ the matching π is the isobaric χ₁ ⊞ χ₂, not cuspidal: irreducibility is needed.

*Acceptance.*
- Every 'automorphic' predicate of ML.0 (BLGGT, Newton–Thorne) is an instance of the matching
  it asks for.

*Depends on:* `ML.5/functoriality-conjecture`, `ML.1/strong-artin-conjecture`,
`ML.0/endpoint-status-register`.

*Source.*
- arthur-2003, §4, Conjecture (Langlands [L1]) for G′ = {1}, p. 45 (Bull. AMS 40 (2003)):
  “Suppose that G0 = {1} and G = GL(n). Then π 0 is of course trivial.” — Arthur 2003: the case
  G′ = {1}, G = GL(n).

#### `ML.5/local-langlands-conjecture-general` — The local Langlands conjecture for a general reductive group (frontier statement)

*Kind:* definition.
*Declaration:* `TauCeti.Functoriality.LocalLanglands` in `TauCeti/NumberTheory/Functoriality`.

LLC(G, F_v) is the proposition: for G quasi-split over a local field F_v there is a surjective
finite-to-one map π ↦ φ_π from irreducible smooth representations of G(F_v) to Ĝ-conjugacy
classes of L-parameters φ : L_{F_v} → ᴸG (L_{F_v} = W_{F_v} archimedean, W_{F_v} × SU(2)
non-archimedean), compatible with central characters, twisting, parabolic induction and the L-
and ε-factors of pairs, bijective for GL_n. Known: archimedean F_v (Langlands); GL_n
(Harris–Taylor, Henniart, Scholze); quasi-split classical groups (ML.4/local-arthur-packets,
conditionally); GSp₄ (ML.4/gan-takeda-llc-gsp4).

*Hypotheses.*
- Frontier statement; status conjectural except in the listed cases.

*Construction and proof.*
- Definition of the proposition.

*Uses.*
- ModularityAndLanglandsExtensions:ML.4/local-arthur-packets: the classical-group case
- ModularityAndLanglandsExtensions:ML.4/gan-takeda-llc-gsp4: the GSp₄ case

| API | role | statement |
|---|---|---|
| `TauCeti.Functoriality.LocalLanglands` | data | The proposition LLC(G, F_v). |
| `TauCeti.Functoriality.LocalLanglands.gl` | example | LLC(GL_n, F_v) holds (Harris–Taylor, Henniart). |
| `TauCeti.Functoriality.LocalLanglands.archimedean` | example | LLC(G, ℝ) holds (Langlands). |
| `TauCeti.Functoriality.LocalLanglands.gsp4` | example | LLC(GSp₄, F_v) holds (Gan–Takeda). |

*Unit tests.*
- `TauCeti.Functoriality.llc_torus` (degenerate): G = GL₁: LLC is local class field theory
  (Hom(F_v^×, ℂ^×) ≅ Hom(W_{F_v}, ℂ^×)).
- `TauCeti.Functoriality.llc_sl2_not_injective` (non-example): For G = SL₂ the map is not
  injective: L-packets of size 2 and 4 occur (ML.4/extended-langlands-parameter).
- `TauCeti.Functoriality.llc_gl2_unramified` (computation): For GL₂ and an unramified principal
  series χ₁ × χ₂, φ = χ₁ ⊕ χ₂ through Art^{−1}.

*Acceptance.*
- A semisimple parametrisation π ↦ φ_π^{ss} (Fargues–Scholze) is weaker and does not prove
  LLC(G, F_v).

*Depends on:* `ML.4/extended-langlands-parameter`, `ML.0/endpoint-status-register`,
`tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups`.

*Source.*
- arthur-2003, §5, p. 47 (Bull. AMS 40 (2003)) — Arthur 2003 §5: the expected
  surjective finite-to-one local map.

#### `ML.5/categorical-local-langlands-conjecture` — The categorical local Langlands conjecture of Fargues–Scholze (frontier statement) ★

*Kind:* definition. *Planet:* Categorical local Langlands conjecture.
*Declaration:* `TauCeti.Functoriality.CategoricalLLC` in `TauCeti/NumberTheory/Functoriality`.

CatLLC(G, E) is Fargues–Scholze's conjecture: for G quasi-split over a non-archimedean local
field E with a fixed Whittaker datum and coefficients Λ = Q̄_ℓ, there is a fully faithful
functor (an equivalence onto the appropriate subcategory) from the category of sheaves on Bun_G
to the category of (ind-)coherent sheaves on the stack of L-parameters, sending the Whittaker
sheaf to the structure sheaf and compatible with the Hecke and spectral actions. It refines the
local Langlands correspondence; the semisimple parametrisation proved by Fargues–Scholze is a
theorem, the equivalence is a conjecture.

*Hypotheses.*
- Frontier statement; status conjectural.

*Construction and proof.*
- Definition of the proposition as stated by Fargues–Scholze, Conjecture I.10.2; the objects
  are owned by the geometrisation roadmaps.

*Uses.*
- Fargues–Scholze 2021, §I.10: the categorical form of local Langlands
- ModularityAndLanglandsExtensions:ML.0/endpoint-status-register: registered as conjectural

| API | role | statement |
|---|---|---|
| `TauCeti.Functoriality.CategoricalLLC` | data | The proposition CatLLC(G, E). |
| `TauCeti.Functoriality.CategoricalLLC.implies_semisimple` | relation | CatLLC is compatible with the semisimple parametrisation of Fargues–Scholze (part of the statement). |
| `TauCeti.Functoriality.CategoricalLLC.torus` | example | For G a torus, CatLLC holds (Zou; Fargues–Scholze for GL₁). |

*Unit tests.*
- `TauCeti.Functoriality.catLLC_gl1` (degenerate): G = GL₁: Bun_{GL₁} splits by degree and
  CatLLC reduces to local class field theory.
- `TauCeti.Functoriality.catLLC_not_from_ss` (non-example): The semisimple parametrisation
  alone does not give CatLLC: it does not see the monodromy of L-parameters.
- `TauCeti.Functoriality.catLLC_whittaker` (characterisation): Under CatLLC the Whittaker sheaf
  corresponds to the structure sheaf of the stack of L-parameters.

*Acceptance.*
- No instance of LLC(G, E) or of Functoriality is inferred from it in this roadmap (acceptance
  of ML.5).

*Depends on:* `ML.5/local-langlands-conjecture-general`,
`ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`,
`ML.0/endpoint-status-register`.

*Source.*
- fargues-scholze-2021, §I.10, Conjecture I.10.2, p. 38 (arXiv:2102.13459v4) — Fargues–Scholze Conjecture I.10.2.

### Theorems, comparisons and registers

#### `ML.5/cyclic-base-change-gln` — Cyclic and soluble base change and descent for GL_n, as used by the endpoints ★

*Kind:* theorem. *Planet:* Cyclic base change for GL_n.
*Declaration:* `TauCeti.Functoriality.solubleBaseChange` in `TauCeti/NumberTheory/Functoriality`.

(Arthur–Clozel) Let L/F be a cyclic extension of number fields of prime degree and π a cuspidal
automorphic representation of GL_n(𝔸_F). There is an isobaric automorphic representation
BC_{L/F}(π) of GL_n(𝔸_L) with rec(BC_{L/F}(π)_w) ≅ rec(π_v)|_{W_{L_w}} for every place w | v;
it is cuspidal unless π ≅ π ⊗ η for a non-trivial character η of 𝔸_F^×/F^×N_{L/F}𝔸_L^×; and a
cuspidal Π of GL_n(𝔸_L) with Π ≅ Π^σ for Gal(L/F) = ⟨σ⟩ is a base change. Iterating along a
soluble Galois tower L/F: for π regular algebraic cuspidal with BC_{L/F}(π) cuspidal,
BC_{L/F}(π) is regular algebraic; and (soluble descent) if r : G_F → GL_n(Q̄_p) is irreducible,
r|_{G_L} is irreducible and automorphic for a soluble Galois L/F, then r is automorphic. For n
= 2 the owner is GL2AutomorphicRepresentationsAndTransfer R17.4.

*Hypotheses.*
- L/F soluble Galois (cyclic of prime degree at each step) of number fields.

*Construction and proof.*
- Arthur–Clozel 1989, Theorems 3.4.2 and 3.5.1 (cyclic base change and descent), through
  EndoscopicTransferAndUnitaryTraceComparison ET.7a.
- Soluble descent: induction along the tower using strong multiplicity one and Chebotarev
  (BLGGT Lemma 2.2.2; owner PotentialAutomorphyInfrastructurePartII PL.0/soluble-descent).
- Newton–Thorne 2026 §1.2 quote base change in the form above (with misprints recorded as
  source issues).

*Acceptance.*
- Newton–Thorne 2026 use it in the proofs of Lemma 3.1, Theorem 3.2 and Proposition 6.1; BCGNT
  in Proposition 6.2.3.

*Depends on:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`,
`GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`,
`GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`,
`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one`,
`AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing`.

*Source.*
- nt-2026, §1.2, p. 8 (arXiv:2212.03595v2) — Newton–Thorne §1.2:
  BC_{L/F}(π) for cyclic L/F, after Arthur–Clozel.
- nt-2026, §3, end of proof of Theorem 3.2, p. 25 (arXiv:2212.03595v2) — Newton–Thorne's use of soluble descent in Theorem
  3.2.

#### `ML.5/ckpss-generic-transfer` — Generic transfer from split classical groups to GL_N and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry) ★

*Kind:* theorem. *Planet:* Generic transfer from classical groups to GL_N.
*Declaration:* `TauCeti.Functoriality.ckpss` in `TauCeti/NumberTheory/Functoriality`.

Let k be a number field, G_n = SO_{2n+1}, SO_{2n} (n ≥ 2) or Sp_{2n} split over k, and N = 2n,
2n, 2n + 1. Every globally generic cuspidal automorphic representation π of G_n(𝔸) has a
functorial lift Π to GL_N(𝔸) (local lift at every archimedean place and at almost all
unramified finite places). For G_n = SO_{2n+1}: Π = Π₁ ⊞ ⋯ ⊞ Π_d with Π_i pairwise
non-isomorphic unitary self-dual cuspidal representations of GL_{N_i}(𝔸) such that L^T(s, Π_i,
∧²) has a pole at s = 1 (symplectic type), and conversely every such Π is the lift of some π;
for Sp_{2n} (resp. SO_{2n}) the same holds with L^T(s, Π_i, Sym²) having a pole at s = 1
(orthogonal type) and trivial central character (CKPSS Theorems 7.1, 7.2, the image being
Ginzburg–Rallis–Soudry's).

*Hypotheses.*
- k a number field; G_n split; π globally generic cuspidal (with respect to a fixed splitting).

*Construction and proof.*
- CKPSS: Langlands–Shahidi L-functions of G_n × GL_m and the converse theorem for GL_N.
- Image: Ginzburg–Rallis–Soudry's descent (ML.5/grs-descent).
- Arthur remarks that the generic cases of his seed theorems follow from CKPSS and GRS, though
  he does not use them.

*Acceptance.*
- Boxer–Calegari–Gee Remark 2.5 apply Theorem 7.2 to self-dual level-one cuspidal π of GL₁₀₅ to
  get a globally generic cuspidal representation of Sp₁₀₄/ℚ; 'level one' needs a local input
  CKPSS does not give (recorded as a source issue in their extraction, E8).

*Depends on:* `ML.3/functorial-lift`, `ML.4/self-dual-cuspidal-type`,
`AutomorphicLFunctionsAndLocalFactors:AL.4`.

*Source.*
- ckpss-2004, Theorem 1.1, §1, p. 169 (Publ. Math. IHÉS 99) — CKPSS Theorem 1.1.
- ckpss-2004, Theorem 7.1, §7.1, p. 195 (Publ. Math. IHÉS 99) — CKPSS Theorem 7.1: the image for SO_{2n+1}.
- bcg-2025, Remark 2.5, §2, p. 8 (arXiv:2309.15944v3); journal p. 515 — Boxer–Calegari–Gee Remark 2.5.

#### `ML.5/grs-descent` — Automorphic descent of Ginzburg–Rallis–Soudry (with Jiang–Soudry's irreducibility) ★

*Kind:* theorem. *Planet:* Automorphic descent (Ginzburg–Rallis–Soudry).
*Declaration:* `TauCeti.Functoriality.grsDescent` in `TauCeti/NumberTheory/Functoriality`.

Let F be a number field and φ = τ₁ ⊞ ⋯ ⊞ τ_r a generic global parameter for the split group
SO_{2n+1}: τ_i pairwise non-isomorphic unitary self-dual cuspidal representations of
GL_{n_i}(𝔸_F) of symplectic type, Σ n_i = 2n. The automorphic descent (a Fourier–Jacobi or
Bessel coefficient of the residual Eisenstein representation E_τ with parameter (τ₁, 2) ⊞ ⋯ ⊞
(τ_r, 2)) is a non-zero cuspidal globally generic automorphic representation π₀ of
SO_{2n+1}(𝔸_F) whose functorial lift to GL_{2n} is τ₁ ⊞ ⋯ ⊞ τ_r; it is irreducible
(Jiang–Soudry) and is the generic member of the global packet Π̃_φ. The analogous descents for
the other quasi-split classical groups give non-zero cuspidal generic representations whose
structure depends on the uniqueness of local Bessel models over Vogan packets.

*Hypotheses.*
- F a number field; φ generic for split SO_{2n+1}.

*Construction and proof.*
- Ginzburg–Rallis–Soudry (2011 monograph): non-vanishing and cuspidality of the descent via
  unfolding of Fourier–Jacobi coefficients of residual Eisenstein series.
- Jiang–Soudry (Ann. of Math. 2003): irreducibility for SO_{2n+1} via the local converse
  theorem.
- Jiang–Zhang record the general structure, with the correction their extraction lists (E21).

*Acceptance.*
- The descent inverts ML.5/ckpss-generic-transfer on its image.

*Depends on:* `ML.4/global-arthur-parameter`, `ML.5/ckpss-generic-transfer`,
`AutomorphicSpectralTheory:AS.6/invariant-trace-formula`.

*Source.*
- jiang-zhang-2020, §1.1, p. 6 (arXiv v4); published p. 744 — Jiang–Zhang §1.1:
  π₀ is constructed by the automorphic descent of Ginzburg–Rallis–Soudry.
- jiang-zhang-2020, §7.2, p. 75 (arXiv v4); published p. 809 — Jiang–Zhang §7.2: CKPSS with the GRS
  descent.

#### `ML.5/local-descent-mp2n` — Local descent to Mp_{2n} and globalisation of square-integrable representations of GL_{2n} (Gan–Ichino Appendix A)

*Kind:* theorem.
*Declaration:* `TauCeti.Functoriality.localDescent_mp` in `TauCeti/NumberTheory/Functoriality`.

(Local descent) For F_v local and τ_v an irreducible square-integrable representation of
GL_{2n}(F_v) with L(s, τ_v, ∧²) having a pole at s = 0, the descent π_v of τ_v to Mp_{2n}(F_v)
relative to ψ_v (Ginzburg–Rallis–Soudry; Ichino–Lapid–Mao Theorem 3.1) is irreducible, genuine,
ψ_v-generic and square-integrable. (Proposition A.1) Given a number field F, a non-empty finite
set S of non-archimedean places, v₀ ∉ S non-archimedean and such τ_v for v ∈ S ∪ {v₀} with
τ_{v₀} supercuspidal, there is an irreducible cuspidal T on GL_{2n}(𝔸_F) with T_v = τ_v there,
T_v principal series at the other finite places outside S_∞, L(s, T, ∧²) having a pole at s = 1
and L(1/2, T) ≠ 0.

*Hypotheses.*
- As stated; Gan–Ichino's Proposition A.2 needs θ_{ψ_{v₀}}(π_{v₀}) supercuspidal (their
  extraction's E7).

*Construction and proof.*
- Descend τ_v locally, globalise the generic square-integrable genuine representations of
  Mp_{2n} (Gan–Ichino Proposition A.2), lift through the theta correspondence to SO_{2n+1} and
  then by ML.5/ckpss-generic-transfer to GL_{2n}.
- Ichino–Lapid–Mao Proposition 4.3/4.6 give T_v = τ_v.

*Acceptance.*
- Used by Gan–Ichino to produce cuspidal T with non-vanishing central value for their Theorem
  1.4.

*Depends on:* `ML.5/ckpss-generic-transfer`, `MetaplecticAutomorphicForms:MP.3`.

*Source.*
- gan-ichino-2018, Appendix A, proof of Proposition A.1, pp. 29–30 (arXiv v3); published pp.
  1001–1002 — Gan–Ichino Appendix A: the descent π_v of τ_v to
  Mp_{2n}(F_v).
- gan-ichino-2018, Appendix A, proof of Proposition A.1, p. 30 (arXiv v3); published p. 1002:
  “We now take T to be the functorial lift of Σ to GL2n (A).” — Gan–Ichino: T is the functorial
  lift of Σ to GL_{2n}.

#### `ML.5/automorphic-induction-register` — Register of automorphic induction and base change: owners and exact hypotheses

*Kind:* comparison.
*Declaration:* `TauCeti.Functoriality.knownTransfers` in `TauCeti/NumberTheory/Functoriality`.

Registers, with their owners and hypotheses, the transfers this roadmap's endpoints use but
does not plan: automorphic induction AI_{L/F} from GL_m(𝔸_L) to GL_{md}(𝔸_F) for cyclic L/F of
degree d (Arthur–Clozel; owner EndoscopicTransferAndUnitaryTraceComparison ET.7a) with the
cuspidality criterion (AI(π) cuspidal iff π is not isomorphic to a Galois conjugate); the
rank-two monomial case and Langlands–Tunnell's soluble Artin modularity (owner
GL2AutomorphicRepresentationsAndTransfer R17.5, by the accepted restructuring RS-21); GL₂
cyclic and soluble base change (owner R17.4, RS-21); and GL_n cyclic base change
(ML.5/cyclic-base-change-gln, resting on ET.7a). No general functorial transfer is inferred
from these cases.

*Hypotheses.*
- Registry node.

*Construction and proof.*
- Each entry cites its owner stage; the requests of this packet carry the exact statements
  needed.

*Acceptance.*
- The acceptance criterion of ML.5: every known transfer is registered with exact hypotheses
  and owner.

*Depends on:* `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`,
`GL2AutomorphicRepresentationsAndTransfer:R17.5`,
`GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change`,
`GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent`,
`ML.5/cyclic-base-change-gln`, `ML.0/endpoint-status-register`.

*Source.*
- arthur-2003, §4, Conjecture (Langlands [L1]) for G′ = {1}, p. 45 (Bull. AMS 40 (2003)):
  “Suppose that G0 = {1} and G = GL(n). Then π 0 is of course trivial.” — Arthur 2003: the
  known cases of the reciprocity conjecture (Langlands–Tunnell, cyclic base change of
  Arthur–Clozel).

#### `ML.5/symmetric-power-functoriality-implies-ramanujan` — Symmetric power functoriality implies the Ramanujan bound (Langlands' argument)

*Kind:* theorem.
*Declaration:* `TauCeti.Functoriality.ramanujan_of_symPower` in `TauCeti/NumberTheory/Functoriality`.

Let π be a unitary cuspidal automorphic representation of GL₂(𝔸_F). If for every n ≥ 1 the
lifts Symⁿπ and Symⁿπ^∨ are automorphic (it suffices that they be potentially automorphic over
finite extensions of F), then π_v is tempered at every place v where π is unramified
(Ramanujan): from the Rankin–Selberg L-functions L(s, Symⁿπ × Symⁿπ^∨) and the Jacquet–Shalika
bound |α| < q_v^{1/2} for the Satake parameters of unitary cuspidal representations of GL_{n+1}
one gets |α_v|^n < q_v^{1/2} for all n, hence |α_v| = 1.

*Hypotheses.*
- π unitary cuspidal on GL₂; the hypothesis is the (potential) automorphy of all symmetric
  powers.

*Construction and proof.*
- Jacquet–Shalika: for unitary cuspidal Π on GL_m, the Satake parameters satisfy |α| <
  q_v^{1/2} (AutomorphicLFunctionsAndLocalFactors AL.2).
- Apply to the cuspidal constituents of Symⁿπ (or of its base change to F_n): the largest
  Satake parameter of Symⁿπ_v is α_v^n.
- Potential version: base change to F_n preserves the absolute values of Satake parameters
  (ACC+ Theorem 1.0.2).

*Acceptance.*
- ACC+ prove Ramanujan for weight-zero regular algebraic π over CM fields this way; BCGNT for
  Bianchi forms (ML.3).

*Depends on:* `ML.5/functoriality-conjecture`, `ML.3/symmetric-power-lifting`,
`AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound`,
`ML.5/cyclic-base-change-gln`.

*Source.*
- acc-2023, §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2) —
  ACC+ §1: Langlands' deduction of Ramanujan from functoriality.
- acc-2023, §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2) —
  ACC+ use potential automorphy of all symmetric powers and the Jacquet–Shalika bounds.

**Remaining refinements.**
- Arthur–Clozel, Langlands 1980, Henniart 2009 and Kim–Shahidi (Duke 2002) were not available;
  their statements are taken from the sources that quote them.

## Gaps

- **Remaining BLGGT citations.** Clozel 1990 Theorem 3.13 (independence of ı),
  Harris–Shepherd-Barron–Taylor 2010 Theorem 4.2 (the Brauer argument for L-functions), Taylor
  2012 (the parity statement of Corollary 5.4.3(3)) and Caraiani 2012a,b (purity) are cited
  from BLGGT and not read. (needed by `ML.2/compatible-system-l-function-continuation`,
  `ML.2/irreducibility-density-one`, `ML.2/part-of-compatible-system`)
- **Newton–Thorne proofs are recorded at statement level.** The proofs of NT I Theorems
  2.24/2.33 (infinitesimal R = T on eigenvarieties, using Newton–Thorne 2020 on adjoint
  Bloch–Kato Selmer groups), 4.1 (depth-zero types), 5.2, 6.1 (Allen–Newton–Thorne residually
  reducible R_p = T_p), 7.1, 8.3 and NT II §§2–3 (patching with pseudodeformation rings;
  seasoned good-dihedral forms) are summarised from the introductions and statements, not
  decomposed. Cited and unread: Buzzard–Kilford 2005, Anastassiades–Thorne 2021,
  Allen–Newton–Thorne 2020, Newton–Thorne 2020, Kim 2004. (needed by
  `ML.3/eigenvariety-propagation`, `ML.3/steinberg-level-raising`,
  `ML.3/one-level-one-symmetric-power`, `ML.3/n-regular-congruences`,
  `ML.3/symmetric-power-automorphy-lifting`, `ML.3/non-cm-symmetric-powers`)
- **Mok/KMSW inputs of ML.3/steinberg-level-raising cross the stage order.** Newton–Thorne I
  Theorem 7.1 (residual automorphy of Sym^{n−1} of a theta series with a Steinberg place) uses
  the endoscopic classification for unitary groups (Mok; Kaletha–Mínguez–Shin–White) and
  Mœglin's packets. ML.4 now states them (ML.4/mok-unitary-classification,
  ML.4/kmsw-inner-forms), but the atlas orders ML.3 after ML.2 and not after ML.4, so the node
  cites EndoscopicTransferAndUnitaryTraceComparison ET.7a for the unitary base change and
  records the ML.4 dependency here; restructure proposal 4 asks for the stage edge ML.4 → ML.3
  (acyclic: no stage path leads from ML.3 to ML.4). (needed by `ML.3/steinberg-level-raising`)
- **Arthur's endoscopic classification is an external conditional input.** No roadmap plans the
  proofs of Arthur 2013 (Chapters 2–8), Mok 2015, KMSW 2014, Gee–Taïbi 2019, Xu or Ishimoto:
  the stabilisation of the twisted trace formula (Mœglin–Waldspurger 2016), the local
  intertwining relation (Arthur [A25]–[A27], proved by Atobe–Gan–Ichino–Kaletha–Mínguez–Shin),
  and the twisted weighted fundamental lemma (Mœglin–Waldspurger II.4.4; the weighted
  fundamental lemma for Lie algebras of non-split groups and its non-standard version have no
  written proof). The ML.4 nodes state the results with this status
  (ML.0/arthur-dependency-gate); restructure proposal 2 asks for a constructive owner. (needed
  by `ML.4/local-arthur-packets`, `ML.4/arthur-multiplicity-formula`,
  `ML.4/mok-unitary-classification`, `ML.4/kmsw-inner-forms`,
  `ML.4/gsp4-arthur-classification`, `ML.4/xu-gsp2n-packets`, `ML.4/amf-nonsplit-so-v`)
- **Newton–Thorne and Clozel–Thorne methods are owned by proposed Part IIs.** The
  level-raising, eigenvariety and tensor-functoriality arguments of Newton–Thorne 2021/2026 and
  Clozel–Thorne III (§§3–5 of NT26, Theorem 6.2 of CT17) are routed to the proposed Part IIs
  SymmetricPowersByUnitaryLevelRaising, SymmetricPowersByAnalyticContinuation,
  SymmetricPowerAutomorphyLifting and SymmetricPowersByTensorFunctorialityLifting (pending
  DESIGN-ModularityAndLanglandsExtensionsPartII); ML.3 cites them. (needed by
  `ML.3/all-regular-symmetric-powers`, `ML.3/sym6-sym8`, `ML.3/clozel-thorne-reductions`)
- **Dwork motives, open image theorems and Conjecture B have no owner yet.** The Dwork family's
  Hodge numbers, monodromy and the switching theorem (proposed
  PotentialAutomorphyDworkMotivesPartII), Serre's open image and supersingular-prime theorems
  (proposed OpenImageTheoremsForAbelianVarieties), and Calegari–Geraghty's Conjecture B with
  their Theorem 5.16 (proposed PotentialAutomorphyInfrastructure Part II) are not roadmaps yet;
  cited, not planned. (needed by `ML.2/cg18-odd-symmetric-powers`,
  `ML.2/cg18-conditional-potential-modularity`, `ML.2/qian-auxiliary-prime`,
  `ML.2/qian-residual-potential-automorphy`)
- **Caraiani–Newton's lifting theorem and modular-curve analysis.** Caraiani–Newton Theorem 1.3
  (ordinary automorphy lifting over CM fields in the potentially semistable case),
  Allen–Khare–Thorne residual modularity and the analysis of F-points of X₀(15) and related
  curves are not planned anywhere; the node records the statements only. (needed by
  `ML.1/imaginary-quadratic-elliptic-modularity`)
- **Secondary-only sources.** Pilloni–Stroh Theorem 0.3, Khare 1997, Dummigan–Martin–Watkins
  2009, Blasius–Harris–Ramakrishnan Proposition 5.3.7, Schmidt 2017/2018, Kim–Shahidi (Duke
  2002) and Henniart 2009 were read only as quoted by BCGP, Khare–Wintenberger, Newton–Thorne,
  Pilloni and Calegari–Geraghty. (needed by `ML.1/totally-real-odd-artin`,
  `ML.3/completed-symmetric-power-l-function`, `ML.4/gsp4-archimedean-limit-packets`,
  `ML.4/limit-discrete-series-packet-types`, `ML.3/kim-shahidi-sym3`)

## Restructuring proposals

- **rescope** (PotentialAutomorphyInfrastructure, ModularityAndLanglandsExtensions).
  RT-AREA-langlands-1/7: the automorphy lifting theorems for n-dimensional representations over
  CM fields (ACC+ Theorems 6.1.1 and 6.1.2, Fontaine–Laffaille and ordinary branches), which
  PA.0–PA.4 build infrastructure for, are stated by no layer, and ML.2 imports only PA.5. This
  packet's ML.2/ML.3/ML.1 nodes (Qian, BCGNT, Caraiani–Newton, Calegari–Geraghty) need them and
  request them from PA.4. *Proposal:* Add a layer PotentialAutomorphyInfrastructure:PA.6
  'Automorphy lifting over CM fields' stating ACC+ Theorems 6.1.1 and 6.1.2 with all image,
  polarization, level and local hypotheses, requiring PA.1–PA.4, GlobalGaloisDeformations G7/G8
  and LocalGaloisDeformationRings L7/L8, with the edge PA.6 →
  ModularityAndLanglandsExtensions:ML.2 (alternatively state them in PA.4 with PA.1 → PA.4,
  PA.2 → PA.4 and PA.4 → ML.2). Until then this packet's requests name PA.4. Every proposed
  edge is acyclic: no node of ML is a prerequisite of PA.
- **split** (EndoscopicTransferAndUnitaryTraceComparison, ModularityAndLanglandsExtensions).
  RT-AREA-langlands-3/1: Arthur's endoscopic classification for symplectic and orthogonal
  groups, Mok's and KMSW's for unitary groups, and the GSp₄ results (Gan–Takeda, Gee–Taïbi) are
  constructed by no layer; ML.4 now states them as a conditional registry (option (b) of the
  finding) with the proofs recorded as an external gap. *Proposal:* Option (a): a Part II of
  EndoscopicTransferAndUnitaryTraceComparison, 'Endoscopic classification of classical groups',
  owning the stabilisation of the twisted trace formula (Mœglin–Waldspurger), the local
  intertwining relation (Arthur [A25]–[A27], Atobe–Gan–Ichino–Kaletha–Mínguez–Shin), the local
  packets and multiplicity formulas of Arthur, Mok and KMSW, Gan–Takeda and Gee–Taïbi, with the
  twisted weighted fundamental lemma as its one named open input; ML.4 would then cite its
  nodes instead of stating the theorems, keeping only the registry nodes
  (trace-formula-inputs-register, symplectic-branch-status) and the GSp₄ and archimedean
  applications.
- **rescope** (ModularityAndLanglandsExtensions). Stage order: ML.3 requires ML.2 but not ML.5,
  while the low-degree GL₂ transfers (Gelbart–Jacquet, Kim–Shahidi, Kim with Henniart,
  Ramakrishnan) routed to ML.5 by the Newton–Thorne 2026 extraction are inputs of ML.3's
  endpoints (the base case of SP_n, the weight-one and CM cases of Newton–Thorne II Appendix
  A). *Proposal:* Keep them in ML.3 (nodes ML.3/functorial-lift, gelbart-jacquet,
  kim-shahidi-sym3, kim-sym4, ramakrishnan-tensor-product, low-rank-symmetric-powers), as this
  packet does; ML.5's automorphic-induction-register lists them. No edge ML.5 → ML.3 is needed,
  which would close a cycle with ML.3 → ML.5.
- **rescope** (ModularityAndLanglandsExtensions). ML.3/steinberg-level-raising (Newton–Thorne I
  Theorem 7.1) uses Mok's and KMSW's classification for unitary groups, which ML.4 states; the
  atlas has no edge ML.4 → ML.3. *Proposal:* Add the stage edge
  ModularityAndLanglandsExtensions:ML.4 → ModularityAndLanglandsExtensions:ML.3 (acyclic),
  after which the node can cite ML.4/mok-unitary-classification and ML.4/kmsw-inner-forms
  directly.

## Mistakes found in the sources

- **E1** (blggt-2014-v4, misprint, arXiv v4, §2.1, p. 32, definition of polarized automorphic
  representations): printed “In the case that F is imaginary we further suppose that µv(−1) =
  (−1)^n for all v|∞. (This last condition can always be achieved by replacing µ by µδF/F+.)”;
  correction: χ_v(−1) = (−1)^n, achieved by replacing χ by χδ_{F/F⁺}: the definition concerns
  the pair (π, χ), and no µ occurs in it. Reason: The paragraph defines (π, χ) with χ :
  𝔸_{F⁺}^×/(F⁺)^× → ℂ^×; µ is the Galois-side multiplier of the preceding definition. v1 (p.
  25) has "χ_v(−1) = (−1)^n" in its RAECSDC definition; the slip entered with v4's merged
  definition. Affects: nothing. Known: new (arXiv v4 read; the Annals version was not
  collated).
- **E2** (blggt-2014-v4, misprint, arXiv v4, §4.5, Theorem 4.5.1, its remark and proof, and
  Corollary 4.5.3, pp. 59–61): printed “Theorem 4.5.1(1): "potentially diagonalizable … at each
  prime v of F+ above li"; remark: "by Lemma 1.4.2 the hypothesis of potential
  diagonalizability will hold if …"; proof: "π′i is unramiﬁed above l"; Corollary 4.5.3(g):
  "HTτ(ρv,i) has n distinct elements"; (7): "rli,ıi(πi)|GF′u ∼ ρv|GF′u".”; correction: Read:
  each prime v of F above l_i (r_i is a representation of G_F); Lemma 1.4.3(2) (the
  Fontaine–Laffaille criterion; Lemma 1.4.2 lifts filtered modules); unramified above l_i;
  HT_τ(ρ_{i,v}) has n_i distinct elements; ∼ ρ_{i,v}|_{G_{F′_u}}. Reason: Index and reference
  slips: the representations r_i and lifts ρ_{i,v} carry the index i throughout; the
  potential-diagonalizability criterion for the Fontaine–Laffaille case is Lemma 1.4.3(2), as
  in the proof of Theorem 5.4.1; Corollary 4.5.2 states the totally real version, where primes
  of F⁺ are right. Affects: nothing. Known: new (arXiv v4 read; the Annals version was not
  collated).
- **E3** (blggt-2014-v4, misprint, arXiv v4, §4.4, Theorem 4.4.1, pp. 58–59): printed “For v ∈
  S let ρv : GF~v → GLn(OQl) be a lift of ¯rl,ı(π)|GF~v.”; correction: ρ_v is a lift of
  r̄|_{G_{F_ṽ}}. Reason: In v4 the theorem starts from a mod l representation r̄ and produces π
  in its conclusion; no π exists at this point. v1 started from a given (π, χ), where
  r̄_{l,ı}(π) made sense; the phrase survived the rewrite. Affects: nothing. Known: new (arXiv
  v4 read; the Annals version was not collated).
- **E4** (kedlaya-ant-2025, misprint, Chapter 24, §24.4, printed p. 134, paragraph after
  Conjecture 24.4): printed “We say E has complex multiplication if the only endomorphisms of E
  as an algebraic group are multiplication by integers.”; correction: E has complex
  multiplication if it has endomorphisms other than multiplication by integers (End E ≠ ℤ); the
  printed condition defines not having CM. Reason: The next parenthesis explains CM over ℂ by
  complex numbers multiplying the lattice into itself, i.e. non-integer endomorphisms; and
  Conjecture 24.4 is stated for E without CM, where End E = ℤ. Affects: nothing. Known: new.
- **E5** (kedlaya-ant-2025, error, Chapter 24, §24.5, Theorem 24.6 and the preceding sentence,
  printed p. 135): printed “If j(E) ∉ Z, then the Euler product ∏p Pn(p−s)−1 extends to a
  holomorphic function on C. (Since the Euler product converges absolutely for Re(s) > 3/2, the
  product cannot vanish for Re(s) ≥ 3/2.)”; correction: The work of
  Clozel–Harris–Shepherd-Barron–Taylor gives meromorphic continuation, holomorphic and
  nonvanishing on Re s ≥ 1 + n/2, which suffices for Sato–Tate; holomorphy on all of ℂ was
  proved afterwards (Newton–Thorne 2021, for all non-CM E). The Euler product converges
  absolutely for Re s > 1 + n/2, not 3/2, and the shift of the abscissa is n/2, not 1/2.
  Reason: P_n has roots α_p^{n−j}ᾱ_p^j of absolute value p^{n/2}, so the abscissa of absolute
  convergence is 1 + n/2 (3/2 only for n = 1). Entireness of the symmetric power L-functions
  was open until Newton–Thorne (their Corollary C and NT II Corollary B), whose introductions
  state that only meromorphic continuation was previously known. Affects: a stated result.
  Known: new.
- **E6** (kedlaya-ant-2025, misprint, Chapter 24, Conjecture 24.3, printed p. 134): printed
  “Assume that there exists c such that for any n ∈ Z, there are at most c values of i with
  N(xi) ≤ c.”; correction: at most c values of i with N(x_i) = n (bounded multiplicity of each
  norm). Reason: The hypothesis is meant to bound how many x_i share a norm, as in the case of
  primes; the printed condition N(x_i) ≤ c bounds only finitely many terms and has no content
  for equidistribution. Affects: nothing. Known: new.
- **E7** (bcgp-2021, gap, §2.9, definition of 'general type', p. 38 (arXiv:1812.09269v3)):
  printed “for each place v of F, the L-parameter obtained from recGT (πv ) by composing with
  the usual embedding GSp4 ↪ GL4 is rec(Πv )”; correction: At archimedean v read the
  archimedean Langlands parameter of π_v (Langlands' classification for GSp₄(ℝ)) for
  rec_GT(π_v), and rec_ℝ for rec. Reason: §2.3 defines rec_GT only for finite extensions K/ℚ_l;
  the definition quantifies over all places, including the archimedean ones. Affects: nothing.
  Known: new.
- **E8** (bcgp-2021, misprint, Proof of Lemma 2.9.1, case (b), p. 39 (arXiv:1812.09269v3)):
  printed “cuspidal automorphic representations of GL2 (AF ) with central character µπ”;
  correction: with central character ω_π Reason: µ_π is never defined; the central character of
  π is ω_π, as in case (d) of the same proof and in Calegari–Geraghty's Theorem 7.11 (χ_{µ1} =
  χ_{µ2} = χ_π). Affects: nothing. Known: new.
- **E9** (bcgp-2021, misprint, Remark 9.3.2, p. 259 (arXiv:1812.09269v3)): printed “Since the
  four 4-dimensional Galois representations H 1 (A, Ql ) are generalized symplectic”;
  correction: Since the 4-dimensional Galois representations H¹(A, ℚ_l) are generalized
  symplectic Reason: There is one 4-dimensional representation H¹(A, ℚ_l) for each l; 'four' is
  a slip. Affects: nothing. Known: new.
- **E10** (cg-2020, gap, Proof of Lemma 6.9, §6.2, Duke Math. J. 169 p. 840 (arXiv:1907.08691v1
  p. 30)): printed “Then π descends to an automorphic representation Π of a unitary group over
  Q.”; correction: Choose an imaginary quadratic K/ℚ with r_f|_{G_K} absolutely irreducible;
  BC_{K/ℚ}(π) is conjugate self-dual and descends (Mok) to U(4) attached to K/ℚ, whose Galois
  representations are r_f|_{G_K}; Bellaïche–Chenevier's Theorem 1.2 then applies. Reason:
  Galois representations of a unitary group are representations of G_K, not G_ℚ; the base
  change, the descent and the restriction are left implicit and no reference is given for the
  descent. Affects: the proof. Known: new.
- **E11** (bcgp-2025, misprint, Proof of Lemma 10.4.1, p. 223 (arXiv:2502.20645v1)): printed
  “the set ρA,p (GQ(ζp∞ ) ) r ρ(GG(ζp∞ ) ) = SL2 (Fp ) ≀ Z/2Z r SL2 (Fp )2”; correction:
  ρ̄_{A,p}(G_{ℚ(ζ_{p^∞})}) ∖ ρ̄_{A,p}(G_{K(ζ_{p^∞})}) Reason: The subgroup meant is the image
  of G_{K(ζ_{p^∞})} (index 2, equal to SL₂(F_p)²); 'G_{G(ζ_{p^∞})}' is a typo. Affects:
  nothing. Known: new.
- **E12** (pilloni-2020, misprint, Remark 5.3.2, p. 26 (author version, 17 June 2019)): printed
  “This is last statement is a consequence of the main theorem of [45] if the weight is
  cohomological.”; correction: This last statement is a consequence of the main theorem of [45]
  if the weight is cohomological. Reason: Stray 'is'. Affects: nothing. Known: new.
- **E13** (kw-2009-I, gap, Proof of Theorem 10.1(ii), p. 20 (author copy results.pdf)): printed
  “arise from the space S1 (Γ1 (N )) of classical forms of weight 1 and level N with N
  independent of λ. This proves (ii).”; correction: Add: S₁(Γ₁(N)) has finitely many newforms,
  so one newform f has ρ̄_λ ≅ ρ̄_{f,λ} for infinitely many λ; then the traces of Frobenius
  agree and ρ_λ ≅ ρ_{f,λ} (Chebotarev, Brauer–Nesbitt). Reason: The proof is announced as a
  sketch and stops before the descent from infinitely many residual congruences to an identity
  of compatible systems (Khare 1997 is cited for it). Affects: nothing. Known: new.
- **E14** (mok-2015, gap, Proposition 8.2.5 (arXiv:1206.0882v5), as reported by
  Kaletha–Mínguez–Shin–White §1.5, p. 77): printed “Proposition 8.2.5 (Ban's results for
  quasi-split unitary groups) stated without justification”; correction: Use
  Kaletha–Mínguez–Shin–White, arXiv:1409.3731, Appendix A (invariance of R-groups under the
  Aubert involution for unitary groups). Reason: KMSW §1.5 state that the result 'was stated as
  Proposition 8.2.5 in [Mok] but without justification' and prove it in their Appendix A.
  Affects: the proof. Known: Kaletha–Mínguez–Shin–White, arXiv:1409.3731v3, §1.5 and Appendix
  A.

The packet applies, without re-recording them, the confirmed errata of the routed extractions
that its nodes use: PAPER-ALLEN-ETAL-23 E3, E51, E101, E103–E107; PAPER-QIAN-23 E1, E2, E7,
E36, E40, E41, E43, E45; PAPER-CALEGARI-GERAGHTY-18 E96–E100, E180–E183, E186, E212–E216, E230;
PAPER-CALEGARI-GERAGHTY-20 E39, E43, E49, E83; PAPER-PILLONI-20 E26, E161, E163;
PAPER-BOXER-CALEGARI-GEE-PILLONI-21 E147, E148; PAPER-BOXER-CALEGARI-GEE-ETAL-25 E13, E26–E30;
PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22 E33, E34; PAPER-CLOZEL-THORNE-17 E4, E5;
PAPER-NEWTON-THORNE-26 E6–E12; PAPER-GAN-ICHINO-18 E3, E7; PAPER-JIANG-ZHANG-20 E21, E23;
PAPER-GAN-SAVIN-23-B E8, E14, E15; PAPER-BOXER-CALEGARI-GEE-25 E8.

## Sources

- `blggt-2014-v4` — Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, *Potential
  automorphy and change of weight*, arXiv:1010.2561v4 (9 December 2013), 93 pages; published in
  Ann. of Math. (2) 179 (2014), 501–609 (not collated). Printed page = PDF page..
  https://arxiv.org/pdf/1010.2561v4
- `newton-thorne-I` — James Newton and Jack A. Thorne, *Symmetric power functoriality for
  holomorphic modular forms*, arXiv:1912.11261v3 (27 September 2021), 101 pages; published in
  Publ. Math. IHÉS 134 (2021), 1–116 (not collated). Printed page = PDF page..
  https://arxiv.org/pdf/1912.11261v3
- `newton-thorne-II` — James Newton and Jack A. Thorne, *Symmetric power functoriality for
  holomorphic modular forms, II*, arXiv:2009.07180v2 (27 September 2021), 30 pages; published
  in Publ. Math. IHÉS 134 (2021), 117–152 (not collated).. https://arxiv.org/pdf/2009.07180v2
- `kedlaya-ant-2025` — Kiran S. Kedlaya, *Notes on analytic number theory*, Author PreTeXt PDF,
  last modified 21 December 2025, 154 PDF pages.. https://kskedlaya.org/papers/ant-ptx.pdf
- `acc-2023` — P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J.
  Newton, P. Scholze, R. Taylor, J. A. Thorne, *Potential automorphy over CM fields*,
  arXiv:1812.09999v2 (16 Jun 2022; latest, the accepted version) / Ann. of Math. 197 (2023),
  no. 3, 897–1113. https://arxiv.org/pdf/1812.09999
- `agikms-2024` — Hiraku Atobe, Wee Teck Gan, Atsushi Ichino, Tasho Kaletha, Alberto Mínguez,
  Sug Woo Shin, *Local intertwining relations and co-tempered A-packets of classical groups*,
  arXiv:2410.13504v3 (24 Jul 2026; v1 17 Oct 2024). https://arxiv.org/pdf/2410.13504
- `arthur-2003` — James Arthur, *The principle of functoriality*, Bull. Amer. Math. Soc. (N.S.)
  40 (2003), no. 1, 39–53 (electronically published 10 October 2002).
  https://www.ams.org/journals/bull/2003-40-01/S0273-0979-02-00963-1/S0273-0979-02-00963-1.pdf
- `arthur-2013` — James Arthur, *The Endoscopic Classification of Representations: Orthogonal
  and Symplectic Groups*, Book manuscript (pdfTeX, dated 30 May 2011, 535 pp.) formerly posted
  at claymath.org/cw/arthur/pdf/Book.pdf; published as AMS Colloquium Publications 61 (2013).
  Wayback Machine snapshot of 11 May 2012..
  http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf
- `bcg-2025` — George Boxer, Frank Calegari, Toby Gee, *Cuspidal cohomology classes for
  GL_n(Z)*, arXiv:2309.15944v3 (12 Sep 2024); published J. Amer. Math. Soc. 38 (2025) (Remark
  2.5 on p. 515 of the journal, per the extraction; not compared).
  https://arxiv.org/pdf/2309.15944v3
- `bcgnt-2025` — George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne, *The
  Ramanujan and Sato–Tate conjectures for Bianchi modular forms*, arXiv:2309.15880v3 [math.NT]
  (27 Mar 2025; latest, post-publication: its §1.5 thanks Dat Pham for a correction to Remark
  2.1.1 'of the published version'); published as Forum Math. Pi (2025),
  doi:10.1017/fmp.2024.29. https://arxiv.org/pdf/2309.15880
- `bcgp-2021` — George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Abelian surfaces over
  totally real fields are potentially modular*, arXiv:1812.09269v3 (28 Nov 2021, 'Final version
  (fixing minor typos found in copyediting)', 292 pp.) / Publ. Math. IHÉS 134 (2021), 153–501.
  https://arxiv.org/pdf/1812.09269v3
- `bcgp-2025` — George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Modularity theorems
  for abelian surfaces*, arXiv:2502.20645v1 (28 Feb 2025; only version).
  https://arxiv.org/pdf/2502.20645v1
- `caraiani-newton-2023` — A. Caraiani, J. Newton, *On the modularity of elliptic curves over
  imaginary quadratic fields*, arXiv:2301.10509v3 (27 March 2025).
  https://arxiv.org/pdf/2301.10509v3
- `cg-2018` — Frank Calegari, David Geraghty, *Modularity lifting beyond the Taylor–Wiles
  method*, arXiv:1207.4224v2 (16 Jul 2017) / published Invent. Math. 211 (2018) 297–433.
  https://arxiv.org/pdf/1207.4224
- `cg-2020` — Frank Calegari, David Geraghty, *Minimal modularity lifting for nonregular
  symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)*,
  Duke Math. J. 169 (2020), no. 5, 801–896 (Duke typeset advance-publication copy, 96 pp.,
  paginated 1–96) and arXiv:1907.08691v1 (19 Jul 2019, 60 pp., main text only; the appendix is
  arXiv:1907.08694v1, not downloaded). NB the task's guess 'arXiv:1609.xxxxx' is wrong: the
  arXiv number is 1907.08691.. http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf
- `chenevier-taibi-2020` — Gaëtan Chenevier, Olivier Taïbi, *Discrete series multiplicities for
  classical groups over Z and level 1 algebraic cusp forms*, Publ. Math. IHÉS 131 (2020),
  261–323 (open access, published version); arXiv:1907.08783v1.
  https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf
- `ckpss-2004` — J. W. Cogdell, H. H. Kim, I. I. Piatetski-Shapiro, F. Shahidi, *Functoriality
  for the classical groups*, Publ. Math. IHÉS 99 (2004) 163–233 (Numdam scan with text layer).
  http://www.numdam.org/item/PMIHES_2004__99__163_0.pdf
- `ct-2017` — L. Clozel, J. A. Thorne, *Level-raising and symmetric power functoriality, III*,
  Accepted manuscript dated December 10, 2015 (Apollo, Cambridge repository) / Duke Math. J.
  166 (2017), no. 2, 325–402; not on arXiv.
  https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download
- `fargues-scholze-2021` — Laurent Fargues, Peter Scholze, *Geometrization of the local
  Langlands correspondence*, arXiv:2102.13459v4 (27 Nov 2024).
  https://arxiv.org/pdf/2102.13459v4
- `fkp-2022` — N. Fakhruddin, C. Khare, S. Patrikis, *Lifting and automorphy of reducible mod p
  Galois representations over global fields*, arXiv:2008.12593v5 (15 Oct 2021; final version) /
  Invent. Math. 228 (2022), 415–492. https://arxiv.org/pdf/2008.12593v5
- `fsy-2022` — J. Fresán, C. Sabbah, J.-D. Yu, *Hodge theory of Kloosterman connections*,
  arXiv:1810.06454v5 (13 Jun 2022) / Duke Math. J. 171 (2022).
  https://arxiv.org/pdf/1810.06454v5
- `gan-ichino-2018` — Wee Teck Gan, Atsushi Ichino, *The Shimura–Waldspurger correspondence for
  Mp_2n*, arXiv:1705.10106v3 (3 August 2018); Ann. of Math. (2) 188 (2018), no. 3, 965–1016.
  https://arxiv.org/pdf/1705.10106v3
- `gan-savin-2023-g2` — Wee Teck Gan, Gordan Savin, *The local Langlands conjecture for G_2*,
  Forum Math. Pi 11 (2023), e28 (open access, CC BY 4.0); arXiv:2209.07346v2 (17 Dec 2022,
  sha256 025a257e…96decb7) also fetched.
  https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf
- `gee-taibi-2019` — Toby Gee, Olivier Taïbi, *Arthur's multiplicity formula for GSp4 and
  restriction to Sp4*, arXiv:1807.03988v1 (11 Jul 2018; the only arXiv version) / J. Éc.
  polytech. Math. 6 (2019), 469–535 (journal version not read).
  https://arxiv.org/pdf/1807.03988
- `gelbart-jacquet-1978` — Stephen Gelbart, Hervé Jacquet, *A relation between automorphic
  representations of GL(2) and GL(3)*, Ann. Sci. École Norm. Sup. (4) 11 (1978), no. 4, 471–542
  (Numdam scan; OCR text layer is noisy).
  http://www.numdam.org/item/ASENS_1978_4_11_4_471_0.pdf
- `ichino-prasanna-2023` — Atsushi Ichino, Kartik Prasanna, *Hodge classes and the
  Jacquet–Langlands correspondence*, arXiv:1806.10563v2 (10 July 2023, revised after referee
  reports); Forum Math. Pi 11 (2023), e22. https://arxiv.org/pdf/1806.10563v2
- `jiang-zhang-2020` — Dihua Jiang, Lei Zhang, *Arthur parameters and cuspidal automorphic
  modules of classical groups*, arXiv:1508.03205v4 (19 November 2019); Ann. of Math. (2) 191
  (2020), no. 3, 739–827. https://arxiv.org/pdf/1508.03205v4
- `kim-2003` — Henry H. Kim (Appendix 1 by D. Ramakrishnan; Appendix 2 by H. Kim and P.
  Sarnak), *Functoriality for the exterior square of GL4 and the symmetric fourth of GL2*, J.
  Amer. Math. Soc. 16 (2003), no. 1, 139–183 (AMS PDF, free).
  https://www.ams.org/journals/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf
- `kim-shahidi-2002` — Henry H. Kim, Freydoon Shahidi, *Functorial products for GL2 × GL3 and
  the symmetric cube for GL2*, Ann. of Math. 155 (2002) 837–893; arXiv:math/0409607v1 (30 Sep
  2004) = the published text with journal pagination. https://arxiv.org/pdf/math/0409607v1
- `kmsw-2014` — Tasho Kaletha, Alberto Minguez, Sug Woo Shin, Paul-James White, *Endoscopic
  Classification of Representations: Inner Forms of Unitary Groups*, arXiv:1409.3731v3 (3
  December 2014); not published in a journal. https://arxiv.org/pdf/1409.3731
- `kss-2021` — Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens, *Endo-parameters for p-adic
  classical groups*, arXiv:1611.02667v3 (31 August 2020); Invent. Math. 223 (2021), no. 2,
  597–723. https://arxiv.org/pdf/1611.02667v3
- `kw-2009-I` — Chandrashekhar Khare, Jean-Pierre Wintenberger, *Serre's modularity conjecture
  (I)*, author copy results.pdf (23 pp., PDF created 31 May 2009); published Invent. Math. 178
  (2009) 485–504 (not compared). https://www.math.ucla.edu/~shekhar/papers/results.pdf
- `mok-2015` — Chung Pang Mok, *Endoscopic classification of representations of quasi-split
  unitary groups*, arXiv:1206.0882v5 (22 June 2013); published Mem. Amer. Math. Soc. 235
  (2015), no. 1108. https://arxiv.org/pdf/1206.0882
- `nt-2026` — James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert
  modular forms*, arXiv:2212.03595v2 (19 Feb 2025); published Ann. of Math. 203 (2026).
  https://arxiv.org/pdf/2212.03595v2
- `pilloni-2020` — Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of
  singular weights*, Author's version dated 17 June 2019 (113 pp., post-referee) of Duke Math.
  J. 169 (2020), no. 9, 1647–1807, doi:10.1215/00127094-2019-0075. There is no arXiv version
  (the task's 'arXiv:1709.xxxxx' does not exist; earlier versions are HAL hal-01393374 v1–v3).
  Journal pagination was not checked..
  https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf
- `qian-2023` — Lie Qian, *Potential automorphy for GL_n*, arXiv:2104.09761v1 (20 Apr 2021; the
  only arXiv version; p. 1 dated April 19, 2021) / published Invent. Math. 231 (2023)
  1239–1275, DOI 10.1007/s00222-022-01161-6 (published PDF not freely downloadable: Springer
  returns a JavaScript challenge page). https://arxiv.org/pdf/2104.09761
- `qian-thesis-2023` — Lie Qian, *Potential automorphy for general linear groups (PhD
  dissertation, Stanford University)*, Stanford PhD thesis, June 2023, 78 pp. ('The majority of
  the work is published on Inventiones Mathematicae volume 231, pages 1239–1275 (2023)', p. 2
  of Ch. 1 text). Numbering X.0.Y: Theorem 1.0.10 = published Thm 1.1 (l odd), Theorem 1.0.13 =
  Thm 1.4, Lemma 3.0.11 = arXiv-v1 Lemma 3.10(1)–(3), Lemma 3.0.12 / Remark 3.0.13 ≈ published
  Lemma 3.12 / Remark 3.13, Proposition 4.0.1 = Prop. 4.1, Lemma 4.0.3 / Remark 4.0.4 ≈
  published Lemma 4.3 / Remark 4.4 (wording matches the published text quoted in E1, E41, E43,
  E45)..
  https://stacks.stanford.edu/file/druid:yn815wp7042/Thesis%20Final%20Version-augmented.pdf
- `ramakrishnan-2000` — Dinakar Ramakrishnan, *Modularity of the Rankin–Selberg L-series, and
  multiplicity one for SL(2)*, Ann. of Math. 152 (2000) 45–111; arXiv:math/0007203v1 (1 Jul
  2000) with the Annals pagination. https://arxiv.org/pdf/math/0007203v1
