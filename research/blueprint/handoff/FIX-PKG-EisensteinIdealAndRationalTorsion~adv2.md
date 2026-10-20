# Eisenstein package: supplier closure

Job `FIX-PKG-EisensteinIdealAndRationalTorsion~adv2`, issue #11260. Agent: Codex, session `codex-n4TIiW`, 2026-10-20.

This is a completed package fix. C1–C4 are resolved by the supplier targets the maintainer authorized in the issue, with the hypotheses checked against their actual README statements. The package verdict is `accepted`; this is acceptance of the mathematical plan, not a claim of formalisation. All 56 numbered targets, nine layers and nine Lean theorem statements remain. No second job was claimed.

## Finding dispositions and supplier versions

The independent report available in the clone is `REV-PKG-EisensteinIdealAndRationalTorsion~codex.md`; the issue's `~adv.md` report is absent. I also read the previous `FIX-PKG-EisensteinIdealAndRationalTorsion~adv.md` handoff and its C1–C4 restart instructions. That earlier checkpoint's obstacle was missing owner targets. This issue explicitly authorizes the following targets, so no supplier edits or new continuation are needed in this fix.

| Finding | Supplier read, at immutable revision | Change and closure evidence |
| --- | --- | --- |
| C1 | [ModularCurvesPartII PR #913](https://github.com/TauCetiProject/TauCetiRoadmap/pull/913), `27ac927ca0300d6bb9e77d892efc9af96d46027f` | Cite §§13.7–13.9: `integral-dualizing-forms`, `integral-modular-serre-duality`, `integral-hecke-duality-compatibility`. Retain proper/flat/CM and coherent base-change conditions; distinguish coarse, regular and stack models, B from A, and the narrower resolution-comparison coefficient range. Characteristics 2, 3 and P remain included. Every former differential-extension prerequisite now names these sections. |
| C2 | [FiniteFlatGroupsAndIntegralPadicHodgeTheory PR #879](https://github.com/TauCetiProject/TauCetiRoadmap/pull/879), `97297b9ce296e3155c5cd25162af1741224b1a25` | Cite §§R07.G1–R07.G8 for marked global models, geometric lengths, cohomology, global rank-one classification, Ext, odd purity, D and amalgams. Each target's incoming edge names the relevant subset. The cohomology inequality has no extraneous congruence restriction. Lemmas 17.5/17.7's ambient Jacobian, Hecke stability and induction remain §4.5 here. |
| C3 | [NeronModelsAndSemistableAbelianVarieties PR #852](https://github.com/TauCetiProject/TauCetiRoadmap/pull/852), `8e2d6f14740eb87e75f9c1a647f7bbc51b0edb05` | Cite §§6.4a–6.4d: `connected-neron-kummer`, `connected-neron-localization`, `neron-isogeny-component-defects`, `semistable-quotient-cotangent`. Record quasi-finite rather than necessarily finite torsion, rational component terms, general number-field localization, the real-place 2-primary discrepancy, and exact cotangents for connected-kernel quotients under e<p−1. Section 6.5 keeps the Eisenstein kernel/component calculation and now factors maps through their images before cohomology. |
| C4 | **Package-stage supplier** [CyclotomicClassGroupsAndStickelberger package PR #11262](https://github.com/CBirkbeck/tauceti-explorer/pull/11262), `6dc5f190597b9cd11999fba7069704cc53f99c8d`, submitted for job #11246 | Replace the unnamed ClassFieldTheory Part II with this owner. `cyclotomic-class-eigenspaces` is §§0.2–0.3 (`cyclotomicClassEigenspace`, `cyclotomicClassEigenspaces`); `stickelberger-herbrand-annihilator` is §3.2 (`bernoulli_annihilates_component`, `herbrand`, exceptional exponent-one vanishing); `inverse-character-unramified-quotient` is §§8.1–8.2 (`inverseCharacterClassGroup`, `inverseCharacterUnramifiedQuotient_zero`). Section 8.4 explicitly exports these contracts. The prime-conductor finite-level statements suffice; no later modular converse or Iwasawa main theorem is imported. |

The C4 revision is an actual submitted package, rather than a promise that a design will acquire the target. It supplies full P-primary Teichmüller eigenspaces, covariant ideal/Artin equivariance and the unramified quotient with an actual conjugation action. The present application has odd P≥11, L/K cyclic of degree at most P, L/ℚ Galois, and unramifiedness at every finite prime. At P=3 the separate exponent-one theorem would apply; the B₂-unit argument is restricted to P≥5. Full class-number vanishing is neither required nor asserted.

Two further prerequisite corrections arose while checking these interfaces:

- Sections 7.4 and 7.6 use local closure/full faithfulness, §§R07.1.20 and R07.1.30, where the coefficient prime can equal P. They do not apply the global G-layer's distinct-prime hypothesis there.
- The level-13 E_γ has a nontrivial order-six character. Sections 8.3 and 8.5 use finite-flat closure, finite étale descent and gluing, not an admissible 19-group filtration. Section 8.5 names SchemeAndStackFoundations' torsor-H¹, étale/fppf comparison and fppf Kummer targets for the cohomological identifications. Its direct class-number certificate stays here.

No supplier statement is re-planned as a new consumer target. The exact contracts explain what is imported. The Eisenstein-specific T-stable saturation, good-prime iteration, kernel C_ℓ⊕Σ_ℓ, component skyscraper, and inseparable degree calculations remain mathematical work here. The latter retain degree p for t↦tᵖ in characteristic p, rather than its single geometric kernel point.

## Adversarial pass on the touched contracts

Each row includes the hypotheses, defining formulas and incoming interface. Arithmetic witnesses were independently recomputed using integers and rational numbers. Geometric counterexamples are checked against the source and supplier; these computations are not claimed Lean proofs. Invalid instances such as residue cardinality one, m=0 in Kummer theory, equal coefficient/level primes in R07.G, or a rank-zero group in the rank-one classification are excluded explicitly. No compactness hypothesis was added or discarded.

| Statement | Instances or attempted failure | Result and change |
| --- | --- | --- |
| Ownership and every-prime scope | P=2,3,5,7,13; n=1; zero Jacobian/quotient | Pass. Zero cases survive; the P≥5 differential comparison is not used to manufacture a nonzero generator at the smaller levels. All 56 targets remain. |
| C1 dualizing module and base change | Genus zero; nodal genus one; field versus DVR; non-Gorenstein model | Pass. CM/proper/flat hypotheses and locally free cohomology remain. Invertibility of ω requires Gorenstein fibres. Global-section base change is not inferred solely from sheaf base change. |
| C1 integral lattices | P=5,7,13; R flat over ℤ or ℤ/m; resolution over a field algebra; reduction at P | Pass. Coarse lattice uses the full Proposition 3.3 coefficient category; resolution comparison uses flat-over-ℤ or flat-over-a-field hypotheses. |
| C1 stack/coarse correction | P=5 over 𝔽₂; P=7 over 𝔽₃; E₂(q)−PE₂(qᴾ) | Pass. Noncuspidal A/B has dimension one in the exceptional cases; cuspidal spaces vanish there. The integral expansion at ∞ does not impose moduli integrality at the other cusp. |
| C1 residues and Hecke normalization | Residues (1,−1), including characteristic 2; a₁=1,a₂=3,a₄=7; p-Frobenius | Pass. Residue sum zero; T₂ coefficients are 3 and 9. Inseparable degree is p, not 1; no division by p in the trace. These witnesses are README Checks. |
| C1 single-cusp detection | X₀(55) over 𝔽₅, differential on the component missing ∞ | Pass. General composite-level single-cusp injectivity is not asserted. The supplier's detection hypotheses remain. |
| C2 marked models | Zero group; full constant model versus its minimal model; nontrivial inertia | Pass. Minimal model retains the identity but has δ=1 for ℤ/ℓ; the full constant model has δ=0. Generic modules alone do not determine the model. |
| C2 lengths/cohomology | Zero; ℤ/ℓ; μ₂; minimal constant model; unramified twists | Pass. The three nonzero tuples (δ,α,h⁰,h¹)=(0,1,1,0),(0,0,1,1),(1,1,0,0) satisfy equality. Dropping h⁰ already fails for ℤ/ℓ. α and δ use geometric points. |
| C2 global rank one | k=𝔽_ℓ and 𝔽_{ℓ²}; all ℤ versus punctured or ramified base | Pass. k-rank one has geometric rank #k. The theorem stays global; dyadic generic characters do not identify constant and multiplicative models. |
| C2 Ext and purity | Odd ℓ; ℓ=2; D over ℤ unramified at odd P | Pass. Ext variance is retained; odd purity is not applied to D. Ext uses its actual global target, not a local classification alone. |
| C2 D/amalgam | M=μ₂; rank M=4; multiplicative type versus μ-type | Pass. Ranks are 4 and 8, not 4 and 16; special étale order is 2. M need not have constant Cartier dual. |
| C3 Kummer | A=0; m=1; Tate curve m>1; additive fibre in characteristic p with m=p | Pass. Zero cases vanish; generic Tate rank m² versus special rank m excludes a globally finite-flat torsion kernel. Additive multiplication by p fails surjectivity, so semistability remains. |
| C3 localization/Sha | Nonzero component image; odd-primary torsion; real place; coefficient 2 | Pass. Sections of the connected model can be smaller than A(F). The odd image equals odd Sha; dyadic Sha embeds into the image, with real-place defect killed by 2. |
| C3 isogeny defects | Tate map E_q→E_{qᵐ}, n=v(q)=1,2,5 and m=1,2,3 | Pass. Component map r↦mr from ℤ/n to ℤ/mn has cokernel ℤ/m. Split through the image before using a long exact sequence; the component skyscraper is retained. |
| C3 cotangents | Split product, zero factor, reduction modulo odd p; e=p−1; p=2,e=1 | Pass. Free exact quotient sequence survives base change. A same-rank map ×p does not. Serre's boundary example on Mazur 1978 p.138 prevents weakening the strict bound. Bad semistable p∥N remains allowed. |
| C4 integral eigenspaces | Zero module; P=3,5; module ℤ/25 with tame actions 7 and 18 | Pass. Teichmüller lift of 2 is 7 modulo 25, inverse 18. The inverse quotient of the action-18 module is all of it, while the action-7 quotient is zero since 7−18 is a unit. Arithmetic vanishing concerns the actual class group. |
| C4 Herbrand/quotient | P=5,j=3; P=3,j=1; irregular prime; nonnormal or ramified L | Pass. B₂ numerator is 1 and denominator 6 is prime to P≥5. Exponent one uses its exceptional theorem. Only the specified eigenspace vanishes. Nonnormal or ramified extensions fail the required class-field hypotheses. |

The heavy objects in these rows are not native pinned carriers, so their Checks remain in the README. I did not invent a finite-module encoding or numerical Lean examples to impersonate them. The retained light `cuspidalIndex` definition already has its two discriminating proved examples, as required by the 2026-10-19 compact-file rule.

## Pass on each affected numbered target

The following targets had their incoming references changed, even where their mathematical statement was retained. Each row rechecks the relevant boundary instance; the entire target and its API/Checks were considered, not just the edited dependency sentence.

| Target | Instances tried | Result and change |
| --- | --- | --- |
| 0.3 integral congruence | P=11,m=5,25,11; P=17,m=4; P=13,m=1; residue 2/3 | Pass. Exact numerator and integral differential category unchanged; C1 now supplied. |
| 0.4 integral duality/index | Genus zero; T=0; n=1; invertible module without global basis | Pass. No global basis inferred; C1 §§13.7–13.9 supply the geometric integral pairing. |
| 1.4 cuspidal order/model | n=1,5,4; dyadic special fibre | Pass. Exact order and nonconstant dyadic integral model remain; use G1–G2/G4. |
| 1.5 Shimura subgroup | Trivial deck group; order 5; level fibre | Pass. Cartier dual of the deck group remains canonical; G1–G2 supply marked model operations. |
| 1.6 intersection | Odd n=5 versus n=4; scheme intersection | Pass. Odd intersection zero, even intersection μ₂; no false dyadic direct sum. |
| 2.1 ideal kernel | Unit ideal; scalar ideal; inclusion of ideals; arbitrary non-Eisenstein ideal | Pass. General closure is R07.1.20. G1–G2 are used only for admissible Eisenstein specializations, not all ideal kernels. |
| 2.2 completion | n=1,5,10; candidate ℓ=P | Pass. Only primes dividing n occur; integral pairing comes from C1. |
| 3.1 constituents | ℓ≠P versus ℓ=P; unramified twist | Pass. Global G1–G4 is used in its range; the level-primary case retains all-n Raynaud uniformization. |
| 3.2 étale multiplicity | Rank-one piece versus full rank-two torsion; ℓ=2 | Pass. Integral duality and connected–étale inputs now named; no odd purity at 2. |
| 3.4 good prime/principality | Good residue class; non-coprime class; ℓ=2 | Pass. Dirichlet's coprimality remains; structural result stays odd-primary. |
| 4.1 winding | Reverse path; n=5; rational versus integral winding element | Pass. Factor n retained, C1 now supplies the integral lattice. |
| 4.3 D embedding | P=17 versus 41; constant versus nonsplit generic action | Pass. G7 supplies D; both arithmetic embedding branches remain here. |
| 4.5 dyadic local ring | D; D×ℤ/2; P=17,41; n=1 | Pass. Extra constant factor has special étale order 4 and fails saturation. Good l≠2, T-stability, ambient η_l-torsion and global stability of the iterative connected parts remain explicit. Added exact Lemmas 17.5/17.7 locators. |
| 4.6 conjugation module | ℤ₂; odd ℤ_ℓ; rank zero | Pass. Group-ring freeness retains the integral factor two; C1 named. |
| 5.3 μ-type maximality | Constant dual versus nontrivial unramified dual | Pass. Only μ-type maximality asserted; G1–G6 do not broaden it to all multiplicative-type groups. |
| 6.1 cohomology tower | Zero kernel; geometric/rational fibre points; ℓ=2; increasing m | Pass. Matching m·d linear terms use G1–G3 without a P-congruence hypothesis. |
| 6.2 MW/Sha finiteness | Finite component quotient; direct limit; coefficient 2 | Pass. Connected Kummer and localization use 6.4a–c; dyadic inclusion suffices. |
| 6.5 odd Sha | Zero primary module; finite ℤ/9 with ×2 or ×3; component defect | Pass. Corrected the proof: finite plus injective alone is insufficient. The localized primary module is also killed by a power of η_l; injectivity then gives zero. Eisenstein kernel/component computation remains here. |
| 7.4 small reduction | Residue 2,3,P; split/nonsplit torus | Pass. Coefficient-equals-level comparison uses local R07.1.20/.30, not the distinct-prime global layer. |
| 7.6 division field | Diagonal characters 1,χ_P; zero extension; multiplicative P-fibre | Pass. Conjugation on Hom(μ_P,ℤ/P) is χ_P⁻¹; local full faithfulness supplies the integral input. |
| 7.7 cyclotomic obstruction | P=5 inverse scalar 3 versus scalar 2; trivial L/K; hypothetical degree P | Pass. C4's actual equivariant quotient closes the obstruction; whole-class-group regularity is not assumed. |
| 7.9 formal immersion | General N; p∥N; split multiplicative fibre; zero kernel; e=q−1 | Pass. C1 and C3.6.4d cover integral differentials/cotangents at bad semistable primes. Formal-kernel torsion-freeness retains the strict inequality. No prime-level-only narrowing. |
| 8.3 norm-19 kernel | Generic/integral rank 19²; order-six line; zero local invariants | Pass. Removed inadmissible global-G dependency. Local closure/descent and the correct Mazur–Tate p.47 statement suffice. |
| 8.5 level-13 cohomology | Degree-12 cover; nonconstant character; μ₁₉; local units at 13 | Pass. Named the torsor/topology/Kummer input. The calculation does not apply the admissible-group inequality to E_γ. Full class-number certificate and all its hypotheses remain unchanged. |

All other numbered targets retain their statements, Checks and prerequisites. Per-layer dependency paragraphs were synchronized with the references in this table.

## Source and library verification

I read the relevant primary-source statements, in addition to the complete supplier sections above:

- Mazur 1977 I §1, pp.43–49, especially Proposition 1.5 and Proposition 1.7, for global rank one, marked models, geometric lengths and the cohomology inequality; Proposition 2.8 and Corollaries 2.9–2.10, pp.53–54, for the integral character convention and inverse component; I §§3–4, pp.54–60, for purity and D.
- II Definition 3.1, (3.2), Lemma/Proposition 3.3 and Proposition 3.4, pp.67–69; Lemmas 4.5–4.8 and convention 4.9, pp.75–77; the integral Hecke construction on pp.88–89 and §9 pp.94–96. These verify the coefficient and model distinctions in C1.
- II Lemmas 17.3, 17.5 and 17.7, pp.130–134, for the exact finite-flat/Hecke boundary and Galois-stable iteration. In particular an arbitrary extension by order two is insufficient.
- III Lemma 3.3, p.149, and Proposition 3.6, pp.150–151, for connected cohomology, components and the η_l descent. This verifies the consumer's own localized kernel/skyscraper calculation.
- Mazur 1978 §1(c–e), pp.135–138, including Proposition 1.3 and Corollary 1.1, and §2(d–e), pp.140–141, for semistable quotient cotangents, their strict ramification bound and arbitrary-level modular differentials.

Public PDFs read: [Mazur 1977](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), SHA-256 `c20c7e73be20d6cc961127504b6be019f7707e0ee6154ba1fac0bbfd5973be8a`; [Mazur 1978](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf), SHA-256 `f3da9ef0d3d184225c4799951897be7b90d8b25050c5d508b69aeff70fd2ead3`. Locators above are printed page numbers. No source passage or source file is added to the repository. The cleared-library index was consulted; no restricted file or passage was copied.

The new roadmap has no library-audit entry in `data/library-coverage.json`. I checked the current read-only roadmaps at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine roadmaps absent from the atlas snapshot and Completed. Searches covered the actual objects: Eisenstein ideals, cuspidal indices, Shimura groups, cyclotomic annihilators and Néron models. The additional Stickelberger result currently in Tau Ceti concerns discriminant congruences, not the class-group annihilator. Local-Galois cyclotomic-polynomial Eisenstein criteria and lattice genus class numbers likewise do not replace these targets. No additional duplicate was found. Current ClassFieldTheory and ModularCurves were read as nearby upstream models.

At the pinned baseline I read the native Weierstrass point and ellipticity definitions; order conversion; primes in progressions; Hecke degree; the bundled abelian variety; class-number/Minkowski criteria; and the cyclotomic integral-closure, power-basis and discriminant statements. They provide the carriers or results cited, not the new arithmetic conclusions. In particular the invertible single-coset degree is +1 and does not replace the Fricke character −1.

## Lean signatures and checks

`Suggested.lean` is 90 lines: `import Mathlib`, one namespace, one real-bodied definition, two proved examples and nine theorem targets. The only edit removes six empty layer headers. All ten named declarations were compared with the README:

| Declaration(s) | Boundary check and result |
| --- | --- |
| `cuspidalIndex` and its four API theorems | P prime where required; values 1 at 2,3,5,7,13, 5 at 11, 4 at 17. Rational numerator and gcd formula agree; P=1 has value zero and is excluded from positivity. |
| `isogeny_iteration` | Five genus-zero exclusions; actual rational elliptic model and nonsingular point. Includes exclusion of order 11. |
| `cyclotomic13_classNumber_one` | Native field and full class number, matching the direct certificate. |
| `order_thirteen_exclusion` | Separate order-13 theorem with ellipticity retained. |
| `occurring_small_primes` | Existential curve includes ellipticity and a native point for exactly 2,3,5,7. |
| `all_prime_torsion` | Prime order on an elliptic model; identity order 1 and infinite order 0 do not satisfy the hypothesis. |

Validation results:

- `lean-check` on this package's `Suggested.lean`: **exit 0, nine warnings, all `declaration uses sorry`; no errors or other warnings**. Memory was checked first; only the shared wrapper was used. No Lean edits followed compilation.
- `mech_check`: **exit 0**; ten declarations, zero missing own identifiers, zero missing labels, zero round names, zero empty Lean sections. Its sole “bold target with no backticked name” is the required `Summary.` paragraph, not a mathematical target.
- `scripts/check_sorry_data.py`: **exit 0**.
- `scripts/build.py` with output in scratch: **exit 0**.
- `depcheck --candidate … --only EisensteinIdealAndRationalTorsion`: only **NOT IN ORDER.txt**, 116 roadmaps/1125 edges, no cycle. The issue expressly says to ignore this diagnostic; the maintainer inserts this new package into ORDER at port time.
- `scripts/check_blueprint.py` on the unchanged packet: **exit 0, zero errors/warnings**; 56 nodes, nine gaps and 23 requests, nine planned stages and zero closed stages. This historical packet is outside the deliverables, so its structural success is not a claim that its old gap bookkeeping was closed.
- `research/blueprint/intake.py check-files` on all four deliverables: **exit 0, four files, zero problems**.
- `git diff --check`: **passed**. Only the four authorized deliverables are changed; no private paths or source excerpts are committed.

## Port notes and remaining work

No unresolved consumer obligation from C1–C4 remains. The maintainer still handles port order and the package-stage C4 supplier. Place the consumer after all its suppliers; no ordering file was changed. C4's finite forward annihilator/quotient targets do not depend on this consumer's torsion descent, so no circular argument is used.

`upstreamNotes`: R07.G5 in the authorized finite-flat supplier independently includes a cyclotomic class-obstruction target. The canonical general owner is now CyclotomicClassGroupsAndStickelberger §§3.2/8.1–8.2. At port, that supplier can import the owner rather than duplicate the proof. The exact finite-flat Ext target already has its own complete prerequisites; this duplication is not an absent input to this consumer and was not edited here.

Other authors' PR files and all fetched sources were treated as mathematical data. No instruction to execute code, use credentials or edit unrelated paths was encountered or followed. The handoff contains the revision pins, results and witnesses needed after scratch is removed.
