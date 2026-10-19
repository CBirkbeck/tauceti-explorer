# PKG-IntegralIwasawaTheory~codex — completed package

Worker: Codex, session codex-JtmwXx. Issue: #11017. Date: 2026-10-19.
The bot confirmed the claim at issuecomment-6272266459. This is one completed package, not a checkpoint. No second job was claimed.

The four deliverables are this note and `packages/IntegralIwasawaTheory/{README.md,Suggested.lean,metadata.toml}` relative to `research/blueprint/`. The README gives the arithmetic construction, the all-prime finite CM Fitting identities, controlled passage to the integral main conjecture, and the classical and special-value consequences. No theorem is claimed to have been formalised. Suggested.lean records only statements expressible on existing carriers and light definitions, with proved tests.

## Inputs and coverage

Consumed the accepted I.1 (68 nodes), I.8 (53 nodes), and L1 continuation (27 nodes): 148 nodes. Read their readers, suggested files, reviews and revision handoffs. The separately designed IntegralIwasawaTheoryPartII is excluded. The table below is a target-level reconciliation; a supplier entry means the target is consumed, rather than duplicated. Related targets share a prose subsection without losing their hypotheses, formulas, API or Checks.

### I.1

| Accepted node | README destination / supplier |
| --- | --- |
| `cyclotomic-zp-extension` | 0.1 |
| `cyclotomic-layers` | 0.2 |
| `full-cyclotomic-tower` | 0.1 |
| `tower-ramification` | 0.3 |
| `iwasawa-algebra-coordinate` | 0.4; existing completed-algebra coordinate/filtration |
| `finite-level-kernel` | 0.4; existing completed-algebra coordinate/filtration |
| `arithmetic-compact-action` | 0.4; existing completed-algebra coordinate/filtration |
| `equivariant-iwasawa-algebra` | 0.4; existing completed-algebra coordinate/filtration |
| `character-decomposition-integrality` | 0.5; existing finite group-ring algebra |
| `class-group-limit` | 2.1 |
| `unit-limits` | 2.2 |
| `semilocal-principal-units` | 2.2 |
| `leopoldt-map-and-defect` | 2.2 |
| `maximal-abelian-pro-p-extensions` | 2.3; 2.7 |
| `class-field-identification` | 2.3; 2.7 |
| `global-local-unit-sequence` | 2.7 |
| `iwasawa-finiteness` | 2.7; 3.1–3.3 |
| `weak-leopoldt` | 2.5–2.6 |
| `cm-minus-class-modules` | 2.8; 10.6 |
| `uniform-capitulation` | 2.8; 10.6 |
| `real-unit-radical` | 2.8; 10.6 |
| `real-unit-galois-cohomology` | 2.8; 10.6 |
| `stickelberger-elements` | 6.1 |
| `stickelberger-functoriality` | 6.1 |
| `smoothed-integrality` | 6.2–6.3; analytic suppliers |
| `deligne-ribet-dictionary` | 6.2–6.3; analytic suppliers |
| `kubota-leopoldt-stickelberger-dictionary` | 6.2–6.3; analytic suppliers |
| `interpolation-uniqueness` | 6.2–6.3; analytic suppliers |
| `arithmetic-iwasawa-complex` | 10.1–10.2; general Selmer-Iwasawa supplier |
| `finite-layer-descent` | 10.3 |
| `coinvariant-euler-characteristic` | 10.4 |
| `twisted-coinvariant-descent` | 10.5 |
| `s-enlargement-euler-factors` | 10.5 |
| `dyadic-real-place-correction` | 10.6; 12.4 |
| `main-conjecture-statement` | 6.5 |
| `hida-hecke-eisenstein-ideal` | 9.1 |
| `ribet-extension-construction` | 9.2 |
| `hecke-class-group-comparison` | 9.2 |
| `divisibility-to-equality` | 9.2; 12.1 |
| `mazur-wiles-theorem` | 9.2; 12.1 |
| `wiles-main-conjecture` | 11.7; 12.1 |
| `going-up-induction` | 12.2 |
| `special-value-endpoint` | 12.3 |
| `cm-minus-parts-and-duals` | 8.1 |
| `smoothed-class-groups` | 8.2 |
| `smoothed-stickelberger` | 8.2 |
| `sinnott-kurihara-ideal` | 8.2 |
| `minus-class-number-formula` | 8.6 |
| `selmer-module` | 8.3 |
| `ritter-weiss-module` | 8.4 |
| `ritter-weiss-transpose` | 8.5; supplied transpose algebra |
| `ritter-weiss-galois-cohomology` | 8.5; supplied transpose algebra |
| `inclusion-implies-equality` | 8.6 |
| `extra-congruence-cusp-form` | 9.3 |
| `group-ring-hecke-eisenstein-homomorphism` | 9.4 |
| `hecke-galois-representation` | 9.5 |
| `eisenstein-cohomology-class` | 9.6 |
| `surjection-from-nabla` | 9.6 |
| `fitting-ideal-calculation` | 9.6 |
| `keystone-fitting-theorem` | 9.7 |
| `kurihara-theorem-2-12` | 9.7 |
| `partial-kurihara-and-strong-brumer-stark` | 12.5 |
| `kurihara-fitting-formula` | 12.5 |
| `brumer-stark-theorem` | 12.5 |
| `rubin-conjecture-consequence` | 12.6 |
| `nonequivariant-characteristic-ideal` | 11.7; 12.1 |
| `kurihara-kolster-module-dictionary` | 12.4 |
| `finite-euler-characteristic-comparison` | 12.4 |

### I.8

| Accepted node | README destination / supplier |
| --- | --- |
| `compatible-cyclotomic-tower` | 1.1 |
| `tower-galois-compatibility` | 1.1 |
| `real-subfield` | 1.1 |
| `cyclotomic-unit-group` | 1.2 |
| `smoothed-cyclotomic-unit` | 1.3 |
| `prime-to-p-reduction` | 1.3 |
| `valuation-balance` | 1.3 |
| `cyclotomic-unit-generators` | 1.3 |
| `cyclic-generation` | 1.4 |
| `unit-index-real-full` | 1.4 |
| `abelian-zeta-regulator-dictionary` | 1.5; Hecke analytic suppliers |
| `cyclotomic-regulator-determinant` | 1.5; Hecke analytic suppliers |
| `index-formula` | 1.5; Hecke analytic suppliers |
| `global-unit-norm-relations` | 1.4 |
| `dyadic-prime-power-index` | 1.6 |
| `abelian-circular-unit-variant` | 1.7 |
| `general-conductor-index` | 1.8 |
| `burns-flach-iwasawa-complex` | 10.1 |
| `compact-complex-cohomology` | 10.1 |
| `cm-twist-minus-plus` | 11.1 |
| `stickelberger-deligne-ribet-square` | 11.1 |
| `selmer-modified-iwasawa-limit` | 11.2–11.5 |
| `dyadic-selmer-comparison` | 10.6; 11.5 |
| `twisted-selmer-fitting` | 11.5 |
| `height-one-determinant-comparison` | 11.6 |
| `integral-determinant-main-conjecture` | 11.7 |
| `arithmetic-two-term-presentation` | 11.7 |
| `cyclotomic-class-field-specialization` | 7.2; SelmerIwasawaCohomology 4.16–4.17 |
| `conjugation-completed-action` | 0.4 |
| `principal-global-unit-closures` | 7.2; SelmerIwasawaCohomology 4.16–4.17 |
| `finite-ray-principal-sequence` | 3.5 |
| `four-term-cyclotomic-sequence` | 7.2; SelmerIwasawaCohomology 4.16–4.17 |
| `one-prime-inertia-control` | 3.1 |
| `class-module-finiteness-torsion` | 3.1 |
| `general-inertia-control` | 3.2 |
| `inertia-kernel-norm-relation` | 3.2 |
| `arithmetic-class-number-growth` | 3.3 |
| `bounded-p-rank-mu-zero` | 3.4; 5.5 |
| `vandiver-condition` | 7.1 |
| `vandiver-unramified-vanishing` | 7.1 |
| `vandiver-unit-closure` | 7.2 |
| `vandiver-cyclic-isomorphism` | 7.3–7.4 |
| `vandiver-characteristic-components` | 7.3–7.4 |
| `leopoldt-defect` | 2.2; 4.1 |
| `baker-brumer-independence` | 4.2 |
| `abelian-unit-resolvents` | 4.3 |
| `abelian-leopoldt` | 4.4 |
| `fw-digit-equidistribution` | 5.7; independent analytic route 5.1–5.3 |
| `fw-digit-separation` | 5.7; independent analytic route 5.1–5.3 |
| `fw-bernoulli-obstruction` | 5.7; independent analytic route 5.1–5.3 |
| `fw-analytic-mu-zero` | 5.3 |
| `fw-arithmetic-mu-zero` | 5.4–5.6 |
| `greenberg-p-primary-formulation` | 3.4 |

### L1

| Accepted node | README destination / supplier |
| --- | --- |
| `rjw-iwasawa-modules` | 2.1–2.3; 3.5 |
| `global-local-dictionary` | 3.5; 7.2; existing rational four-term sequence |
| `coleman-real-closure-comparison` | 3.5; 7.2; existing rational four-term sequence |
| `compact-limit-exactness-application` | 3.5; 7.2; existing rational four-term sequence |
| `iwasawa-rank-theorem` | 2.7 |
| `greither-module-dictionary` | 2.1–2.3; 3.5 |
| `zp-extension` | 0.2 |
| `zp-extension-ramification` | 0.3 |
| `tower-iwasawa-invariants` | 3.3 |
| `finite-layer-cutoff` | 3.3 |
| `coinvariant-evaluation` | 10.4 |
| `norm-prank-descent` | 3.4; 5.6 |
| `real-cyclotomic-one-prime-tower` | 3.1; 7.1 |
| `vandiver-plus-part-tower` | 3.1; 7.1 |
| `coleman-zeta-normalisation` | 7.3 |
| `abelian-leopoldt-i2-form` | 2.2; 4.4 |
| `baker-brumer-algebraic-numbers` | 4.2 |
| `gamma-transform` | 5.1 |
| `sinnott-independence` | 5.2 |
| `sinnott-mu-theorem` | 5.2 |
| `kubota-leopoldt-gamma-transform` | 5.3 |
| `analytic-mu-vanishing-dirichlet` | 5.3 |
| `minus-mu-from-analytic` | 5.4 |
| `mirror-inequality-odd` | 5.4 |
| `dyadic-relative-to-full-mu` | 5.5 |
| `torsion-root-sign-arrangement` | 5.7 |
| `washington-non-p-part` | supplier OrdinaryAutomorphicFormsAndModularityLifting 5.9 |

## Continuation and gap reconciliation

The L1 refinement graph is applied semantically, rather than copying its earlier edges into the prose:

- The old second Leopoldt-defect definition is consolidated into §2.2; §4.1 is the logarithmic comparison. Abelianness enters the proof in §4.4, not the definition.
- Relative μ, odd mirror, finite norm descent, and dyadic relative-to-full comparison feed arithmetic Ferrero–Washington. The analytic input is the independent Sinnott route in §§5.1–5.3. The digit and Bernoulli obstruction targets remain in §5.7 as the original independent comparison. There is no cycle from arithmetic μ-vanishing back through its own digit obstruction.
- The algebraic root/sign arrangement feeds digit separation. The abelian Leopoldt theorem feeds the principal-closure comparison. The compact exactness application feeds the existing rational four-term sequence through finite ray reciprocity.
- The real one-prime calculation feeds Vandiver propagation; the Coleman normalization feeds its cyclic quotient. The general inertia theorem supplies the arbitrary-tower ramification input. Finite cutoff precedes growth; ν is defined after its eventual constancy is established.
- L1's `inheritedTargets.newNodes` commentary is not treated as another family of prerequisite edges. The accepted `replaceAllPrerequisites`, removals and supersession instructions take precedence over older packet prose. Washington's non-p boundedness is imported from its present owner.

The three accepted source gaps are closed as follows.

**G1, bounded real-dyadic model.** Burns–Flach (1996), ordinary cone (1.9), p. 73, and Proposition 1.20(a), pp. 78–79, supply the actual bounded finite-projective model, also at 2: cohomologically trivial cochains, subgroupwise high-degree vanishing, upper truncation preserving cohomological triviality, a finite projective resolution and lower truncation by a torsion-free cohomologically trivial term. Part (b) controls finite coefficient determinants. Their p. 80 ordinary/Tate comparison prevents substituting the unbounded complete real Tate cone. Their p. 86 duality identifies degrees 2,3; compact Shapiro, uniform finite amplitude and weak Leopoldt give §10.1's tower object and intrinsic maps. No claim that an ordinary real dyadic global Galois group has cd₂=2 survives.

**G2, arbitrary abelian circular units.** Sinnott (1980), Proposition 2.3, pp. 194–195; Lemma 4.1, pp. 202–203; Propositions 4.1–4.2, pp. 203–207; Theorem 4.1, pp. 207–208, give the norm-defined distribution lattice and full correction. The real norm-generated group C differs from the intersection D⁺ of full cyclotomic circular numbers with the real field. For real prime-power conductor, C has index `2^(d−1)h`, while D⁺ has index h. The real quadratic golden-ratio calculation detects the factor two. §1.8 retains the unit index, 2-torsion correction, prime-power subfield degrees and rational covolume; the full-cyclotomic conductor formula is not transplanted to every abelian subfield.

**G3, independent μ-vanishing.** The accepted continuation supplies Sinnott's 1984 Propositions 1–2 and Theorem I, the rational-measure realization and Ferrero's dyadic rank comparison. §§5.1–5.6 prove analytic and then arithmetic μ-vanishing without the main conjecture. The original digit route remains an independent target, with its own integral-basis/sign arrangement. Sinnott's automorphism/minimal-length argument is retained rather than the false claim that distinct monomials suffice in characteristic p.

The earlier finite-to-infinite gap is made explicit in §§11.2–11.6. Untwisted top-degree control gives actual quotients M/I_nM. Arbitrary-base-change Fitting identities are descended through the joint ideals `(p^a,ω_n)`, using closedness of ideals. Finite square presentations need no compatible matrices: a minimal cover, cancellation of units, Artin–Rees and Nakayama bound its relation module. Analytic nonvanishing then makes the square map injective. Height-one detection is asserted for invertible/reflexive determinant lattices over the S₂ order, not for arbitrary ideals; `(p,T)` is the counterexample. Twisting takes place only after this control, since τ does not preserve I_n.

## Ownership, moved notions and duplication removals

The roadmap is outside the 94-roadmap Caraiani–Newton tier list. No tier or bundle was invented. Every active supplier was checked against upstream main or an open upstream PR. The following necessary extensions are locally owned, with the natural later relocation indicated; none is cited as an already supplied theorem.

| Local target | Why the current supplier does not suffice | Relocation / consumer adjustment |
| --- | --- | --- |
| §2.5 ordinary truncated Euler–Poincaré / weak Leopoldt at real 2 | Standard cd₂ scope excludes real dyadic fields | ArithmeticGaloisDuality Part II can import this arithmetic extension |
| §4.2 Baker–Brumer arbitrary algebraic numbers | LinearFormsInLogarithms §8.10 uses its convergence domain | LinearFormsInLogarithms Part II can use the common-power/logarithm adapter |
| §§9.1–9.2 full ordinary a₁-duality and trace-limit Tate module at Eisenstein localization | PadicFamilies' symbol/representation theorem has residual irreducibility and lattice hypotheses | PadicFamilies / OrdinaryAutomorphicFormsAndModularityLifting Part II can import these extensions |
| §9.3 arbitrary-degree, all-prime finite-weight Hilbert congruence | Current family theorem has parity/odd-prime restrictions | PadicFamilies Part II; no unsupported universal family claimed |
| §9.5 finite-weight Hilbert oldforms over principal Artinian factors | AutomorphicGaloisRepresentations Part II does not supply this exact all-prime finite-weight oldform interface | Its further extension can import this target |
| §9.6 weighted local distinct-character extension mechanism at 2 | Existing coincident-character weighted interface is not this weighted local variant | IntegralHeckeAndGaloisDeterminants Part II; source is cleared Ribet Theorem 2.1, Remark 2.2 and proof |
| §10.1 ordinary bounded Burns–Flach model and arithmetic maps | Complete real Tate compact support alone does not provide it | ArithmeticGaloisDuality / SelmerIwasawaCohomology Part II |
| §§11.3–11.4 controlled Fitting continuity and relation lifting | PMIA's existing Fitting base change, compact Nakayama and quadratic algebra do not state this limit theorem | PadicMeasuresIwasawaAlgebras Part II can import the algebraic extension |
| §11.6 invertible-lattice detection over the actual S₂ group order | Character normalization and arbitrary height-one ideal comparison are insufficient | PadicMeasuresIwasawaAlgebras Part II |
| §12.6 finite exterior bidual / Rubin lattice interface | Exterior powers and determinant pairings exist; the integral bidual lattice interface does not | EulerSystemsAndKolyvaginSystems can consume this finite arithmetic interface; its general system theory remains there |

Duplication was removed by mathematical object, not only by matching names:

- `ClassGroup.relNorm`, `relNorm_mk0`, `relNorm_extendedHom` supply the class norm and norm-after-extension identity. The package retains arithmetic tower compatibility.
- Completed-group-algebra `Basic`, `Map`, `PowerSeries`, `Filtration`, `ProductCoordinate`, `DyadicCoordinate` supply the algebra, coordinates, finite-level kernels and finite-factor coordinates. `ker_proj_comp_aeval`, `powerSeriesLevelEquiv`, `ker_proj_comp_powerSeriesCoordinate`, `prodPowerSeriesCoordinate`, `dyadicCoordinate`, `dyadicLevel`, `ker_proj_comp_dyadicCoordinate` were read. Only the identification with field-layer maps is new in §0.4.
- Tau Ceti's all-index Fitting API, including arbitrary `fittingIdeal_baseChange`, is imported. No flatness assumption or second definition is introduced. PMIA supplies generic μ, λ, characteristic ideals, growth, determinants, compact limits, transposes, cardinality and exterior-annihilator algebra.
- Mathlib `LinearIndependent.units_smul_iff` supplies rescaling; the draft generic logarithmic-rescale Lean theorem was removed. The common-power arithmetic adapter remains.
- Mathlib `AddSubgroup.index_range` supplies finite kernel/cokernel equality; the draft generic Lean theorem was removed. Arithmetic derived finite-error bookkeeping remains in §10.3.
- Mathlib `geom_sum_mul`, `mul_geom_sum`, `add_pow_char_pow` supply the generic norm-polynomial and characteristic-p identities; draft duplicate Lean milestones were removed. The light arithmetic operator definitions and their discriminating tests remain.
- Mathlib `exteriorPower.pairingDual`, `pairingDual_ιMulti_ιMulti` supply decomposable determinant evaluation. §12.6 owns only the integral bidual/Rubin-lattice interface and arithmetic application.
- Mathlib's domain-only principal-ideal cancellation is a near match: the kept Lean statement uses regular x in an arbitrary commutative ring, as required over nonregular coefficient orders.
- SelmerIwasawaCohomology §§4.16–4.17 already owns the rational odd-prime unit/class four-term sequence. Layer 7 applies it. OrdinaryAutomorphicFormsAndModularityLifting §5.9 owns Washington's non-p-part boundedness.
- Current LocalGaloisGroups and Tau Ceti's tame-presentation API supply the generic tame relation. The arithmetic inertia argument does not replan it. The other eight named newer upstream roadmaps were searched; no new overlap in arithmetic Iwasawa, circular units or the finite CM theorem was found.
- ComputationalNumberTheory is not a prerequisite. Computational information, where needed, stays a theorem hypothesis. No Tate-thesis theorem or theorem-number citation is used. The functional equation is supplied by its Hecke owners.
- EulerSystemsCyclotomicMainConjecture and EulerSystemsAndKolyvaginSystems are downstream/shared-endpoint directions, not active upstream prerequisites: neither was present on current main or among the 289 open PRs inspected. SpecialValuesBirchTate is a downstream K-theory consumer only.

Two draft aliases for scalar inverse determinants and a fake identity-based Leopoldt predicate were deleted. They did not construct the missing mathematical objects. The determinant witness is computed in README §10.4; there is no claimed Lean determinant-line construction. Closing comment names missing carriers. Latest shape rules limit proved Lean examples to kept light definitions; no admitted examples or unrelated library calculations remain.

### Upstream versions inspected

Read-only roadmap checkout: `0d144d044dacebca17b654695b6f1ad58f159b27`; actual GitHub main inspected additionally at `c785fa3b983754f0dbcc49492d92fd770e3adba6` (including newly merged PMIA). Current Tau Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Elaboration uses pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current APIs absent at the elaboration pin are cited as suppliers, never recreated.

| Open upstream PR | Head inspected | Contract checked |
| --- | --- | --- |
| ArithmeticGaloisDuality #858 | `9fcc0f88cfca194cda9d0164e71369f8f4604b60` | D7.5 and real ordinary/Tate scope |
| SelmerIwasawaCohomology #869 | `964eaa843413cb7832d529423c3414973126681e` | §§3.0–3.17 and 4.16–4.19 |
| PadicFamilies #1019 | `cbf4e899cf0006cd3ac63732a53f881ed356dd6c` | rational/Hilbert ordinary scope and residual hypotheses |
| OrdinaryAutomorphicFormsAndModularityLifting #1066 | `29a8aca167138f404cd8f93606079e7573f9b326` | §§5.9,6.3 |
| DirichletPadicLFunctions #1039 | `b535adc65aa567ca2d789df5755e0b2b0158b5ea` | interpolation and Eisenstein normalization |
| AutomorphicGaloisRepresentations Part II #1006 | `eb5fec8b63d7af616eb6b47cd7b1a75a886ccbbc` | finite-weight/ordinary scope |
| AutomorphicLFunctionsAndLocalFactors #924 | `54ce95ea10f4ebb301358c94d8dca839743fb106` | Hecke analytic supplier |
| LFunctions #248 | `1c52a140d9cd00390b70957ff2a0d5c2bce71bb8` | finite-order Hecke supplier |
| LinearFormsInLogarithms #451 | `fd8774c2080598d94958cced99dc25e11ca5530b` | §8.10 convergence-domain theorem |

## Adversarial mathematics pass

Each row covers all definitions, identities and theorem targets in its indicated subsection, with their explicit hypotheses. A scope case excluded by the hypotheses is a negative control, not a claimed specialization. Standing arithmetic coefficients are mixed characteristic; equal-characteristic fields/DVRs are excluded from those arithmetic targets. Light polynomial and module identities retain their explicitly wider Lean scope. Ramified O uses `f v_π`, not the unramified formula. Zero modules have Fitting ideal one; rank-zero determinants are one. These controls were applied throughout, including where the row emphasizes a different obstruction.

| Statements / subsection | Instances computed or negative controls | Result / change |
| --- | --- | --- |
| 0.1 full tower, fixed torsion, character, Teichmüller | ℚ,p=3: first layer degree 3; p=2: ℚ(√2); ℚ(√−2) image 1,3 mod 8 has no torsion | Kept full group distinct from torsion-free quotient; Δ is not the degree of K(i)/K |
| 0.2 layers, inclusion, norm, exponent shift | n=0; m=n; m=n+1; quadratic action −1; conductor exponents 1 and 2 | ν_nn=1; norm-after-extension p, extension-after-norm 1+σ; dyadic exponent n+2 |
| 0.3 ramification, real splitting, inertia | real p=2 gives no finite subgroup of ℤ₂; away-p tame finite inertia; all finite inertia zero | Real places split; contradiction with finite Hilbert class field; cyclotomic no-splitting not generalized |
| 0.4 completed action and arithmetic projection | abelian kernel vs nonabelian lift dependence; zero kernel; n=0 T; p=2,n=1 2T+T² | Kernel is arithmetic comparison with existing API; T² is wrong integrally |
| 0.4 light layer and norm polynomials | n=0; d=0; dyadic d=1 gives 2+X; residue characteristic 2 gives X² | No division by ω_m; generic identities imported |
| 0.5 character integrality and coefficient order | trivial Δ; Δ=C₂,p=2; character values of (1+c)/2; regular vs zero character components | p-divisibility prevents integral product decomposition; retain actual order |
| 1.1 compatible roots, real fields and norms | orders 1,2,3; F(3)→F(9)→F(27); real element norm in complex quadratic extension | Retained e(n)/e(m) degree exponent and compatible embeddings |
| 1.2 circular numbers, units and ratio | 1−ζ_p nonunit; ratio b=1 unit; b=0 zero; full roots ±1 | Integral inverses required; unit theorem requires p∤b and nontrivial primitive root |
| 1.3 real smoothing, primitive reduction and valuations | b=1; b=0 excluded; lower-order roots; sum of prime valuations | Root-of-unity smoothing and valuation balance retained |
| 1.4 generation, torsion, cyclicity and norms | rank zero; p=3; torsion ±1; relative degree p | Torsion removed only in free quotient; norm direction pinned |
| 1.5 zeta/regulator determinant and index | degree one; p=3 and p=5; complex vs real embedding multiplicity | Regulator and analytic class-number formula keep euler/conductor factors; no guessed unit index |
| 1.6 dyadic circular units and index | orders 2,4,8; ℚ and ℚ(√2) | Rank-zero cases and dyadic exponents stated separately |
| 1.7 norm-generated abelian circular units | E=ℚ; full cyclotomic E; real quadratic E; nonunit norm generators | Take E-units intersected with norm-generated circular numbers, not the intersection-defined D⁺ |
| 1.8 distribution lattice, log kernel, g-prime and exact index | trivial group; real/imaginary fields; one/two/three conductor primes; ℚ(√5) | General correction retained; C has index 2^(d−1)h at real prime power, D⁺ index h |
| 2.1 class norm/direct limits | trivial class group cardinal 1; norms down vs extension up; non-surjective system | No automatic surjectivity of arbitrary limit projections |
| 2.2 unit/S-unit/principal limits, closure and field defect | ℚ odd-p rank zero; real quadratic rank one; torsion ±1 at 2; zero localization domain | Leopoldt defined on actual completed units; logarithmic comparison separate |
| 2.3 unramified and ramified modules | ℚ odd p: ℤ_p; ℚ at 2: C₂×ℤ₂; S removing real place | Real inertia retained in full S-ramified module; X/Y notation fixed |
| 2.4 local finite generation | local uniformizer quotient; roots of unity; zero unit norm limit; compact vs noncompact | Local reciprocity and compact Nakayama before global unit finiteness |
| 2.5 truncated Euler formula and homological criterion | real p=2 positive even cohomology; ℚ imaginary vs real rank; p odd | Uses χ₂=−r₂, not false real cd₂=2 |
| 2.6 cyclotomic weak Leopoldt | p=2 adjoin i; divisible H² corestriction; zero H₂ | Transfers weak Leopoldt to real base without deleting ordinary higher real cohomology |
| 2.7 global-local reciprocity, exact maps and ranks | ℚ at 2 sign term; norm of −1 in quadratic layer=1; E∞[2]=0; imaginary r₂=1 | Real sign module is not declared injective into 𝔛; global unit injection proved after weak Leopoldt |
| 2.8 norm-minus classes, capitulation and real unit radical | c=1 on C₆; c=−1; finite capitulation B; real rank d | Keep killed-by-two errors, #B[2]=#B/2B, and correction rank d |
| 3.1 one-prime control and torsion | one inertia summand→Γ isomorphism; n=0; trivial bottom class group | Class control and Nakayama valid with total ramification, not in arbitrary tower |
| 3.2 general inertia kernel and norm quotient | two inertia summands have kernel (t,−t); m=n; m=n+1 | Kernel not finite in general; ν_nm replaces ω_n at cutoff |
| 3.3 μ,λ,ν and growth | constant c; exponent n; vertical Λ/p^a; ν=−1 eventual; m=n | ν integral; finite errors change ν only; supplier cutoff n₀=m+1 |
| 3.4 rank criterion, norm descent and Greenberg | μ>0 vertical summand has rank ≥μp^n−C; e_n=n; finite extension degree divisible by p | Subexponential rank sufficient; μ=0 does not imply bounded orders; no arbitrary-field Greenberg claim |
| 3.5 ray, principal and split-prime dictionaries | S empty finite part; one split prime; ray C₆ example; trivial roots | Finite ray exact sequence before inverse limit; split-class quotient distinguished |
| 4.1 algebraic logarithm and localization | root of unity log=0; norm torsion; common deep power | Kernel and logarithmic defect comparison keep field-level rank |
| 4.2 Baker–Brumer adapter | α=1; multiplicative dependence; deep powers into strict disk; nonzero scalar inverse | Rescaling already Mathlib; no independence asserted for zero/dependent logs |
| 4.3 abelian unit resolvents | trivial character; nontrivial character; real quadratic unit; complex conjugate pair | Trivial branch treated by norm; nonzero resolvent only in correct rank/parity |
| 4.4 abelian Leopoldt | ℚ rank zero; real quadratic rank one; CM reduction | All abelian fields and both p=2/odd; not all number fields |
| 5.1 Γ-transform and content | zero measure; constant rational function; δ₁; residue coefficients | Content defined before μ conclusion; all-zero series handled; V-sum corrected to avoid division by two |
| 5.2 Sinnott independence and rational transforms | characteristic p; monomials related by Frobenius; q=1 degenerate transform | Uses automorphism/minimal-length proof, not naive monomial independence |
| 5.3 Dirichlet realization and analytic μ | trivial branch pole; odd character parity; p=2 q=4; auxiliary unit | Canonical numerator and pole clearing kept; generator choice separate from twist |
| 5.4 relative μ and odd mirror | p=3 empty nontrivial even branches; plus/minus parity; μ_minus=0 | Mirror only odd p; dyadic case has separate proof |
| 5.5 dyadic comparison | e_n≤C(n+1); rank≤2e_n+1; divide by 2^n; no integral 1/2 idempotent | Convergence to zero rather than unsupported bounded rank |
| 5.6 all-abelian Ferrero–Washington | full cyclotomic field; arbitrary subfield; norm p-rank error; μ=0 λ>0 | Norm descent supplies arithmetic generality; no main-conjecture premise |
| 5.7 digits, root arrangement and obstruction | dyadic sign; full torsion basis; rational orbit and non-equidistribution countercase | Independent original route retained; no cycle into arithmetic μ proof |
| 6.1 Stickelberger restriction, depletion, Frobenius | trivial group; split prime Frob=1; Q,p=3; character inversion | χ(Θ)=L(χ⁻¹); arithmetic Frobenius; depleted factor uses Frob⁻¹ |
| 6.2 smoothing and shifted pole | σ=1; κ(σ)≠1; transported augmentation | Augmentation clears g; Jκ clears θ, not the same ideal |
| 6.3 analytic dictionaries and uniqueness | trivial ψ pole; nontrivial Teichmüller branch; p=2; Q comparison | Existence and uniqueness separate; exact T factors transported |
| 6.4 Tate substitution, sharp, generator and Euler map | a=0; a=−1; two substitutions; Frob=1 and scalar 2 | Twist inverse exponent; generator change separate; 1−F⁻¹ becomes 1−F under sharp |
| 6.5 classical and strong predicates | ψ=1 denominator; unit L-series; nonunit branch; p-primary finite character | Strong integral character assertion only prime-to-p, general distinguished factor retained |
| 7.1 Vandiver and propagation | p=3; rank-zero plus class group; irregular minus class | Vandiver distinct from regularity; conditional theorem not assumption of roadmap |
| 7.2 principal global/circular closures | torsion and residue units; Q odd p; defect zero | Existing rational four-term sequence imported; Leopoldt used explicitly |
| 7.3 Coleman/Mellin normalization | T=0 pole branch; y=u/(1+T)−1; factor 1−u/(1+y)=−T | Cleared numerator keeps −T; nonzero denominators explicit |
| 7.4 Vandiver cyclic quotient and character components | zero component; trivial character; nontrivial even branches; p=3 | Full zeta numerator/pole and twist normalization kept |
| 8.1 minus quotient, finite/lattice duals | c=−1 entire module; c=1 C₆ quotient C₂; 3-cycle inverse; zero module | Dyadic quotient not eigenspace; integral dual not finite dual; # on lattice comparison |
| 8.2 ray modules, Stickelberger smoothing and SK ideal | Q(μ₃),T=7 gives C₆ and minus C₂ with Fitt(2); T torsion kill | Integral dyadic errors retained; away-2 theorem does not become all-prime ray formula |
| 8.3 arithmetic Selmer module and exact sequences | zero module; empty finite S; infinitely many valuations; split prime | Uses product of valuation homomorphisms in defining map; torsion-free T hypothesis |
| 8.4 Ritter–Weiss finite/generalized presentations | positive S-unit rank; split depletion makes determinant zero; rank zero | No finite injectivity claimed; kernel is correct anti-invariant unit group |
| 8.5 transpose and extension-class universal maps | one-by-one matrix; empty matrix det=1; # under dual | Generic transpose imported; actual Galois extension mapped arithmetically |
| 8.6 cardinality inclusion/equality and norm errors | finite 2-torsion; C₆ ray test; zero norm kernel | Only cyclic/quadratic hypotheses permit stated dual Fitting formula |
| 9.1 full ordinary Hecke quotient | a₁(E)=1; cusp/ordinary boundary; ξ unit vs nonunit; rank-zero component | No residual irreducibility, Gorensteinness or unsupported free lattice assumption |
| 9.2 rational ordinary representation and divisibility | det at complex conjugation; faithful congruence module; p=3 no interesting branch | Unramified X, ω^(1−k)(1) and shifted ξ argument fixed |
| 9.3 all-prime finite-weight Hilbert cusp congruence | P=1 with some χ(p)=1; P=1 all ≠1; P≠1; p=2,d=1 | P includes full conductor of HT, including T-factors; P′/P″ chosen per character component |
| 9.4 Hecke map and regular cancellation | x regular nonunit; x=0 counterexample; A unit; zero quotient | Regular factor never divided out without hypothesis; U-annihilator test stronger than cyclic quotient |
| 9.5 finite-weight Galois oldforms | degree odd/even; p=2; principal Artinian nonreduced factor; residue-field irreducibility | Finite-weight all-prime scope stated; residual Eisenstein irreducibility not imposed |
| 9.6 weighted Ribet module and ∇ surjection | coincident characters at 2; distinct local weights; m=1; joint κ,y generators | Local weighted extension includes distinct case; no global residual distinctness assumption |
| 9.7 keystone and finite Selmer Fitting theorem | d=1,2; t=0,d; T torsion kill; split finite depletion and det=0 | All-prime divided Θ factor explicit; finite theorem independent of Wiles conclusion |
| 10.1 bounded ordinary compact support | real p=2 periodic positive tails; finite ℤ/2 coefficients; F=k | Actual perfect-model proof; ordinary/Tate objects not identified |
| 10.2 Iwasawa complexes, cohomology and Shapiro | H⁰_Iw=0; H³=ℤ_p; finite layer inflated vs derived specialization | Raw ordinary global real dyadic perfectness not asserted |
| 10.3 control, Tor and finite errors | E=ℤ/p trivial γ has both terms of order p; zero E; free module | Retain Tor₁ until Euler quotient; generic finite equality already Mathlib |
| 10.4 arithmetic Euler quotient and determinant sign | [O→²O] in degrees 1,2 gives (2), degrees 2,3 gives (1/2); a=0 and unit; r=0 | Acyclic fraction condition explicit; finite errors cancel as quotient only |
| 10.5 twisted descent and S-enlargement | n=0 excluded; nontrivial u^n−1 on divisible D; new prime split; μ₂ vs μ₄ | Old-unit injectivity proves local injection; T/Euler factor matches arithmetic Frobenius |
| 10.6 dyadic exact sequences and correction | d=0,1,2 gives 1,2,4; finite ℤ/2 vs rank-d radical; D with action 3 | Two exact sequences retained; correction from units, not finite cokernel |
| 11.1 minus/plus order twist and analytic square | τ(c)=−c; τ#≠#τ; finite ω_n transported | Integral quotient order isomorphism at 2; ε not defined on real quotient |
| 11.2 modified Selmer limit and top control | T kills unit torsion; finite trivial zero allows rank; untwisted ω_n | H³=0 before minus derived change; exact quotient not assumed from matrices |
| 11.3 closed-ideal continuity and finiteLayerIdeal | a=0 top; a=1,n=0 (p,T); O=ℤ₂[C₂]; O=0; nilpotent coefficient order | Finite-free O scope equals Lean; joint quotients, not ω_n alone, are open precision |
| 11.4 square relation lifting | M=0 r=0; M=R zero differential; arbitrarily large finite matrices; nonreduced R | Minimal cover cancellation/Artin–Rees replaces compatible matrices; regularity separate |
| 11.5 infinite Selmer Fitting and T triangle | finite T factors; p-primary ψ quotient; det nonzero in each field component | Uses actual presentation and derived T triangle; no tensoring a height-one equality |
| 11.6 lattice detection and local comparison | (p,T) vs R height-one; invertible lattices; nonnormal ℤ₂[C₂] order | S₂ intersection only for reflexive/invertible modules; no arbitrary ideal conclusion |
| 11.7 integral determinant and pd≤1 | unit analytic g; zero finite determinant; augmentation H³; nontrivial residual finite group | Infinite regularity from all character components; finite-group torsion retained |
| 12.1 classical Wiles and strong formulation | prime-to-p ψ vs p-power ψ; ψ=1 pole; p=2 | Integral μ content retained where supplied; rational polynomial assertion not overstated |
| 12.2 restriction, induction and going up | base intersection p^e; type-W twist; nonreal-valued even character | Even means totally real character field; analytic denominator retained |
| 12.3 odd/dyadic special-value Euler characteristic | Q weight 2: v₂ζ(−1)=−2, v₂w₂=3, H² order 2; p=3 cancellation | H³ supplies denominator; n≥2 and correct parity exclude infinite groups |
| 12.4 Kolster covariant dictionary | ι_u²=id; at γ=u² argument u⁻¹; D action3 invariants2 coinvariants0 | Full series, inverse character, discrete invariants and 2^d all retained |
| 12.5 higher Fitting, annihilation and Brumer–Stark units | d=1 classical; d=2 no further unit denominator; ray C₆ at 2 | Away-2 full ray formula kept distinct; all-prime divided annihilator/unit refinement exact |
| 12.6 exterior bidual, Rubin lattice, order map and consequence | r=0; rank<r; rank1 ℤ excludes 1/2; rank2 basis wedge; permutation sign | Imported determinant pairing; split set V disjoint from Θ depletion; no dyadic higher-rank claim |

### Native Lean statement audit

All theorem quantifiers are explicit; there is no ambient omitted arithmetic hypothesis. The arithmetic headline valuations use Mathlib's actual cyclotomic fields and class numbers. The determinant headline uses the actual finite-free coefficient order and its joint quotient maps, with arithmetic construction recorded in README, rather than a free sequence supplied with the conclusion.

| Lean statement | Boundary test and reason it is valid |
| --- | --- |
| `integralMainConjecture_of_finiteSelmerFitting` | r=0: det=1 and residue images force z unit; r=1 zero A: images force z=0; O may be nonregular finite free, including nilpotents; follows from joint ideal separation |
| `cyclotomicClassNumberGrowth` | p=2 and m containing p-powers change only conductor cutoff; m>0 essential to arithmetic tower; p prime essential; general arbitrary-tower statement separate in README |
| `ferreroWashington_cyclotomic` | Same native scope; λ may be positive; no assertion of bounded class numbers; abelian subfield norm descent separate in README |
| `cyclotomicRatio_mul` | a=0 allowed, both sides zero; b=0 excluded by ζ^b≠1; ζ=1 excluded; field of arbitrary characteristic allowed for rational identity |
| `bounded_iff_mu_lambda_zero` | Eventual constant implies global bound because initial segment finite; μ or λ positive diverges for prime p; p=1 would break μ detection and is excluded |
| `mu_zero_of_subexponential_prank` | μ=0 trivial; μ>0 divided lower bound contradicts rank/p^n→0; C/p^n→0; p prime excludes base 1 |
| `dyadic_rank_subexponential` | r=e=0 valid; e≤C(n+1), r≤2e+1 gives quotient→0; neither uniform boundedness nor false exact minus decomposition is needed |
| `tateCoordinate_comp` | a=0, b=−a and T=−1 all work; u is a unit; only scalar field formula, not arbitrary formal-series substitution |
| `coleman_trivial_numerator_identity` | T=0 gives zero; u≠0 and 1+T≠0 imply transformed denominator u/(1+T)≠0; retains −T |
| `cancel_regular_principal_bound` | zero ring vacuous; x unit works; nonunit regular x works even in ring with other zero divisors; x=0 over nonzero ring excluded |
| `ideal_eq_of_joint_finite_images` | zero/unit ideals distinguished modulo (p,T); nilpotent O permitted; complete noetherian finite-free coefficient hypothesis essential |

Every kept definition has one or two proved examples: `finiteLayerIdeal` (T membership and precision zero), `cyclotomicClassVal` (valuation base 1 negative control), `layerPolynomial` (n=0 and dyadic linear coefficient), `transitionPolynomial` (identity and quadratic norm), `cyclotomicRatio` (exponents 1 and 0), `integralMinusRelations` (c=−1 and C₆), `HasIwasawaGrowth` (constant and linear exponents), `tateCoordinate` (inverse and exponent zero), `depletedEuler` (split and inverse orientation), `contragredientApply` (identity and three-cycle), and `dyadicCorrection` (degrees zero and one). These are arithmetic normalization tests, not unrelated library-object examples. No example uses sorry.

## Source verification and reading record

No source passages or source files are included. Public originals and author versions were read directly. The cleared Ribet v2 paper was read in place from the maintainer's library; neither its file nor passages were copied. Historical Federer, Iwasawa 1983, Mazur–Wiles 1984 and Wiles 1990 proofs are not represented as originals read: the package gives the explicit alternate proofs in NSW, Yamashita, Sharifi, Greenberg and Kurihara. The public Sinnott and Burns–Flach scans were read using page images/OCR, checking formulas against the page image when needed. The Γ-transform uses the sum of V-translates: at 2, δ₁+δ_{−1} transforms to 2, not an average of 1. The bibliography distinguishes the two Sinnott papers and the two RJW versions.

A reproducible spot-check used seed 11017 to choose fifteen from twenty candidate source locators. Each was checked in the actual source, including its surrounding hypotheses and the relevant proof. This supplements the direct reading of the three gap-resolution sources and the complete proof interfaces used above.

| Sampled source and locator | What was checked / correction |
| --- | --- |
| RJW published, Proposition A.10, pp. 203–205 | Finiteness of transition quotients forces rank zero; growth includes integer constant |
| NSW 10.3.22, pp. 639–640 | Weak Leopoldt, no finite submodules and rank −χ₂; separate modification in the real dyadic proof |
| DKSW Brumer–Stark, §3.1 and start of §3.2, pp. 21–24 | Corrected nonexistent “Theorem 3.1” to Lemma 3.1, then Theorems 3.2–3.3; corrected Lemma 3.4 and Corollaries 3.6,3.8 in the linked prose; explicit levels added |
| Yamashita, Lemma 7, pp. 78–79 | Essential rank of the unit cohomology limit; bounded inflation kernels, not their disappearance |
| Kolster 2009, Proposition 3.1, p. 13 | Contragradient character and finite étale H²; finite invariants vanish using no finite submodule |
| DK, Theorem 9.10, pp. 75–77 | Weighted Ribet generators, exceptional local factors and Fitting bound |
| Rognes–Weibel, Theorem A.1 and proof, pp. 45–47 | Even n≥2, totally real F, zeta valuation equals H²/H¹; H¹ denominator retained |
| Kolster 1989, Lemma 2, pp. 249–250 | Discrete invariants and evaluation at u⁻¹−1; full characteristic series |
| BKS, Proposition 2.4, pp. 571–574 | Actual coefficient/reduction triangle, Selmer H² and smoothed torsion H³ |
| NSW 5.6.17, pp. 331–332 | Homological rank/no-finite-submodule criterion with divisibility hypothesis; no unconditional free H₂ claim |
| Sharifi, Theorem 3.2.13, pp. 81–82 | Actual norm kernels, eventual ramification cutoff and ν∈ℤ |
| Sharifi AWS, Theorem 4.3.3, pp. 50–52 | a₁-duality, primitive Eisenstein line, T₀ and congruence quotient Λ/(ξ) |
| Sharifi, Proposition 3.1.9, pp. 76–77 | Away-p inertia, including real places; generic tame relation supplied elsewhere |
| DKSW Brumer–Stark, Theorem 2.15, pp. 18–19 | Principal Artinian fraction factors, irreducibility over residue fields, local shapes, no residual distinguishability assumption |
| DK, Theorem 8.23, pp. 64–65 | Injective R/(xΘ#) coefficient ring, Hecke eigenvalues and stronger U-annihilator test |

Additional direct checks include Burns–Flach (1.9), Proposition 1.20 and p. 86; Sinnott 1980 Proposition 2.3 and all of §4 through Theorem 4.1; Sinnott 1984 Propositions 1–2 and Theorem I; NSW 8.3.20, 8.7.5–7, 10.3.13, 10.3.24–25, 11.1.9; Greenberg Propositions 1–3,5; Kurihara Theorem 2.12, Lemma 4.2 and Theorem 4.1; DK Appendix A and its ray/minus conventions; DKSW all-prime finite Fitting theorem and modular/Galois construction; and the cleared Ribet Theorem 2.1, Remark 2.2 and local proof. No source locator remains flagged as unread evidence for an active proof step.

### Source versions and fingerprints

Retrieved/read 2026-10-19. Hashes identify the full public PDFs read, not any repository copies. A journal-volume landing page identifies a digitized article when the downloaded article has a cover sheet. The arXiv version suffixes are significant.

| Source ID | Public version / retrieval URL | SHA-256 |
| --- | --- | --- |
| BKS-2016 | https://ems.press/content/serial-article-files/26320 | `aede51fac2aecec7de2fbf08e6682717c3bd4dcbe602415757c0b484b205b4be` |
| BURNS-FLACH | https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0305/LOG_0010.pdf | `ec4487d7975a96c8a36a6fefb0a69a19575a6ec818ae7cf7cb7860b925ed95b4` |
| DK-2023 | https://arxiv.org/pdf/2010.00657v3 | `c1fe1cd8e1d218b4d44c58b1171c561b5955261340e345e51f9c82fa33b63099` |
| DKSW-BSZ | https://arxiv.org/pdf/2310.16399v1 | `e32514db92247fb0a9b4e3fa120161df4ceaf88f5b1339144f26f996662cb6b0` |
| FERRERO-1978 | https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0234/LOG_0010.pdf | `4bf69f09bea8bcac069f31b3da775766fd305e802b1ca43b70c72417b32304db` |
| GREENBERG-1983 | https://www.cambridge.org/core/services/aop-cambridge-core/content/view/7553544640D5E8A25438318D20A35A09/S0027763000020250a.pdf/div-class-title-on-em-class-italic-p-em-adic-artin-em-class-italic-l-em-functions-div.pdf | `ece6c5b30f266cf4aa3462b64a2f6f24aa3af1f8c65fd17645c7683957dbef04` |
| GREITHER-1992 | https://www.numdam.org/article/AIF_1992__42_3_449_0.pdf | `8e4db974556923a9532151657039d50b34028254f13fc2f1541f449bb50623da` |
| KAKDE-2013 | https://arxiv.org/pdf/1008.0142v3 | `5a05da0d58f2717422fb401510d9cad4aeeac707313929a796870b92e27ea45c` |
| KOLSTER-1989 | https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf | `ce649cf4085c501f755517afb0dd7bc9a9798ad1ee9a37116d7b5aae98073f2f` |
| KOLSTER-2009 | https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf | `5772ace94ba4b247ae745cf32c6b3b079fe25e0de46af057cb4e971a1c3ead28` |
| KURIHARA | https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf | `22ebb98ed24bcebe814ea2f6ba6b4681d7dbafd309b55f06b02f5807fec8ff33` |
| NSW-2.3 | https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf?x=20261019 | `abbb7cdefc9ecb3350286c3cba36fe36a90c103257ff8f64173e09a50afdcb91` |
| OESTERLE | https://www.numdam.org/article/SB_1978-1979__21__170_0.pdf | `003c5a2385bc637dab5244c1037932fd9c505688a553e15f313cb4db06b67920` |
| RJW-PADIC-L | https://arxiv.org/pdf/2309.15692v2 | `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4` |
| RJW-PUBLISHED | https://msp.org/ent/2025/4-1/ent-v4-n1-p03-p.pdf | `28850a4fdf8a8f263b0f24aa4d71ea9ec951dbe6b1dc6e37ffe37d717ea74f12` |
| ROGNES-WEIBEL-2000 | https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf | `9d770c079313ccc26f29da641d301269edf12985f122fd107ab201f086e8f446` |
| ROUSSEAU | https://www.numdam.org/article/STNB_1968-1969____A11_0.pdf | `4e0b2b17ae4780a06da537a85ed194333273cc554aed172f5620456cf0bae4ae` |
| SHARIFI-AWS | https://www.math.ucla.edu/~sharifi/aws-iwasawa.pdf | `3f4bc1f8b721341ab690ee01d86919714ba8875e3f8b8973e3ebef7e1ae7a1d5` |
| SHARIFI | https://www.math.ucla.edu/~sharifi/iwasawa.pdf | `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26` |
| SINNOTT1980 | https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0062/LOG_0014.pdf | `ca496fb4f381eb97cb51bb25449d69a2f642bdcce6f93f2f0f61b143fda19637` |
| SINNOTT1984 | https://gdz.sub.uni-goettingen.de/id/PPN356556735_0075 | `2158086c73ac8ef3ba43781a190c4fcd5c1073a431a1216a129d580c81e9287d` |
| WASHINGTON-1975 | https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0214/LOG_0030.pdf | `cece2c207dfff554523b6d8aac4e734166890cfb3563238481fc37ebe77ea493` |
| WASHINGTON1978 | https://gdz.sub.uni-goettingen.de/id/PPN356556735_0049 | `b0954600a0ad5fd1e6ccfce57640378ba7ce34c330bb0b599e880fd255caefb6` |
| YAMASHITA-1984 | https://www.jstage.jst.go.jp/article/tmj1949/36/1/36_1_75/_pdf | `c6795c7d8517c6a0f2ba6d7e7de851041149b5512a8030e7a635beb7f5204a4d` |

## Validation and next step

- All three input packets: `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralIwasawaTheory--I.1.json` (and I.8, L1) — zero errors, zero warnings. Their existing data was not edited; the package reconciliation above resolves older gaps and consumer wording.
- `lean-check research/blueprint/packages/IntegralIwasawaTheory/Suggested.lean` — exit 0 at the pinned shared build, only eleven expected `sorry` warnings. The file has eleven real-bodied definitions, eleven theorem signatures and twenty-one proved examples, with at most two per definition. All theorem signatures were checked against their precise quantifiers as recorded above. More than 70 GB memory was available. No language server, Lake build/update/cache command or private Lean project was used.
- `python3 research/blueprint/intake.py check-files research/blueprint/packages/IntegralIwasawaTheory/README.md research/blueprint/packages/IntegralIwasawaTheory/Suggested.lean research/blueprint/packages/IntegralIwasawaTheory/metadata.toml research/blueprint/handoff/PKG-IntegralIwasawaTheory~codex.md` — four files, zero problems.
- README is within the binding 50–200 KB size interval, with thirteen layers, forty-one explicit Checks lists and Examples/Dependencies in every layer. The Lean file is under 5,000 lines. `metadata.toml` selects `math.NT`.
- All 148 accepted node suffixes are accounted for exactly once in the reconciliation tables; a mechanical set comparison found neither missing nor extra nodes.
- `git diff --check` and the staged-file whitespace check pass. Only the four authorized deliverables are submitted.

The remaining work is independent package review and eventual formalisation of these targets. Heavy arithmetic carriers, the all-prime bounded complexes and the exact supplier extensions are plans in the README, not completed Lean implementations. No unresolved proof gap is hidden behind an assumed matrix, assumed characteristic identity, fake carrier or arbitrary interpolating object. No scratch file is needed by the next worker: locators, versions, proof routes, ownership adjustments and corrections are preserved here and in the package. Temporary reading material is deleted after opening the PR; no background process is left running.
