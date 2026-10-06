# REV-ShimuraVarieties--V0

Verdict: **needs_changes**. Completed independent review by Codex, session `codex-p9VIPI`, on 6 October 2026. Refs #490. This is a finished review of another session's plan, not a checkpoint.

The packet now records a verdict for every node. Clear corrections are applied to the packet and suggested file. The exact general boundary-growth predicate for `AutomorphicRing` remains unspecified, and the input reader retains claims contradicted by the corrected packet. These specification problems prevent acceptance. The other explicitly recorded proof and supplier gaps do not, by themselves, require rejection of a target-level plan.

The issue authorizes edits to the packet, suggested file and this report; WORKERS also permits this job's handoff. It names the reader as input, without authorizing its alteration. Consequently [the reader](../readmes/ShimuraVarieties--V0.md) needs the synchronization listed below. No upstream roadmap, atlas data, foreign packet or promotion file was changed.

## Counts and status

| Item | Received | Reviewed |
|---|---:|---:|
| Nodes | 69 | 69 |
| Theorems / definitions / constructions | 60 / 6 / 3 | 60 / 6 / 3 |
| API items | 43 | 56 |
| Discriminating unit-test specifications | 27 | 27 |
| Planets | 41 | 41 |
| Baseline declarations | 5 | 5 confirmed |
| Source PDFs | 9 | 11 |
| Source findings | 8 | 14: 13 confirmed, 1 rejected |
| Gaps / requests | 14 / 20 | 20 / 20 |
| Planned / partial / closed stages | 8 / 0 / 0 | 7 / 1 / 0 |

There are **44 verified, 24 corrected and 1 unverifiable** node verdicts. Twenty-five existing nodes were edited, including the unverifiable definition. No nodes were added or deleted. Six new gaps are marked `addedBy: REV-ShimuraVarieties--V0`. The packet is `partial`: V2 lacks an exact definition, and a complete packet below the 300-node budget cannot leave that stage partial. The independent review itself is complete.

## Sources and versions

All nine original PDF hashes match the packet's recorded hashes. The two corroborating PDFs added by this review also have recorded hashes and `sourceVersions`. Each node's locator and short excerpt was checked against extracted text or page images. Corrections include source wording and the distinction between propositions and theorems; an outline that only states a result is never described as its complete proof.

| Source ID and public text | Portions checked and limits |
|---|---|
| `svi`: [Milne, Introduction to Shimura varieties](https://jmilne.org/math/xnotes/svi.pdf), revised 16 September 2017 | §§3, 5, 10–14, including arithmetic quotients, compactification outline, CM proofs, special points and connected canonical models. It does not give the general Baily–Borel growth predicate or all primary proof leaves. |
| `cm`: [Milne, The fundamental theorem of complex multiplication](https://jmilne.org/math/articles/2007c.pdf) | §§2–3, especially the local integral splitting, ideal theorem, inverse-Artin convention and norm-kernel argument. The [author correction](https://www.jmilne.org/math/articles/2007c.html) confirms localization at the good prime. |
| `action`: [Milne 1983 annotated author scan](https://jmilne.org/math/articles/1983a.pdf) | Page images 239–263, including 3.8, 3.10, root subgroups, marked comparison, Proposition 6.1 and the connected appendix. OCR is unusable. The [author's comments and erratum](https://www.jmilne.org/math/articles/1983a.html) were also read. The marked arrow on p.256 is already correct in this copy; no new error is asserted there. |
| `descent`: [Milne, Descent for Shimura varieties](https://jmilne.org/math/articles/1999cP.pdf), author version dated 22 September 1998 | Entire §§1–2: effective descent, continuity counterexamples, finite automorphisms, rigidifying points and Theorem 2.3. |
| `bkt` and `bkt-err`: [Definability of arithmetic quotients](https://benjamin-bakker.github.io/DefArith.pdf) and [public erratum](https://benjamin-bakker.github.io/DefArithErr.pdf) | Introduction and §4.6, Theorems 4.12–4.13 on printed p.18; entire erratum. The fixed maximal compact and Cartan-compatible functoriality are retained. E2 is scoped to these author files, not an unread version of record. |
| `aghmp`: [Andreatta–Goren–Howard–Madapusi Pera](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), Annals 187 (2018) | §3.1, pp.415–416, including the finite étale Galois-set model and scheme/stack distinction; §3.2 marks the integral-model boundary outside V4. |
| `msc`: [Milne–Shih, Langlands's construction of the Taniyama group](https://jmilne.org/math/articles/1982c.pdf) | Images pp.229–230 and 242–243. The remaining global extension/class-formation proof is a supplier gap, not claimed read or closed. |
| `msd`: [Milne–Shih, Conjugates of Shimura varieties](https://jmilne.org/math/articles/1982d.pdf) | Images pp.280–281 and 340–345: contracted-product construction, completion symmetry and reduction. |
| `semistable`: [Conrad, Semistable reduction for abelian varieties](https://math.stanford.edu/~conrad/DarmonCM/2011Notes/SemistableReduction.pdf) | Theorem 4.2 p.9, Theorem 5.5/Remark 5.6 pp.17–18, Proposition 6.5 pp.23–24 corroborate the existing R11 semistability/inertia suppliers. |
| `platonov`: [Platonov–Rapinchuk 1979, Russian published original](https://uva.theopenscholar.com/files/ixqrlw/files/doklady_r_247_8.pdf), coauthor-hosted scan | Theorem 1 p.279 and proof conclusion/final discussion p.282, inspected as images. The result is perfection of the norm-one group with all finite local forms split. The text still treats simplicity modulo centre as a conjecture. The full perfection proof is left to its supplier. |

The [Annals Baily–Borel landing page](https://annals.math.princeton.edu/1966/84-3/p11) supplied metadata but not the full primary text. Its all-type definitions and convergence/separation arguments were not independently recovered. This limitation is recorded explicitly, especially for the unresolved automorphic-ring definition.

## Baseline verification

All five full statements were read at Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`. None was removed or replaced. Two declaration-kind annotations were corrected. The recorded Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`; no Tau Ceti declaration is cited by these five entries.

| Declaration | Kind and module | What it supplies |
|---|---|---|
| `MulAction.orbitRel` | `def`, `GroupTheory/GroupAction/Defs` | For a group action, the orbit setoid with relation `a ∈ orbit G b`. This supplies the equivalence relation, without topology or arithmeticity. |
| `MulAction.orbitRel.Quotient` | **`abbrev`**, same module | The quotient by that orbit relation; corrected from `def`. |
| `MulAction.stabilizer` | `def`, same module | The subgroup of elements fixing a specified point; it does not assert faithfulness or proper discontinuity. |
| `AlgebraicGeometry.Scheme` | **`structure`**, `AlgebraicGeometry/Scheme` | A locally ringed space locally affine; corrected from `def`. A model still needs its actual field, finite-type/separated properties and analytic comparison. |
| `CategoryTheory.Over` | `def`, `CategoryTheory/Comma/Over/Basic` | The fixed-codomain category via `CostructuredArrow`; instantiated for schemes over the actual `Spec E`. |

The reviewed `data/library-coverage.json` and the actual supplier statements were read. Existing group-action, scheme and modular prerequisites are imported. The advanced Shimura/analytic/canonical carriers are not marked implemented.

## Corrections, API and examples

1. **Neat levels and component arithmetic.** `V0/neat-sublevels` now imports AA.4's existing normal finite-index neat-level theorem and identifies its rational-conjugate convention with D5, instead of planning its congruence proof again. Its planet is “Neat levels in the Shimura tower”. The simply connected component formula retains the exact positive rational image `ν(G(Q)_+)=T(Q)∩ν(Z(R))`. AA.4 class-set, Kneser and Hasse inputs are explicit; SVI 5.21's almost-everywhere integral surjectivity via Lang/Hensel and local openness remains a precise owner extension.
2. **Disconnected covers.** `V1/holomorphic-level-maps` now distinguishes the effective image of `K/K′` from every automorphism over the base. For the norm datum on `G_m`, principal levels `K(21)⊂K(3)` are rationally neat. The target has one point, the source six points, and the effective group is the regular `C₆`, while the full deck group is `S₆`. Full equality needs connected regular-cover hypotheses. The atlas V1 wording needs the same clarification.
3. **Automorphic sections.** Added constructor, extensionality and evaluation APIs. The noncuspidal `E₄` test now uses torsion-free `Γ(3)`, so it lies within the node's hypotheses and distinguishes holomorphy from vanishing at cusps. However, naming growth and a nonnegative Fourier cone does not define the general rational boundary charts, allowable exponents or analytic extension condition. `analytic-automorphic-ring` is therefore unverifiable and V2 partial. Its dependent targets retain this explicit prerequisite.
4. **Canonical models and existing finite étale descent.** Replaced the empty-subset test with an actual bad model: the norm `G_m` datum at `K(5)` has two classes, swapped by cyclotomic character 2 modulo 5, whereas `Spec Q ⊔ Spec Q` fixes both. Added construction and morphism-extensionality APIs for canonical models, torus models and full CM objects, plus reflex-norm extensionality and multiplication. ModularCurves Layer 0 already plans the finite-continuous-Galois-set equivalence; it is imported, rather than requested as missing. Its affine finite-quotient API still needs the recorded general quasi-projective extension.
5. **CM reduction.** Replaced the absolute-inertia virtual pro-p argument with R11.3 semistable reduction and square-zero inertia, then R11.5 NOS. After defining all endomorphisms over the base, inertia acts by multiplication in the reduced algebra `E⊗Q_ℓ`; `(ρ(σ)−1)²=0` forces triviality. Conrad corroborates the global finite-extension step. Compactness or a Rosati norm constraint alone does not imply finite inertia. The unused A2 dependency on this node was removed, while A2 remains used for polarizations elsewhere.
6. **Connected data and twists.** Connected points are `S→G^ad_R`, including for simply connected `G`. A PGL₂ Hodge cocharacter need not lift integrally to SL₂. The marked torus is pulled back to `G`, but `μ_h` and the Serre action live in `T^ad`. D4's given-lift theorem is not an existence theorem for such a lift. Corrected the V6/V7 statements, hypotheses, acceptance and API accordingly. The invalid torus test for a semisimple construction is replaced by SL₂ with its norm-one Q(i) torus: complex conjugation reverses the cocharacter and the half-plane while the group remains split. The finite-local test now checks the distinguished marked torus map. Added contracted-product descent extensionality. Connected towers have diagram extensionality and the constant-pro-object mapping property; an inverse-limit point set is not asserted to be a finite-dimensional analytic space.
7. **General conjugation and continuity.** Corrected Proposition 6.1 and Propositions 14.14/14.16, actual source excerpts, and the final 14.16→14.15 full-component cross-reference. The zero-dimensional rigidifying argument uses all geometric points and remains in general existence. The distinct exceptional A₁ central-adjustment gap was strengthened after reading the actual Platonov–Rapinchuk paper: semisimple perfection does not justify the printed assertion about full reductive `Hα`. The unresolved passage back to the marked torus is now explicit. Cocycle, finite rigidity, open stabilizers and effective descent remain separate obligations.

The thirteen added API items are three for `AutomorphicRing`, two for the reflex norm, two for `CanonicalModel`, one for the torus model, two for CM abelian varieties, two for `ConnectedTower` and one for `conjugatedDatum`. All nine definitions/constructions have three discriminating tests. Four existing tests were corrected: `E₄`, the split two-point bad model, SL₂ conjugation, and the distinguished finite-local torus comparison. The other test specifications were checked with their stated hypotheses. The suggested file's manifest preserves every node, API and test name and matches the corrected mathematical specifications.

## Closure, ownership and assigned red-team findings

The full upstream HodgeStructures and ReductiveGroups documents, RS-04 and the scoped atlas stages were read. Every direct supplier node and all twenty stage requests were checked against their actual statements. Important boundaries are:

- D2–D5 provide the domain, actual pure data, special pairs, effective kernels and rational neatness. The connected adjoint carrier is made explicit rather than silently treated as a full datum.
- AA.3 owns reduction/class-set finiteness; its discreteness target needs the explicit arithmetic-commensurability extension. AA.4 owns neat existence, strong approximation and the simply connected abelianization/Kneser/Hasse inputs. Its covering theorem's compact-mod-centre stabilizer hypotheses require the recorded central-unit extension.
- ReductiveGroups Layer 7 supplies structural roots/tori/parabolics, not rational real density or the needed arithmetic/cohomological theorems. Those are precise Part II refinements. CFT Layer 11 supplies global Artin, but not Chevalley unit topology or the cyclic CM Hasse norm input. The proposed generic `CFT.N` interface is separate from the CM-specific deduction.
- CM.0 owns types/reflex types; V4/V5 consume them and never import downstream CM.2/CM.4 to prove V5. The missing Serre/Taniyama extension has the proposed shared owner `CM.S`, with torsor multiplication and its finite-adelic section.
- C0's requested analytification requires an earlier analytic carrier. C2/C4 provide projective GAGA/proper Chow, without a nonproper Chow implication. R09.7d supplies smooth compactification with normal-crossings boundary; R09.3 needs the exact continuous infinite-Aut quasi-projective descent interface. R09.4/R09.5 supply stack/coarse comparison only with their hypotheses.
- M0–M3 provide generic Siegel moduli, while M4 consumes canonical existence. A5's analytic converse depends on V5 and is not an independent shortcut. A6 still needs the positive-characteristic Hom/Tate refinement. ALS.0 does not yet state the required finite-automorphism and S-arithmetic superrigidity extensions. R11.3/R11.5 supply the repaired CM reduction route.
- V8's disjoint-special-reflex-fields and conditional model-uniqueness contracts are imported without requiring general existence to prove their conditional statements. Their proof prerequisites were checked for the intended absence of an existence cycle.

**RT-AREA-algebraicgeometry/3:** the packet and reader correctly propose a shared `CA.0` before C0, with local models `(V(I), O_U/I)` including nilpotents, morphisms, gluing, fibre products and SGA1 analytification. The consumers include V1/V2, C0, ShimuraCompactifications C2, PEL M3 and ModularCurves Part II R12.3. PR196/external records still need the stated ownership edits. The proposal is not an already implemented carrier. E8's source-error overclaim is rejected without weakening this carrier requirement.

**RT-AREA-algebraicgeometry/28:** the packet and reader correctly distinguish topological `TopCat.GlueData` from compatible complex atlases and holomorphic transition maps. They specify the PR279 M5/M6 gluing route to AnalyticToricGeometry Layer 3, the M7 bundle route to C0, and V1's direct use. CA.0 or real milestone IDs must own those edges; AnalyticToricGeometry must appear in the external consumer/area records. Retired LI.2/LI.4 supply no such edge. These proposals remain unapplied, and no foreign ownership file was edited.

At target granularity the outstanding Baily–Borel/Borel, Kazhdan, S-arithmetic, connected Deligne-extension and CM.S proof decompositions remain honest gaps. No large proof is relabelled routine or supplied by an axiom asserting the target itself.

## Coverage of every scoped stage

| Stage | Nodes | Status | Target coverage |
|---|---:|---|---|
| V0 | 6 | planned | Arithmeticity, commensurability, imported neat levels, effective proper action, finite components and the exact simply connected formula. |
| V1 | 6 | planned | Actual point carrier/topology/analytic charts, finite level maps, right translations, Hecke spans and datum maps; corrected effective-group convention. |
| V2 | 9 | partial | Rational strata, Satake topology, compactness, sections, separating series, analytic normality, finite generation, projective algebraization, Koecher and level extension are addressed. The section-ring boundary definition remains imprecise. |
| V3 | 7 | planned | Multivariable Borel extension, classical algebraicity, uniqueness/data maps, finite quotients, and independently qualified definable comparison/graph proof. |
| V4 | 8 | planned | Inverse-Artin convention, reflex norm, lift independence, full special-pair condition, existing finite étale torus descent, stack distinction, special existence and Hecke density. |
| V5 | 12 | planned | Weight-one algebraization, full product-CM objects/Tate modules/number-field models, repaired potential reduction, Frobenius and Shimura–Taniyama, ideal/full reciprocity, polarization/level, Siegel special points and canonical model. |
| V6 | 7 | planned | Subdatum inheritance, Hodge existence, connected pro-object/full symmetry/equivalence, products, central isogenies and abelian-type existence. |
| V7 | 14 | planned | Simple connected reduction, CM splitting, root subdata/central separation, actual twist, uniformization, weak/marked comparisons, completion equivariance, special independence, cocycle, finite rigidity, continuity and general existence. |

No stage is closed. Each remaining list names the concrete unresolved suppliers or primary proof refinements. The stage order follows RS-04's reduction→analytic→algebraic→reciprocity→CM→abelian/general existence route, without absolute-Hodge-cycle machinery replacing bare canonical existence.

## Independent source-finding verdicts

Every entry has `review.by: REV-ShimuraVarieties--V0` and an individual reason in the packet. E9–E14 were added here.

| Finding | Verdict | Evidence and effect |
|---|---|---|
| E1 | confirmed | Annotated 1983 p.250 and author erratum replace G by its centre Z in 3.8; retain exclusion of Aₙ, n≥4. |
| E2 | confirmed | Public BKT erratum repairs maximal-compact-dependent functoriality; scoped to the read author text. |
| E3 | confirmed | SVI p.114 reflex-norm formulas must be products in multiplicative tori. |
| E4 | confirmed | SVI p.127 isogeny quotient has the G₁ source, not the repeated G₂. |
| E5 | confirmed | 2007c p.22 fixed-s CM uniqueness uses art, the inverse of rec. |
| E6 | confirmed | Public author correction localizes the integral eigenspace splitting at the good prime. |
| E7 | confirmed | Descent Remark 1.3(c) explicitly repairs previously omitted continuity; a cocycle alone need not descend. |
| E8 | rejected | A nonreduced fat point shows why the new carrier needs scheme-valued Chow/GAGA, but does not establish that such a point is admitted by SVI Remark 3.9's convention-specific category. It is not an established source error. |
| E9 | confirmed | SVI p.101 absolute inertia is not virtually pro-p: its tame quotient has infinite pro-ℓ factors for ℓ≠p. Potential good reduction survives via semistability. |
| E10 | confirmed | SVI p.127 final full-model reconstruction refers to 14.15; 14.16 handles connected products/isogenies. |
| E11 | confirmed | SVI p.101 Tate representation of A/K is over Gal(Qbar/K), after defining the E-action, rather than absolute Q without descent data. |
| E12 | confirmed | 1983 p.252 applies a false literal normal-subgroup assertion to full reductive Hα. The cited 1979 theorem proves semisimple perfection. The correction needs a remaining marked-torus bridge; it does not invalidate the known canonical-existence theorem. |
| E13 | confirmed | Author-listed p.239 reference correction: Langlands pages 232–233. |
| E14 | confirmed | Author-listed p.239 deletion of the duplicated target finite-adelic group. |

For E12 a concrete check is `SU(4,1)` for Q(i)/Q with the diagonal norm-one torus. The noncompact root block subgroup contains the full torus but its derived group is `SU(1,1)≅SL₂`. The latter rational subgroup is proper, normal and noncentral because the remaining central torus has positive dimension. Its semisimple factor is already split at finite places. This disproves the literal reductive assertion while explaining why semisimple perfection and the torus comparison must be separated.

## Suggested Lean file and validation

The native declarations retain the actual diagonal/right orbit quotient and the inverse of a supplied homomorphism into a commutative group. Their signatures, level-map laws and tests were inspected. Native bodies are unchanged; only explanatory text and the explicit mathematical omission manifest were updated. The manifest has all 69 nodes, 56 APIs and 27 test specifications. It introduces no `True` stand-in or arbitrary Prop-valued substitute for a Shimura datum, boundary predicate or canonical model.

`lean-check research/blueprint/suggested/ShimuraVarieties--V0.lean` exited 0 with **23 `sorry` warnings and no other warnings/errors**, after the required memory check. The shared build's Mathlib dependency is the exact pin. Its Tau Ceti HEAD is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the packet's Tau Ceti pin; the file imports only Mathlib, so this validates its Mathlib-only native signatures. It does not validate an exact-pin Tau Ceti integration or any omitted advanced mathematics. Quotient topology, literal GL₂ data and actual global class-field reciprocity are outside the two compiled slices.

The packet checker reports **0 errors, 0 warnings**. Source-findings/version validators, review completeness, manifest consistency, permitted-file intake checks and `git diff --check` were also run. The remote submission check is recorded in the pull request.

## Decisions and reader synchronization for the orchestrator

1. Include the reader in the revision job's authorized outputs. Synchronize its coverage table/summary, the neat-level import/planet, component image formula, effective deck assertion and acceptance test, all thirteen API additions/four corrected tests, CM reduction proof, connected adjoint carrier/twist, source labels, supplier ownership requests and all fourteen source findings. Its current E8 claim must reflect the rejection. Use the corrected packet as the specification.
2. Obtain the primary Baily–Borel definitions and state the all-type analytic boundary predicate independently of the later compactification. Specify its charts/exponents, restriction/product laws, degree-zero constants, modular weight 2n and Veronese convention. A name for the missing predicate is insufficient. This is the one unverifiable node.
3. Apply the CA.0/red-team ownership proposals through their owning jobs, including real PR279 milestone IDs or CA.0 edges and the external consumer/area updates. Resolve whether the atlas V1 “deck group” target means the effective quotient-action subgroup or a connected regular-cover statement.
4. Route the precise AA.3/AA.4, arithmetic ReductiveGroups Part II, `CFT.N`, `CM.S`, ALS.0 and R09 refinements to their owners. In particular, the exceptional central adjustment needs a proved bridge from the exact rank-one perfection theorem to the marked torus; neither full reductive simplicity nor centre H¹ injectivity supplies it.

The packet's per-node review ledger follows. Its notes contain the statement/hypothesis, source and proof-interface checks for each entry.

| Node (prefix `ShimuraVarieties:`) | Verdict | Checked locator |
|---|---|---|
| `V0/stabilizer-arithmetic` | verified | svi 3.2 and 5.13, pp.33,57–58 |
| `V0/stabilizer-commensurable` | verified | svi 5.13, pp.57–58 |
| `V0/neat-sublevels` | corrected | svi Theorem 3.5 and §5, pp.34,58 |
| `V0/effective-proper-action` | verified | svi 3.6, 3.11 and 5.13, pp.34,37,58 |
| `V0/component-decomposition` | verified | svi Lemmas 5.11–5.13, pp.57–58 |
| `V0/simply-connected-components` | corrected | svi Theorem 5.17, Lemmas 5.18–5.21 and component-fibre argument, pp.59–61 |
| `V1/analytic-points` | verified | svi §5, definition before Lemma 5.13, p.57 |
| `V1/analytic-structure` | verified | svi §5, pp.57–58 |
| `V1/holomorphic-level-maps` | corrected | svi §5, p.58; finite-level consequence of the arithmetic covering supplier |
| `V1/right-translation` | verified | svi §5, pp.58–59 |
| `V1/holomorphic-hecke` | verified | svi §5, pp.58–59 |
| `V1/datum-analytic-map` | verified | svi Theorem 5.16 and following clarification, pp.58–59 |
| `V2/rational-boundary` | verified | svi 3.12, pp.38–39 |
| `V2/satake-compactness` | verified | svi 3.12, p.38 |
| `V2/analytic-automorphic-ring` | unverifiable | svi 3.13(c), p.39 |
| `V2/poincare-eisenstein` | verified | svi 3.12, p.38 |
| `V2/normal-analytic-compactification` | verified | svi 3.12–3.13(a), pp.38–39 |
| `V2/automorphic-finite-generation` | verified | svi 3.12–3.13(c), pp.38–39 |
| `V2/baily-borel` | verified | svi Theorem 3.12 and Remark 3.13, pp.38–39 |
| `V2/koecher` | verified | svi 3.13(b)–(c), p.39 |
| `V2/minimal-level-extension` | verified | svi 3.13(c), p.39 and Corollary 3.16 discussion, p.40; general extension proof is a gap |
| `V3/borel-extension` | verified | svi Lemma 3.15, p.39 |
| `V3/borel-algebraicity` | verified | svi Theorem 3.14 and proof, pp.39–40 |
| `V3/unique-algebraization` | verified | svi Corollary 3.16, p.40 |
| `V3/algebraic-data-maps` | verified | svi Theorem 5.16 and 3.16, pp.58–59,40 |
| `V3/finite-quotient-algebraization` | verified | svi Remark 3.13(a), p.39; neat tower p.58; finite quotient supplied by R09.3 |
| `V3/definable-target-comparison` | verified | bkt §§1.1–1.2 and §4.6, pp.2–4,18 |
| `V3/definable-borel` | verified | bkt §4.6, Theorems 4.12–4.13, p.18 |
| `V4/geometric-artin` | verified | cm §3, p.21, before Lemma 3.4 |
| `V4/reflex-norm` | corrected | svi §12, formulas (60)–(61), p.114, corrected from sums to products |
| `V4/reciprocity-finite-action` | verified | descent §2, pp.3–4, reciprocity map and its finite-level action |
| `V4/canonical-model` | corrected | svi Definition 12.8, p.114 and Proposition 12.10, p.115 |
| `V4/torus-model` | corrected | aghmp §3.1, p.416 |
| `V4/aghmp-stack-comparison` | verified | aghmp §3.1, pp.415–416 |
| `V4/special-existence` | verified | svi Lemma 13.3, p.117 |
| `V4/hecke-density` | verified | svi Lemma 13.5, p.118 |
| `V5/weight-one-algebraization` | verified | svi Theorem 14.8, p.122; algebraization through M3 and V3 |
| `V5/cm-abelian-variety` | corrected | svi Definition 14.9, p.123; field case §10 |
| `V5/cm-tate-rank-one` | verified | svi Proposition 10.5 proof, p.101; main CM proof p.109; integral order comparison 2007c §1.7 |
| `V5/cm-number-field-model` | verified | svi Proposition 10.3 and proof, pp.100–101 |
| `V5/cm-potential-good-reduction` | corrected | svi Proposition 10.5 and proof, p.101; semistable Theorem 4.2, p.9; Remark 5.6, p.18; Proposition 6.5, pp.23–24 |
| `V5/cm-frobenius` | verified | svi Lemma 10.9 and proof, p.103 |
| `V5/shimura-taniyama` | verified | svi Theorem 10.10, p.103 and proof pp.104–105; 2007c Theorem 2.1 |
| `V5/cm-ideal-reciprocity` | verified | cm Theorem 3.2, pp.19–20 |
| `V5/main-cm` | verified | cm Theorem 3.10 and Lemmas 3.6–3.12, pp.21–24 |
| `V5/cm-polarization-level` | verified | cm Remark 3.11(c), pp.22–23 |
| `V5/siegel-special-cm` | verified | svi Definition 14.9, Proposition 14.10 and Corollary 14.11, pp.123–124 |
| `V5/siegel-canonical` | verified | svi Proposition 14.12 and existence proof, pp.125–126 |
| `V6/hodge-inheritance` | corrected | svi Proposition 14.14, p.127 |
| `V6/hodge-canonical` | corrected | svi Proposition 14.14, p.127 |
| `V6/connected-tower` | corrected | svi Theorem 14.15, p.127; 1983 Appendix, p.263 |
| `V6/connected-full-equivalence` | verified | svi Theorem 14.15, p.127 |
| `V6/connected-products` | corrected | svi Proposition 14.16(a), p.127 |
| `V6/central-isogeny-descent` | corrected | svi Proposition 14.16(b), p.127 |
| `V6/abelian-canonical` | verified | svi §14, pp.127–128 |
| `V7/simple-connected-reduction` | corrected | action Theorem 7.1, p.262; SVI §14, p.128 |
| `V7/auxiliary-cm-splitting` | corrected | action §4, p.253; §6, pp.260–262; SVI §14, p.128 |
| `V7/rank-one-subdata` | corrected | action §4, pp.253–254; Remark 1.5, p.242 |
| `V7/rank-one-central-separation` | corrected | action Proposition 4.3 and Corollary 4.4, p.254 |
| `V7/conjugated-datum` | corrected | msd Introduction, p.281 (Taniyama torsor and contracted product); action Remark 1.4, pp.241–242; Appendix (C), pp.262–263 |
| `V7/kazhdan-uniformization` | verified | action Theorem 3.2, p.246 |
| `V7/weak-conjugation` | corrected | action Proposition 3.1 and §§3.3–3.10, pp.245–252; platonov Theorem 1, p.279; final discussion, p.282 (Russian published original) |
| `V7/marked-conjugation` | corrected | action Theorem 1.1 and uniqueness Remark 1.3, p.241; §§4–5, pp.253–256 |
| `V7/completed-conjugation-equivariance` | corrected | action Proposition 6.1, p.257; MS §8, pp.340–341 |
| `V7/special-independence` | corrected | action Theorem 6.3 and proof, pp.258–262 |
| `V7/conjugation-cocycle` | corrected | action Theorems 7.1–7.2, p.262; Descent §2 |
| `V7/finite-rigidifying-points` | corrected | descent Lemma 2.2 and Theorem 2.3, pp.4–5 |
| `V7/continuous-descent` | verified | descent Theorem 1.1, Corollary 1.2, Remark 1.3(c), pp.1–2 |
| `V7/general-canonical` | verified | descent Theorem 2.3 and Remark 2.4, pp.4–5; 1983 Theorem 7.2 |
