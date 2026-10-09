# Independent review of SchemeAndStackFoundations SF.4

**Verdict: needs_changes.** This is a finished independent review for #6286, by Codex, session `codex-XbiOPb`, on 9 October 2026. The reviewed planning pass was written by Claude Code (`cc-ebcf9c`); this session did not write or previously review it. Clear corrections are applied to the packet and suggested file. The remaining key-input gaps and the inconsistent reader prevent acceptance.

All 57 nodes were checked at **target granularity**, including their statements, locators, hypotheses, proof dependencies, API items and tests. There are 17 definitions, 4 constructions, 32 theorems, 3 lemmas and 1 application. The final packet has 139 API items, 91 tests, 6 planets, 79 baseline declarations, 10 requests and 9 gaps. No nodes were added; no citations were removed for nonexistent declarations. The node matrix has 20 verified, 22 corrected and 15 unverifiable entries. Unverifiable means that the mathematical target has an identified unclosed prerequisite or unread source; it is not an assertion that the theorem is false.

SF.4 coverage changes from `planned` to `partial`: several routed stage obligations and key prerequisites are still absent. The packet status changes to `partial` because the validator does not permit `complete` below the 300-node budget with an unplanned stage. The **review itself is complete**. This is not a checkpoint or a request to continue reviewing. The review object records `needs_changes`, so the next mathematical work is a revision of the planning pass.

## Evidence and source access

I opened the public sources at the versions recorded in `sourceVersions`, checked their SHA-256 values, and read the cited statements and the proof passages bearing on the findings. Locators below refer to printed pages unless expressly marked as preprint pages. Repository statements and explanations are paraphrases, not source excerpts.

- [De Jong, published IHÉS 83 (1996)](https://www.numdam.org/item/PMIHES_1996__83__51_0/): definitions in §2, nodal-resolution arguments in §3, Theorem 4.1 and its fibration/stable-extension proof, Theorem 5.8, §6.2–6.16, and §7.2. The §6.4 converse finding is against the **published p. 83**.
- [Deligne–Mumford, IHÉS 36 (1969)](https://www.numdam.org/item/PMIHES_1969__36__75_0/): §1 pp. 76–85, especially 1.3–1.6, 1.9 and 1.11; §2 Corollary 2.7; §5 Proposition 5.1 and Theorem 5.2. The deformation functor keeps the special-fibre identification and is distinct from the embedded Hilbert atlas.
- [Deligne, Astérisque 127 (1985)](https://www.numdam.org/item/AST_1985__127__131_0/): 1.4–1.7 and 3.1–3.7. The scan, checked visually, reads **Lemma 3.5.1, p. 139**, not 3.5.7. Section 3.7 explicitly attributes projectivity to Mumford.
- [Nitsure, arXiv:math/0504590v1](https://arxiv.org/abs/math/0504590v1): §1 Grassmannians, Theorem 2.3 p. 11, Theorems 3.3–3.7 pp. 15–17, Theorems 4.2–4.3 pp. 18–19, and Theorems 5.1–5.3 p. 24. Section 3 is coherent cohomology/base change; the flattening-stratification theorem is **4.3**.
- [Bhatt, arXiv:1608.08882v2](https://arxiv.org/abs/1608.08882v2): Theorem 6.1 and Proposition 6.2 are on **p. 11** of this version. The old pp. 8–9 locator is corrected. The relevant geometric step is domination of the proper formal modification by an admissible blowup.
- The Stacks tags listed in the packet were opened directly. Particularly decisive are [06JA](https://stacks.math.columbia.edu/tag/06JA), [06T4](https://stacks.math.columbia.edu/tag/06T4), [06T5](https://stacks.math.columbia.edu/tag/06T5), [0C6R](https://stacks.math.columbia.edu/tag/0C6R), [0200](https://stacks.math.columbia.edu/tag/0200), [089A](https://stacks.math.columbia.edu/tag/089A), and [0FD6](https://stacks.math.columbia.edu/tag/0FD6).

Knudsen II was not read in this review. Its scan is publicly linked by the packet, but the pointed statements still rest on the explicit unread-source gap. No private book or unapproved copy was used. The nearby upstream documents read were `content/tau-ceti/StableReduction/README.md` and `content/tau-ceti/AdicSpaces/README.md`; the JacobianChallenge C/E supplier statements and the relevant SF.0/SF.1/SF.2/SF.3 scope contracts were also compared.

## Corrections and closure findings

1. **Thickenings.** A nil ideal need not have a locally uniform nilpotence exponent. The general definition now uses elementwise nilpotence on affine charts; finite-generation supplies a uniform exponent. The new infinite-variable example catches this distinction. Affine formal-smoothness locality now identifies its own Hom-sheaf vanishing input instead of treating the later torsor theorem as an unexplained prerequisite.
2. **Groupoids and hulls.** Groupoid RS gives H1/H2 on isomorphism classes, not automatically H4 (Stacks 06JA). This distinction is corrected both in the general functor node and the smooth-scheme deformation node. Classical Schlessinger criteria in Lean now require a complete Noetherian local Λ with its residue-field quotient Λ → k. A ring-minimal versal object (06T4) need not be a tangent-bijective hull without H2. The power-series factorization now assumes the classical setting and H1/H2. The one-point functor example now requires nonempty as well as subsingleton values.
3. **Obstructions.** The packet retains the natural O ⊗ I definition. The Lean object that only detects whether a lift exists is renamed `LiftDetector`; it cannot silently stand for that definition. The relation bound is removed from the claimed API and put in a precise gap until its source and minimal-presentation argument are supplied. The old typed theorem allowed P=Λ[[t]], J=(t), R=Λ and O=0, and would have concluded 1 ≤ 0. Tensor-valued naturality is added to the planning API.
4. **Framed liftings.** The H¹ torsor for scheme deformations keeps the chosen identification over the given A-deformation. For line bundles, the object being lifted is L_A on X_A, with an identification after restriction. Forgetting that identification gives a fibre of Pic whose H¹ action is quotiented by the boundary of H⁰ of units. The directionally invalid expression L₀ restricted to a thickened X is removed.
5. **Cotangent bridges.** The ring-level naive cotangent declarations do not construct the global sheaf object with its Ext classification. Ordinary Kähler differentials of k[[u,v]] cannot be used as if they were continuous differentials of the formal node. The local node proof now starts with the polynomial node and records the completion comparison; the global geometric statement is restricted to the algebraically closed split setting actually read in DM69. Curve H² vanishing and pointed local-to-global deformation are also explicit prerequisites.
6. **Formal objects and algebraization.** `AdicSystem`, `SpfSystem` and `completionSystem` are auxiliary Lean systems with chosen levels. Their `Hom` preserves the chosen ideals; it is not the full category of continuous formal morphisms. For example the identity k[[t]] with source ideal (t) and target ideal (t²) is continuous but does not preserve those chosen ideals at level zero. Genuine formal schemes need reindexing and the topological sheaf comparison. Completion of a map carrying centres merely set-theoretically needs that reindexing too. The typed map-algebraization theorem without transition compatibility and the typed algebraization theorem without an ample invertible system are removed; precise source-correct targets remain in comments. Existence uniqueness is relative to a specified formal comparison, and formal-module isomorphisms must be compatible, not merely unrelated levelwise isomorphisms.
7. **Strict transforms.** De Jong's integral-base transform kills base torsion. Closure over an isomorphism open agrees with it only when the family is flat there. Agreement with blowup exceptional torsion requires flatness over the full complement of the centre, not just a smaller dense flat open. For the x-axis in the affine plane blown up at the origin, y kills the base-torsion transform, so it is empty; the imported blowup transform is the line. The API and test now record this difference. The packet now states the convention, and Lean's closure consequence requires the dense flat open. The uniqueness statement now requires schematic equality over a dense open, not support containment: over a field, the reduced point inside dual numbers is a counterexample to the former signature. Integral source and target are included in the modification predicate. Common domination of alterations now has an integral Noetherian base and integral sources.
8. **Projection and Chow.** Iterating projection with a codimension-one Z needs Z generically geometrically reduced. Chow's lemma uses affine opens containing all generic points, then the schematically dense common open and gluing by separatedness (Stacks 0200). Simply intersecting an arbitrary finite affine cover is insufficient for reducible X. The generic-smoothness proof of Bertini in arbitrary characteristic is replaced by the source's first-jet separation and bad-incidence dimension count.
9. **Trait definitions and pairs.** The finite base-change prototype now uses complete DVRs and an injective local finite ring map. A Tau Ceti finite-DVR-extension package is compared up to canonical isomorphism, not claimed literally unique. The proper-variety-to-model specialization now says proper explicitly; properness remains an additional Model predicate in the library. De Jong 2.16(c), the effective Cartier condition on every special-fibre component, is added to Lean using local non-zero-divisor generators. Without it, xy=π² satisfies the previous displayed conditions and contradicts the negative test. Horizontal strata in the pair predicate explicitly retain flatness. The semistable-alteration signature now includes Z containing the special fibre, the map over S, an injective local finite trait extension and the boundary support; projectivity and geometric irreducibility remain stated in the packet and honestly absent from the weaker typed consequence.
10. **Moduli and normalization.** H_g → M̄_g is a smooth surjective PGL torsor, not an étale atlas; Deligne 3.2 gives transverse slices for an étale refinement. The dimension 3g−3+n belongs to a hull/miniversal deformation, not every versal base. A Chow replacement of a proper level algebraic space is not automatically finite étale over the whole smooth locus. The stable-extension sketch must retain and extend its 2-isomorphism through the finite proper Isom scheme; de Jong 4.17 alone controls a smaller dense open. Finally, `Scheme.Hom.normalization (𝟙 Y)` equals Y. Absolute normalization of an integral curve must use Spec K(Y) → Y; the false identity-normalization resolution theorem is removed and its adapter recorded as a gap.

The nine gaps name the exact missing inputs and affected nodes. In particular Nitsure's uniform regularity and flattening stratification are **key theorems** needed at target level, not requests to split routine proof steps into lemma nodes. The existing regular-local-normality and pointed-source gaps remain. No new general resolution theory or full cotangent-complex development is claimed.

## Published-source issues

- **E1 rejected.** De Jong 2.24 p. 62 refers to a genuine projectivity result: Deligne 3.7 p. 141 invokes Mumford. An unimported proof of that result is a plan dependency, not an error in the published citation. The packet's earlier allegation is preserved with the rejecting review verdict.
- **E2 confirmed with narrow scope.** The sketch at de Jong 2.4 and its use at 4.28 omit the general separation argument. Section 7.2 pp. 87–88 of the same paper supplies it. This is not a false alteration theorem or an unresolved external erratum.
- **E3 added and confirmed.** The unrestricted converse in de Jong 6.4 p. 83 is false for a nonproper S-variety. Set R=Q[[π]], X=Spec R[x,y], F=(πx−1)²+π²y³, H=V(F), Z=X_s ∪ H. F=1 mod π, so H misses X_s and all special-fibre local forms hold. In O_H one has 1=π(2x−πx²−πy³), so H lies entirely over the generic point. There F/π²=(x−π⁻¹)²+y³ defines a reduced cusp at (π⁻¹,0). Hence H is not regular and Z is not SNC. The forward local form remains valid; a converse needs generic-pair control or properness with an openness argument. Theorem 6.5 has projective output and is not contradicted by this example. The Numdam and journal records, author publications page and alterations-course page were checked for an existing correction; none was linked at the locations checked. E3 is scoped to the version of record whose hash is in `sourceVersions`.

## Baseline, suppliers and ownership

The 79 named declarations all exist at the pinned commits. I opened their definitions/theorem statements, including the local variable hypotheses, rather than accepting a search hit. The shared Mathlib source tree is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`; the eight referenced Tau Ceti modules were compared byte for byte with raw GitHub files at `f790474821cf4256814db967cb154e7af3d0c369`. The supplied scope of `Proj.toSpecZero` is narrowed to the structure map, and the relative-normalization entry is corrected; neither proves the extra result formerly inferred from it. No name is replaced by a guessed declaration. The generic-freeness proof now names the source argument directly; unlisted spreading names are not treated as checked prerequisites. The table below records the checked locations; limitations of their use are in the node matrix and gaps.

The reviewed `data/library-coverage.json` agrees that ring lifting, naive cotangent complexes, adic completion, rational/birational maps and the Tau Ceti model objects are baseline. They are not replanned. Missing scheme formal smoothness, formal schemes, Schlessinger and algebraization are legitimate targets. Existing blowups and curve reduction are **roadmap imports**, not existing proved theorems.

Supplier checks: StableReduction 0 supplies models and finite DVR extensions; 1 supplies nodal/differential inputs; 2 supplies the general coherent/proper and projective/Cartier inputs; 3 supplies the family predicates; 4 supplies blowups and their charts; 7–9 supply reduction of curves. JacobianChallenge C has proper-flat coherent base-change scope, not arbitrary formal geometry. JacobianChallenge E supplies multiplication isogenies; the exact ℓ^{2g} rank and relative level normalization still need their bridge. SF.0's excellence package records finiteness of normalization as remaining. SF.1's broad stack scope does not by itself instantiate the finite-extension DVR criterion; SF.2's Ext groups do not by themselves supply the sheaf cotangent object. The requests are mathematically specific, but assembly cannot treat these stage scopes as already closed.

The handed red-team findings are handled in the permitted files:

- **RT-AREA-algebraicgeometry/16:** SF.4 owns the schematic de Jong 4.1, 5.8 and 6.5 statements; generic étaleness is restricted to the perfect-field theorem. L5/RD.5 are consumers. No analytic H1/H5 inputs enter the alteration proof.
- **RT-AREA-algebraicgeometry/17:** pointed stable moduli, Isom, algebraicity/properness/smoothness and a cover are owned here at tier 2. The lower-tier rule prevents using R09.4 or StableReductionPartII as suppliers; they must import these targets after revision closes their gaps.
- **RT-AREA-etale/21:** accepted RS-25 retains source-scoped alterations at SF.4. The packet's downward ownership move is consistent with the current tiers; a new L5 prefix must not duplicate it. Analytic descent and local comparisons stay with L5/RD.5. This review cannot edit the consumer graphs.

Other audit overlaps follow the same rule: AdicSpacesPartII F0/R2 import formal functions/formal schemes; DeformationAndDerivedPatchingAlgebra R03.2 imports Schlessinger; R09.2 imports Hilbert/Quot and Grassmannians. Néron models, abelian reduction and characteristic-zero higher-dimensional resolution are not SF.4 inputs. These ownership decisions already appear in the packet and reader; this review checks their directions without modifying other roadmaps.

## Reader synchronization required

The issue authorizes edits only to the packet, suggested file and report, plus this review's handoff. The existing reader was inspected but is **not edited**. A revision job must authorize and synchronize it. In particular its sections “First-order thickenings”, “Deformation functors”, “Hulls”, “Obstruction theories”, “Deformations of smooth schemes”, “Versal deformation of a node”, SF.4b's formal-category discussion, “Strict transforms”, “Chow's lemma”, “Resolution of curves”, “Bertini”, “M̄ is a proper Deligne–Mumford stack”, “Smoothness”, “Level structures”, “Extending stable pointed curves”, and “Strict semistable pairs” still contain the old claims corrected above. Its opening statement that obstruction theories already bound hull relations and its source-issue discussion also need revision. Use the packet statements and this report, not the old reader, as the correction list.

The six planet names describe central definitions or named theorems and need no naming change. All 21 definition/construction nodes have at least three mathematical tests. The two new negative examples catch uniform nilpotence and the missing generic-pair condition. The suggested file labels weak consequences and supplier-dependent comment targets honestly; elaboration with `sorry` does not prove their mathematics.

## Validation and next action

`python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.4.json` reports **0 errors and 0 warnings**. The embedded source-issue validator and `versions_checked` report **0 errors** (the standalone errata command expects an `errata-v1` file, so it is not the packet validator). `lean-check research/blueprint/suggested/SchemeAndStackFoundations--SF.4.lean` elaborates at the pins with **only declaration-uses-sorry warnings**. No library build, update, cache fetch or language server was started. `git diff --check` passes; only this job's deliverables and handoff are changed.

The orchestrator should issue a revision that includes the reader document, closes the nine named gaps with exact key targets/supplier contracts, and submits the packet to a fresh independent review. Consumer ownership edges must follow the downward moves above. A pointed-source continuation should read Knudsen II directly before claiming the pointed results are verified.

## Per-node audit

| Node (SF.4/) | Verdict | Evidence and remaining limit |
| --- | --- | --- |
| `first-order-thickening` | corrected | Stacks 04EX: nil ideals versus uniform nilpotence distinguished; infinite-variable counterexample added. |
| `formally-smooth-morphism` | corrected | Stacks 02H0/02HG: affine locality uses vanishing of the quasi-coherent Hom obstruction; avoid circular use of the later torsor target. |
| `infinitesimal-lifting-criterion` | verified | Stacks 02H6/02HM: finite presentation hypotheses retained; ring and scheme formal criteria kept distinct. |
| `smooth-lifting-torsor` | verified | Stacks 0D0F/0D0E/06B5: sheaf of lifts and affine H¹ vanishing; sheaf differentials imported from StableReduction 1. |
| `artinian-coefficient-category` | corrected | Stacks 06GC/06GE/06GW: classical coefficient setting stated; positive prime-power exponent clarified. |
| `deformation-functor` | corrected | Stacks 06JA: groupoid RS gives H1/H2 of isomorphism classes, not automatically H4; augmentation used for tangent comparison. |
| `hull` | corrected | Stacks 06T4/06T5: ring-minimal versal objects distinguished from tangent-bijective hulls; power-series assertion restricted. |
| `schlessinger-theorem` | corrected | Stacks 06IX/06IY/06JM: classical complete Noetherian local residue-field hypotheses added to Lean criteria. |
| `obstruction-theory` | unverifiable | Natural tensor-valued definition retained; uncited relation bound deferred, weak Lean detector renamed and false bound removed. |
| `algebra-deformation-classes` | unverifiable | Stacks 0GPT/08S7/08S5/08S6 check the classification; global sheaf cotangent comparison remains a key prerequisite gap. |
| `deformations-of-smooth-schemes` | corrected | Stacks 0DY8/06JA/0C6R: groupoid distinction and framed liftings fixed; curve H² supplier recorded as a gap. |
| `node-versal-deformation` | unverifiable | DM69 pp. 79–83: algebraically closed/split continuous setting restored; ordinary formal-power-series cotangent computation replaced by a comparison gap. |
| `formal-spectrum` | unverifiable | Stacks 0AHY/07E8/0AIF: genuine Spf target supported; strict-level Lean systems explicitly auxiliary, continuous reindexing unresolved. |
| `formal-scheme` | unverifiable | Stacks 0AIF/0AKM/0AKY: systems do not yet prove the formal-scheme category; finite-generation/TLLR comparison gap. |
| `formal-completion` | unverifiable | Stacks 0AIZ/0AMC/0GBA: completion supported; set-theoretic functoriality requires local power reindexing. |
| `coherent-formal-modules` | unverifiable | Stacks 087W/0880/0881/0EKN: exactness is in the formal category, not levelwise; genuine formal-module comparison still needed. |
| `theorem-on-formal-functions` | verified | Stacks 02OC: proper coherent Noetherian hypotheses match; general coherent pushforwards supplied by StableReduction 2. |
| `stein-factorization` | verified | Stacks 03H0/0AY8: relative normalization is appropriate here; finite Spec of f_*O and connected geometric fibres. |
| `grothendieck-existence` | corrected | Stacks 088C: existence and full faithfulness refer to compatible formal modules; uniqueness relative to the chosen comparison clarified. |
| `algebraization-of-subschemes-and-morphisms` | corrected | Stacks 0899/0A42: removed typed map algebraization without compatibility of reduction maps; exact target recorded in a comment. |
| `grothendieck-algebraization` | corrected | Stacks 089A: removed typed unconditional algebraization; ample compatible invertible sheaf is essential. |
| `effective-formal-deformations-of-curves` | unverifiable | Curve effectivity uses lifting an ample line bundle, curve H² vanishing and projectivity; supplier bridge not yet closed. |
| `modification` | corrected | de Jong 2.17 / Stacks 0AAZ: integral source/target added to the typed predicate used downstream. |
| `strict-transform` | corrected | de Jong 2.18 / Stacks 080D: base and exceptional torsion distinguished by the vertical-line test; agreement requires flatness over the full centre complement. Dense-flat-open closure and schematic uniqueness hypotheses added. |
| `generic-flatness` | verified | Stacks 052A: finite-type quasi-compact map to integral base admits a dense flat open; ring generic-freeness argument inspected. |
| `flattening-by-blowup` | verified | Stacks 0815/081R: coherent and finite-type flattening hypotheses agree, admissible blowup supplied by StableReduction 4. |
| `modification-domination` | verified | Stacks 081T/081M: modification dominated by an admissible blowup; Bhatt18 §6 uses this domination, not a new perfectoid definition. |
| `chow-lemma` | corrected | Stacks 0200: affine cover must contain every generic point and U must be schematically dense; reducible case corrected. |
| `alteration` | corrected | de Jong 2.20 / Stacks 0AB0: add integral Noetherian common base and integral sources to common-domination prototype. |
| `regular-scheme` | verified | Regularity definitions exist at ring level, scheme regularity does not; regular-local normality remains an honest existing gap. |
| `strict-normal-crossings` | verified | de Jong 2.4: regular strata in expected codimension give SNC; characteristic restrictions in nodal examples respected. |
| `nc-to-snc` | verified | de Jong 7.2 pp. 87–88: excellent regular finite pure-dimensional setting retained; not an arbitrary Noetherian resolution claim. |
| `split-prestable-curve` | corrected | de Jong 2.22: split is stronger than nodal; singular-locus decomposition only claimed étale locally, quadratic example requires char ≠ 2. |
| `node-local-structure` | verified | de Jong 2.23: finite étale residue-field extension and split versus nonsplit quadratic forms retained. |
| `nodal-family-resolution` | verified | de Jong 3.2/3.6: regular base, NC discriminant, split nodal hypothesis and iterative regular blowup charts checked. |
| `generic-projection` | corrected | de Jong 2.11: simultaneous codimension-one projection also needs that subscheme generically geometrically reduced. |
| `curve-fibration` | verified | de Jong 4.11–4.12: projective integral normal setting, projection and blowup yield nonempty pure curve fibres. |
| `three-point-divisor` | verified | de Jong 4.13: sufficiently ample hyperplane choice plus Noetherian induction meets every component in three smooth points. |
| `stable-model-domination` | verified | de Jong 4.18–4.21: polarization of stable model, graph and flattening; normality via Serre target recorded. |
| `curve-family-alteration` | verified | de Jong 5.8 and proof 5.1–5.17: projective integral excellent setting, smooth dense locus, alteration and split marked output. |
| `de-jong-alteration-theorem` | verified | de Jong 4.1/4.3–4.28: regular projective compactification and SNC boundary, separable generic extension only over perfect field; typed proper consequence labelled. |
| `trait-and-varieties` | corrected | de Jong 2.12/2.15/6.8: finite trait extensions must be injective local DVR maps; package comparison is up to canonical isomorphism. |
| `strictly-semistable` | corrected | de Jong 2.16: Cartier component condition added to Lean; xy=π² otherwise contradicts its own negative test. |
| `strict-semistable-pair` | corrected | de Jong 6.3–6.4: forward local form retained, false unrestricted converse flagged by generic-only cusp (E3). |
| `faltings-formal-smoothness` | verified | de Jong 2.13: excellent DVR input, normalization and reduced base change; complete trait specialization is valid. |
| `semistable-alteration-theorem` | corrected | de Jong 6.5/6.7–6.16: typed output now includes Z, finite injective local trait map, S-commutativity and boundary support. |
| `grassmannian-scheme` | verified | Nitsure §1 pp. 6–9: quotient Grassmannian, affine charts and Plücker construction; weak typed tests labelled as consequences. |
| `hilbert-scheme` | unverifiable | Nitsure Theorems 2.3, 3.3–3.7, 4.2–4.3, 5.1–5.3: target correct, missing key regularity/flattening-stratification nodes recorded. |
| `stable-curve-stack` | unverifiable | DM69 1.1 verifies unpointed objects; pointed Knudsen input remains unread; stable-family definitions imported without duplication. |
| `isom-stable-curves` | unverifiable | DM69 1.11 verifies unpointed finite unramified Isom; pointed source and arbitrary-base approximation bridge unresolved. |
| `stable-curve-stack-algebraic` | corrected | DM69 5.1–5.2 / Del85 3.2 p. 138: H_g is smooth surjective, not étale; proper-stack and pointed input gaps explicit. |
| `stable-curve-stack-smooth` | unverifiable | DM69 1.5–1.9/5.2: use hull/miniversal base, not arbitrary versal base; pointed dimension and continuous Ext bridges unresolved. |
| `level-structure-cover` | unverifiable | Del85 3.5.1 p. 139 locator corrected; reject alleged projectivity erratum; weaker Chow cover does not preserve whole smooth locus automatically. |
| `stable-extension-after-alteration` | unverifiable | de Jong 4.17 / Del85 1.6: closure must retain an Isom identification; extension over all of the original U not proved by the present sketch. |
| `resolution-of-curves` | unverifiable | Stacks 0C45/0BI4/0B8Y: absolute normalization target correct; identity-relative normalization is wrong and its typed theorem removed. |
| `bertini-smoothness` | corrected | Stacks 0FD6: tangent-separating incidence dimension count replaces invalid generic-smoothness argument in positive characteristic. |
| `serre-normality-criterion` | verified | Stacks 031S/05GG: R1+S2 criterion and dimension-one reduced Cohen–Macaulay application inspected; depth API not currently in Mathlib. |

## Checked baseline declarations

| Declaration | Pinned file and line | Result |
| --- | --- | --- |
| `mathlib:AdicCompletion` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:171` | exists; statement inspected |
| `mathlib:AdicCompletion.flat_of_isNoetherian` | `Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean:379` | exists; statement inspected |
| `mathlib:AdicCompletion.map_exact` | `Mathlib/RingTheory/AdicCompletion/Exactness.lean:184` | exists; statement inspected |
| `mathlib:Algebra.Extension.H1Cotangent` | `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:339` | exists; statement inspected |
| `mathlib:Algebra.Extension.cotangentComplex` | `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:61` | exists; statement inspected |
| `mathlib:Algebra.FormallyEtale.iff_formallyUnramified_and_formallySmooth` | `Mathlib/RingTheory/Etale/Basic.lean:66` | exists; statement inspected |
| `mathlib:Algebra.FormallyEtale.of_isSeparable` | `Mathlib/RingTheory/Etale/Field.lean:98` | exists; statement inspected |
| `mathlib:Algebra.FormallySmooth` | `Mathlib/RingTheory/Smooth/Basic.lean:70` | exists; statement inspected |
| `mathlib:Algebra.FormallySmooth.exists_lift` | `Mathlib/RingTheory/Smooth/Basic.lean:126` | exists; statement inspected |
| `mathlib:Algebra.FormallySmooth.iff_split_surjection` | `Mathlib/RingTheory/Smooth/Basic.lean:331` | exists; statement inspected |
| `mathlib:Algebra.IsSeparable` | `Mathlib/FieldTheory/Separable.lean:549` | exists; statement inspected |
| `mathlib:Algebra.Smooth` | `Mathlib/RingTheory/Smooth/Basic.lean:540` | exists; statement inspected |
| `mathlib:Algebra.instFormallySmoothMvPolynomial` | `Mathlib/RingTheory/Smooth/Basic.lean:112` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.AffineSpace` | `Mathlib/AlgebraicGeometry/AffineSpace.lean:44` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Etale` | `Mathlib/AlgebraicGeometry/Morphisms/Etale.lean:41` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Flat` | `Mathlib/AlgebraicGeometry/Morphisms/Flat.lean:42` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.FormallyUnramified` | `Mathlib/AlgebraicGeometry/Morphisms/FormallyUnramified.lean:54` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.GeometricallyIntegral` | `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.GeometricallyReduced` | `Mathlib/AlgebraicGeometry/Geometrically/Reduced.lean:44` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsClosedImmersion` | `Mathlib/AlgebraicGeometry/Morphisms/ClosedImmersion.lean:45` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsDominant` | `Mathlib/AlgebraicGeometry/Morphisms/UnderlyingMap.lean:217` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsFinite` | `Mathlib/AlgebraicGeometry/Morphisms/Finite.lean:40` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsFinite.iff_isProper_and_locallyQuasiFinite` | `Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:382` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsIntegral` | `Mathlib/AlgebraicGeometry/Properties.lean:240` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsLocallyNoetherian` | `Mathlib/AlgebraicGeometry/Noetherian.lean:56` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsNoetherian` | `Mathlib/AlgebraicGeometry/Noetherian.lean:279` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsOpenImmersion` | `Mathlib/AlgebraicGeometry/OpenImmersion.lean:36` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsProper` | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:42` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsProper.eq_valuativeCriterion` | `Mathlib/AlgebraicGeometry/ValuativeCriterion.lean:330` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.IsSeparated` | `Mathlib/AlgebraicGeometry/Morphisms/Separated.lean:44` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.LocallyOfFinitePresentation` | `Mathlib/AlgebraicGeometry/Morphisms/FinitePresentation.lean:45` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.LocallyOfFiniteType` | `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:43` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Proj.toSpecZero` | `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Basic.lean:151` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.QuasiCompact` | `Mathlib/AlgebraicGeometry/Morphisms/QuasiCompact.lean:43` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Scheme.Birational` | `Mathlib/AlgebraicGeometry/Birational/Birational.lean:181` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Scheme.Hom.image` | `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean:661` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Scheme.Hom.ker` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean:692` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Scheme.Hom.normalization` | `Mathlib/AlgebraicGeometry/Normalization.lean:123` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Scheme.Hom.smoothLocus` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:291` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Scheme.IdealSheafData` | `Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean:65` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Scheme.Modules` | `Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:36` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Scheme.functionField` | `Mathlib/AlgebraicGeometry/FunctionField.lean:37` | exists; statement inspected |
| `mathlib:AlgebraicGeometry.Smooth` | `Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean:62` | exists; statement inspected |
| `mathlib:CategoryTheory.Functor.IsFibered` | `Mathlib/CategoryTheory/FiberedCategory/Fibered.lean:65` | exists; statement inspected |
| `mathlib:CategoryTheory.Pseudofunctor.IsStack` | `Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49` | exists; statement inspected |
| `mathlib:DualNumber` | `Mathlib/Algebra/DualNumber.lean:46` | exists; statement inspected |
| `mathlib:Ideal.adicTopology` | `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean:91` | exists; statement inspected |
| `mathlib:Ideal.exists_pow_inf_eq_pow_smul` | `Mathlib/RingTheory/Filtration.lean:388` | exists; statement inspected |
| `mathlib:IsAdic` | `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean:158` | exists; statement inspected |
| `mathlib:IsAdic.isAdicComplete_iff` | `Mathlib/RingTheory/AdicCompletion/Topology.lean:76` | exists; statement inspected |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56` | exists; statement inspected |
| `mathlib:IsArtinianRing` | `Mathlib/RingTheory/Artinian/Defs.lean:66` | exists; statement inspected |
| `mathlib:IsDedekindDomain` | `Mathlib/RingTheory/DedekindDomain/Basic.lean:144` | exists; statement inspected |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:58` | exists; statement inspected |
| `mathlib:IsDiscreteValuationRing.TFAE` | `Mathlib/RingTheory/DiscreteValuationRing/TFAE.lean:210` | exists; statement inspected |
| `mathlib:IsIntegralClosure.finite` | `Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean:175` | exists; statement inspected |
| `mathlib:IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean:30` | exists; statement inspected |
| `mathlib:IsLocalRing.ResidueField` | `Mathlib/RingTheory/LocalRing/ResidueField/Defs.lean:30` | exists; statement inspected |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51` | exists; statement inspected |
| `mathlib:IsRegularRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:92` | exists; statement inspected |
| `mathlib:KaehlerDifferential` | `Mathlib/RingTheory/Kaehler/Basic.lean:153` | exists; statement inspected |
| `mathlib:KaehlerDifferential.linearMapEquivDerivation` | `Mathlib/RingTheory/Kaehler/Basic.lean:327` | exists; statement inspected |
| `mathlib:Matrix.ProjGenLinGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:41` | exists; statement inspected |
| `mathlib:Module.Grassmannian` | `Mathlib/RingTheory/Grassmannian.lean:68` | exists; statement inspected |
| `mathlib:Module.Grassmannian.functor` | `Mathlib/RingTheory/Grassmannian.lean:188` | exists; statement inspected |
| `mathlib:PerfectField` | `Mathlib/FieldTheory/Perfect.lean:289` | exists; statement inspected |
| `mathlib:RingHom.FormallySmooth` | `Mathlib/RingTheory/RingHom/Smooth.lean:31` | exists; statement inspected |
| `mathlib:SheafOfModules.IsFinitePresentation` | `Mathlib/Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:269` | exists; statement inspected |
| `mathlib:TopCommRingCat` | `Mathlib/Topology/Category/TopCommRingCat.lean:28` | exists; statement inspected |
| `mathlib:derivationToSquareZeroEquivLift` | `Mathlib/RingTheory/Derivation/ToSquareZero.lean:116` | exists; statement inspected |
| `mathlib:isArtinianRing_iff_isNilpotent_maximalIdeal` | `Mathlib/RingTheory/HopkinsLevitzki.lean:184` | exists; statement inspected |
| `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf` | `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:78` | exists; statement inspected |
| `tauceti:TauCeti.AlgebraicGeometry.Scheme.CartierDivisor` | `TauCeti/AlgebraicGeometry/CartierDivisor/Basic.lean:126` | exists; statement inspected |
| `tauceti:TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` | `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61` | exists; statement inspected |
| `tauceti:TauCeti.FiniteDVRExtension` | `TauCeti/AlgebraicGeometry/Curves/StableReduction/DVRExtension/Basic.lean:85` | exists; statement inspected |
| `tauceti:TauCeti.Model` | `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44` | exists; statement inspected |
| `tauceti:TauCeti.derivationToDualNumberEquivLift` | `TauCeti/RingTheory/Derivation/DualNumber.lean:71` | exists; statement inspected |
| `tauceti:TauCeti.genericFiber` | `TauCeti/AlgebraicGeometry/Fibers.lean:42` | exists; statement inspected |
| `tauceti:TauCeti.specialFiber` | `TauCeti/AlgebraicGeometry/Fibers.lean:54` | exists; statement inspected |
