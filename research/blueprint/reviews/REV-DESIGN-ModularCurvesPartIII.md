# Independent review: Modular curves, Part III

Job: `REV-DESIGN-ModularCurvesPartIII`, issue [#3572](https://github.com/CBirkbeck/tauceti-explorer/issues/3572).
Reviewer: Codex, session `codex-gJPyB0`, 2026-10-19.
The original design was written by Codex session `codex-8uXpDn`; this is a different session.

## Verdict and scope

**Accepted with corrections as an import index and merger proposal.** The sole
paper route already names GeometricFreyMazur, whose design and independent review
are accepted. A second mathematical owner would duplicate that plan. The alias
correctly imports its eleven layers without introducing a reverse dependency.

This verdict covers the four alias deliverables and their import contracts. It
neither replaces the canonical owner's review nor applies the proposed merger.
The packet's `complete` status describes a finished import pass. Its eleven
`source_decomposed` records describe import accounting; no mathematical layer is
closed. The canonical coverage, open requests and unchecked implementation
statuses are preserved exactly.

| Inventory checked | Count | New mathematical ownership |
| --- | ---: | ---: |
| Paper-route entries | 64, including the explicit exclusion of item 119 | 0 |
| Canonical node imports | 67: 49 theorems, 9 constructions, 4 definitions, 3 comparisons, 2 applications | 0 |
| Definition/construction contracts | 13 | 0 |
| Named API items / discriminating tests | 80 / 40 | 0 |
| Planets | 53, at most six per owner layer | 0 |
| Pinned baseline citations | 11 | 0 |
| Alias layers | 11 | 0 closed layers |
| Inherited gaps / supplier requests | 0 / 19 | 0 additional obligations |
| Existing source-finding references | 21 | 0 new findings |
| Anonymous native-carrier Lean examples | 18 | No geometric implementation claim |

Every imported node has an individual `review.checked` entry. The corrected
entry refers to the alias's account of `GF.1/cusp-coordinates`; the owner node
itself already had the missing hypothesis and was not edited.

## Corrections made

1. **Restore the lower radius bound in routed item 36.** The packet's short
   statement and reader retained only the upper bound in their acceptance
   condition. Bakker–Tsimerman Lemma 9, p.721, requires both
   `log p+C<R` and `R+log m<2 log p−C`. The preceding q-disc containment cannot
   be invoked using the upper bound alone. The packet, reader and roadmap
   layer description now display both bounds, sufficiently large p, and
   positive integer m prime to p, matching the canonical owner.
2. **Narrow the PSL baseline description.**
   `Matrix.ProjectiveSpecialLinearGroup` defines SL modulo its centre; that
   declaration alone is not a field comparison theorem with PGL. Its
   `provides` description now states the carrier actually used by the
   proper-subgroup-index argument. The citation is valid and remains in
   place. No baseline citation was removed, replaced or added.
3. **Test the descent sign in finite characteristic.** Replace the rational
   nonzero-sign example by one for every nonzero element of `ZMod 7`, and add
   `-(1 : ZMod 2)=1`. These distinguish the intended torsion sign step and
   the excluded prime. The field import and explicit primality instance
   support the first proof. There are eighteen anonymous examples, all
   proved, with no new definitions or auxiliary theory.
4. **Synchronize the review record.** Add the accepted review object and
   sixty-seven individual import verdicts; update the reader's validation
   link and the current-library inspection inventory to include the parent
   descent and twisted-curve sections also read in this review. Remove two
   duplicated `BT16` labels in source lines. Write this report and the
   handoff note.

No mathematical node, supplier request, API item, named definition test, planet
or ownership assignment was added or reassigned. No canonical-owner file was
changed.

## Sources and mathematical checks

Read the published thirty-six-page
[Bakker–Tsimerman article](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p02-p.pdf),
the complete five-page
[author erratum](https://benjamin-bakker.github.io/P.torsion.erratum.pdf), and
[Abramovich's five-page preprint](https://arxiv.org/pdf/alg-geom/9609012).
Their downloaded SHA-256 values agree with the three source records in both
alias JSON files. All sixty-four route statements, locators, matches, proof
routes and acceptance conditions were compared with the imported owner
statements and the relevant source locations. The following are the main
mathematical boundaries of those checks, rather than claims of completed
formal proofs.

| Imported layer | Boundary checked |
| --- | --- |
| GF.0 | BT16 §§2.1–2.5, pp.714–717: coarse scalar frames retain inversion; there are two determinant classes; common inertia, rather than equal j alone, defines CM. Orders 2 and 3 depend on j, either CM sign is possible, and SBC has order p. Cyclic Hecke degree is ψ(m), distinguished by ψ(4)=6 versus σ₁(4)=7. |
| GF.1 | BT16 opening of §3 and §§3.1–3.2, pp.717–721: the compact triangle quotient differs from the cusped quotient. The accepted surviving witness replaces the killed word. Radius is half the surviving systolic length. Repeated deep cusp visits and both Lemma 9 radius bounds remain required. |
| GF.2 | BT16 Lemmas 10–11 and Proposition 12, pp.722–725: integral SL₂ lifts apply within a component; both double-coset factors remain. The corrected uniqueness proof takes δ small enough for the O(p^(8δ)) congruence entry to be below p. The cusp-overlap count remains O(p^(24δ)). |
| GF.3 | BT16 Lemma 15, Remark 16 and Proposition 17, pp.726–728; erratum Proposition 2.1, p.2: ordinary repulsion is Heegner-only. Reconstruction retains determinant sign, order-three norms are Eisenstein norms, and negative determinants produce conjugate real analytic loci. The three-bicusp statement includes the two metric consequences its consumer needs. |
| GF.4 | BT16 §4.4 and Proposition 18, pp.728–731: a big diagonal imposes two equalities and its tube uses threshold 2R. The logarithmic count excludes nonreduced/scalar centralizers. The corrected rotation count retains the identity term, sinh R and the separate d=0 case. |
| GF.5 | BT16 Propositions 25–28 and their proofs, pp.736–740; erratum Propositions 4.1–4.2, pp.3–4: CM signs are estimated separately, SBC needs a saving after multiplication by p, and signed overlap costs must be counted. Big-diagonal decay requires nonconstant non-Hecke projected cycles. Weighted degree, zero contribution from a constant cusp coordinate, and the small-to-large sinh volume ratio are retained. |
| GF.6 | BT16 Theorem 29 proof, p.741: image normalization uses the requested gonality-domination lemma. A finite-flat pencil retains fibre multiplicities. Surface symmetric powers need a scheme quotient and relative cycle morphism beyond native Sym. The chosen normalized component has weighted non-Hecke projections. |
| GF.7 | BT16 Theorem 29 proof, pp.741–742: effective curve inertia is cyclic, hence has only one p factor. The exact Hurwitz equality retains −2 deg α; the independent largest projection gives Deg(C)/(2n). |
| GF.8 | Abramovich Theorem 0.1, p.1, and §§1.4–1.7, pp.2–3: the 21/100 gap, πD/3 area and 8π Li–Yau factor yield 7D/800. Transvection generation gives proper subgroup index at least p. Actual SL₂ monodromy and its separate no-self-twist result are not inserted into final isogeny descent. |
| GF.9 | BT16 Theorems 1–2 and moduli description, pp.710,715: the actual torsion map survives passage to the coarse classifying map. A Hecke lift gives f[p]=λΨ; the rank-one Hom sign and odd p descend f. Extension is over the original U. Only a finitely generated model field is embedded in C; geometric finite-étale invariance separately spreads monodromy. |
| GF.10 | BT16 Corollaries 30–32, p.742, and gonality bound, p.740: strict genus thresholds are enlarged, rational/elliptic claims concern normalization, and successive contractions give existence of a minimal model supported on known curves. General type for p>11 and uniqueness are excluded as on the owner. |

The owner's twenty-one accepted findings E1–E10 and E12–E22 are referenced by
exact identifier. Their confirming verdicts and the reference inventory were
checked. The alias has no `sourceIssues` entries of its own; it does not copy
source passages or issue a second errata verdict. The correction to item 36
repairs the alias's omitted hypothesis, not a new error in the paper.

The Néron extension remains an inherited supplier contract. The abelian-scheme
Néron-model and extension node statements were read and have the needed Dedekind
base and smooth-source hypotheses. This review does not claim a fresh reading
of the owner's BLR book source or its older arXiv version.

## Baseline, suppliers and structure

All eleven baseline entries were read, with their ambient variables, at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

| Declaration(s) | Fit checked |
| --- | --- |
| `Matrix.ProjGenLinGroup`, `Matrix.ProjGenLinGroup.mk_eq_mk_iff` | Finite decidable index and commutative ring; equality in the quotient is exactly multiplication by an invertible scalar. |
| `Matrix.ProjectiveSpecialLinearGroup` | Native SL/centre carrier with the same finite-index/ring hypotheses; narrowed description as above. |
| `Matrix.norm_eq_sup_sup_nnnorm`, `Matrix.norm_entry_le_entrywise_sup_norm` | Finite matrix indices and seminormed additive coefficients, using the entrywise norm instance. |
| `Subgroup.index` | Nat.card of the coset type; the finite-group applications avoid the infinite-index zero convention. |
| `Sym`, `Sym.map`, `Sym.map_map` | Multisets of fixed cardinality, their functorial map and composition law; repeated points are retained and no scheme structure is supplied. |
| `Matrix.SL2.commutator_eq_top` | Field, nonzero a and a²≠1; a=2 works for p>3. |
| `Matrix.SpecialLinearGroup.closure_range_toSpecialLinearGroup_eq_top_of_field` | Finite decidable matrix index over a field; transvection structures generate SL. |

The shared build's Mathlib HEAD equals the pin. The Tau Ceti transvection module
was compared byte-for-byte with its pinned git blob, with matching SHA-256
`075a570b0a169687bad9ef2f51b0f1cd3b9d1989e713a7749b4d35f05e99c2af`.

Read the named external supplier statements behind the imported nodes,
including the relative elliptic, torsion, Hom, level, cyclic boundary, cycle,
comparison, fundamental-group and analytic volume interfaces. All sixty-seven
named external references resolve. Six further broad atlas-stage references
remain qualified by the owner's precise requests; they are not treated as
already supplied theorems. The nineteen inherited requests, coverage records
and gaps were compared structurally with the owner and are unchanged. In
particular, the additional point-ball estimate, norm-pushforward gonality lemma,
relative cycle map, surface resolution/contraction interfaces and their exact
hypotheses remain visible. The analytic supplier's `needs_changes` review
condition is also preserved.

Read the relevant nine entries of `data/library-coverage.json`. Native
projective groups, norms, symmetric point multisets and transvections are reused.
The audit's partial algebraic, quotient and analytic building blocks are not
mistaken for completed level curves or geometric volume estimates.

Current read-only inspection used TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read FuchsianOrbifolds and
ConformalMapping in full, and the parent ModularCurves §§0D,0E,2C,5B,5C and
corresponding suggested interfaces. Whole-word searches across both trees found
no additional owner for the route-specific rigidity, gonality or systole
claims. This is a bounded overlap check; current main is not substituted for
the pinned baseline.

All thirteen imported definition/construction contracts retain the exact
owner API and test names. Their forty tests distinguish wrong component
identifications, missing common stabilizers, full versus cyclic subgroups,
conjugate divisors, diagonal codimension, constant-cusp area, repeated cycles,
ramified pencil fibres, unnormalized pullbacks and incorrect exceptional
self-intersections. Every contract has at least three tests. The reader carries
their full statements; the alias owns none of these definitions. Its compact
suggested file consequently tests only existing carriers and introduces no
placeholder geometry. The fifty-three planet names and eleven stage mappings
agree exactly with the owner; no duplicate planet is assigned here.

## Validation and maintainer actions

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularCurvesPartIII.json`:
  **0 errors, 0 warnings** after the review object was added.
- A separate inventory check verified equality of the 64-item route, 67-node
  import set, eleven layer mappings, 13 API/test contracts, 53 planets,
  21 confirmed finding references and inherited coverage/gap/request records.
  It also checked the reader's complete item/API/test inventory, the explicit
  item-119 exclusion and the eighteen native examples.
- `lean-check research/blueprint/suggested/ModularCurvesPartIII.lean`:
  **exit 0, no warnings**, after correcting the finite-field instance and
  local-instance style. Memory was checked before each run. This compiles only
  the alias's prototype and certifies no canonical geometric target.
- `python3 research/blueprint/intake.py check-files` on the six changed
  deliverables/handoff: **0 problems**. `git diff --check`: **clean**.

No mathematical question blocks acceptance of this import audit. The maintainer
should decide when to apply the merger after checking incoming references and
queue routes, keeping every GeometricFreyMazur identifier and obligation. The
canonical reader's synchronization requirement already recorded by the design
remains a task before packaging. The canonical analytic supplier condition and
surface extensions must remain visible through that work. This submission
performs none of those maintainer or other-roadmap changes.
