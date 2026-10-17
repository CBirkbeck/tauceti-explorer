# Arithmetic geometry red-team fixes, round 2

Job: `FIX-RT-AREA-arithmeticgeometry-2~2` (#8923). Fixer: Codex, session
`codex-WBXXH4`, 17 October 2026. This report follows the corrected findings in
[the independent verification](RT-AREA-arithmeticgeometry-2.review.json) and
[the first fix report](RT-AREA-arithmeticgeometry-2.fixes.md).

Both ownership fixes are applied to the finished
[packet](../packets/InverseGaloisAndArithmeticFundamentalGroups.json),
[reader](../readmes/InverseGaloisAndArithmeticFundamentalGroups.md) and
[suggested Lean file](../suggested/InverseGaloisAndArithmeticFundamentalGroups.lean).
The finished blueprint already contains the Noohi/pro-étale and normal-subgroup
nodes that the first report requested. This fix strengthens those stable owners
and adds two arithmetic prerequisite targets. It does not need new atlas stage
IDs or a second roadmap. The existing review object is unchanged; these edits
await `REV-FIX-RT-AREA-arithmeticgeometry-2~2`.

## Finding /1: Noohi fundamental group and topological torsors

The owners are `IG.0/noohi-groups` and
`IG.0/proetale-fundamental-group`, following the finite-cover construction in
the existing IG.0 stage. The finite-cover node retains its own contract.

The revised construction specifies a connected, locally topologically
noetherian scheme X and a geometric point x. It reconstructs the category of
all locally constant set sheaves through a tame infinite Galois category and
defines the topological group as automorphisms of its geometric stalk functor.
The group is Noohi. Restriction to finite covers gives the completion for
**continuous finite quotients**, avoiding an abstract group completion that
would lose continuity. Geometric unibranchness is an additional sufficient
condition for equality with the finite-étale group.

The torsor contract uses the continuous-value sheaf
F_H(U)=Cont(|U|,H), with H locally profinite. This range includes GL_r(E) for a
p-adic local field and J_b(Q_p), which is the Caraiani–Scholze consumer. No
claim for every topological target group is needed. The proof route records
compact-open reduction, the pointed geometric cover, its slice/action
equivalence, finite-quotient construction and descent. The geometry and
reductive-group structure of J_b remain external inputs.

For right torsors the unframed answer is the groupoid
Hom_cont(π₁^proét,H)//H. An arrow a from ρ to ρ′ satisfies
ρ′=aρa⁻¹, and its automorphisms form the centralizer of its image. For a fiber
point p the convention is g(p)=pρ(g); replacing p by p a gives a⁻¹ρa. Thus a
framed torsor gives a homomorphism and has no nonidentity frame-preserving
automorphism. The reader and API now specify both versions and basepoint
transport.

Seven API items and five discriminating tests cover:

- normal schemes, where comparison recovers the usual étale group;
- the rank-one local system on two projective lines joined at two nodes,
  with gluing by p and noncompact monodromy;
- a trivial S₃-torsor, retaining six automorphisms until a frame is fixed;
- the positive-genus example distinguishing the group from its prodiscrete
  completion;
- the split and quadratic C₂-torsors over Q, with different monodromy.

The last two tests strengthen the previous three. The nodal test now follows
Kedlaya–Liu Example 1.4.5 exactly in its geometric setup; their Example 1.4.6
gives a separate irreducible variant. The Noohi reader test is also synchronized
with the packet's existing, concrete Z/2Z action test.

The pin already supplies `AlgebraicGeometry.Scheme.ProEt`,
`Scheme.proetaleTopology` and `Scheme.ProEt.topology` in
`Mathlib/AlgebraicGeometry/Sites/Proetale.lean`, lines 66, 100 and 151.
These declarations are recorded in the baseline. SF.2 supplies the comparison
with the sheaf site, stalks and locally constant sheaves. E2 supplies repleteness
and descent only where used. The Noohi reconstruction and torsor groupoids
remain reader targets until their actual carriers exist; the Lean file records
the full API/test omissions without inventing substitute carriers.

Evidence was reread in Bhatt–Scholze, arXiv v2: Definition 7.1.1 and Example
7.1.6, pp.63–64; Theorem 7.2.5, pp.65–66; Lemma 7.3.9, pp.67–68; Lemma 7.4.1,
Definition 7.4.2, Construction 7.4.4 and Lemmas 7.4.3, 7.4.7 and 7.4.10,
pp.69–71; Example 7.4.9,
pp.70–71; and Lemma 4.2.12, p.30. The consumer was checked in
Caraiani–Scholze Proposition 1.13/Remark 1.14, pp.656–657, and Proposition
4.3.13/Remark 4.3.14, pp.720–721. Kedlaya–Liu Remark 1.4.4 and Examples
1.4.5–1.4.6 are on printed p.21.

## Finding /2: the arithmetic normal-subgroup theorem

The definite owner is `IG.2/absolute-galois-normal-subgroups`, with two new
target-level prerequisites:

- `IG.2/hilbertian-finitely-generated-fields`: every field finitely generated
  **as a field over Q** is Hilbertian, including positive transcendence degree.
  Its transfer argument is part of the target rather than silently supplied by
  the number-field theorem.
- `IG.2/weissauer-extension`: if k is Hilbertian, K/k is an algebraic Galois
  extension of arbitrary degree, and L/K is proper finite separable, then L is
  Hilbertian. K itself need not be Hilbertian. The proper-extension hypothesis
  is essential.

The normal-subgroup conclusion is N={1} for a closed normal, topologically
finitely generated subgroup of Γ_k, where k is finitely generated over Q.
Closedness, normality, the subspace topology and finite generation as a field
are explicit. Q(t) is a positive test; using algebra finite type instead would
exclude it. The absolute Galois group C₂ of R is a counterexample to removing
the field hypothesis. The contract does not export the unrestricted
Hilbertian-field formulation cited by the extraction.

The proof route makes the extra arithmetic input visible. For nontrivial N,
choose a proper open normal N₁ in N and put K=(k̄)^N and L=(k̄)^N₁. The closed
normal hypothesis makes K/k Galois, and L/K is proper finite separable.
Weissauer makes L Hilbertian. Simultaneous Hilbert specialization of
Y²−aT, for representatives a of a finite span of square classes, produces a
new independent class. Consequently Γ_L=N₁ has quotients (C₂)^r for
arbitrarily large r. Profinite Schreier makes N₁ topologically finitely
generated, contradicting those quotient generator ranks.

That last group-theoretic step is already implemented in current Tau Ceti as
`TauCeti.IsTopologicallyFinitelyGenerated.of_openSubgroup`,
`TauCeti/Topology/Algebra/Group/Generation.lean`, lines 261–265 at commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Its statement and proof were read,
and it is imported through ProfiniteProPGroups3. The old PPG0 request no longer
purports to supply the arithmetic theorem: it supplies generic profinite
subgroup, quotient and fixed-field interfaces.

The pinned libraries also permit an actual target signature:
`TauCeti.InverseGalois.absoluteGalois_normal_eq_bot`, on
`Field.absoluteGaloisGroup K`, with `Algebra.EssFiniteType ℚ K`, a native
closed normal subgroup, and `TauCeti.IsTopologicallyFinitelyGenerated N`.
`IntermediateField.fg_top_iff` explains the field-generation condition. The
theorem proof is intentionally a roadmap obligation. The Hilbertian and
Weissauer targets remain whole Lean omissions until their Hilbert-set and
field-transfer interfaces exist.

Weissauer's **original** Satz 9.7 and its proof were read on printed p.219,
with the surrounding §9 arguments on pp.217–220. This settles the extension
theorem's exact hypotheses. Minamide Corollary 2.3(i), p.186, corroborates the
finitely-generated-over-Q field range; his Theorem 2.1 and the conventions on
p.179 identify the relevant finite-generation obstruction. Schmidt–Stix
Theorem 7.1 and its proof, pp.849–850, use that obstruction to recover the
constant-field quotient from the maximal such geometric subgroup.

The proof-source boundary remains explicit. Minamide and Mochizuki cite
Fried–Jarden’s second edition (2005), 13.4.2 and 13.9.1(b); Schmidt–Stix
cites the third edition (2008), 16.11.6. None was **read directly**, and
cross-edition numbering has not been certified. Weissauer's earlier
nonstandard foundations and Roquette dependency were not fully decomposed.
The renamed gap, **Absolute Galois proof-source closure**, assigns the standard
transfer/extension proofs and comparison with the quadratic-quotient argument
to the two new targets and the normal-subgroup target. Mochizuki Theorem 2.4,
pp.62–63, supplies a checked number-field Galois-extension variant with its own
no-cyclic-degree-p-extension hypothesis; that hypothesis has not been dropped
or attributed to an arbitrary-field theorem. Ownership is settled at target
level; original-source proof closure is not certified.

## Routing for integration and independent review

These are notes for the maintainer; the paper extractions and atlas data are
outside this job's deliverables.

1. Caraiani–Scholze item /125, route 13, should resolve to the existing IG.0
   continuation at `IG.0/proetale-fundamental-group`, using the conjugation
   groupoid. The first report's proposed `IG.0a` is unnecessary because the
   finished blueprint already has the distinct continuation nodes.
2. Schmidt–Stix item /36, route 3, now has a named supplier at
   `IG.2/absolute-galois-normal-subgroups`, supported by the two new targets.
   Its extraction remains partial, its independent verdict remains `revise`,
   route 3 remains rejected, and its existing gap G2 is not closed. A revision
   must reconcile that extraction's broader wording, source closure and this
   precise supplier contract before its independent review accepts the route.
3. Bresciani item /119 retains its valid Hilbertian-field/thin-set tag to
   ordinary IG.2. It is not evidence for the normal-subgroup theorem.

The packet's ownership notes, source-routing ledger, supplier requests, gap
consumers and signature inventory express these same boundaries. No accepted
review verdict was extended to the changed or new targets.

## Provenance and validation

Public sources used for the added arithmetic targets:

| Source | Inspected locator | SHA-256 of inspected PDF |
| --- | --- | --- |
| R. Weissauer, [Der Hilbertsche Irreduzibilitätssatz](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0334/LOG_0015.pdf), J. reine angew. Math. 334 (1982), 203–220 | §9, pp.217–220; Satz 9.7 p.219 | `b0434aee69b8f5ed8ee5ec995d3a4c01eab82dda3852e02bfc154552a7728ea5` |
| S. Mochizuki, [Global solvably closed anabelian geometry](https://www.math.okayama-u.ac.jp/mjou/mjou48/_07_mochizuki.pdf), Math. J. Okayama Univ. 48 (2006), 57–71 | Theorem 2.4 and proof, pp.62–63 | `c336f36aab8932aeacf95d9cd9573fba851e36f696a5256a86eb6bfb071961f6` |
| A. Minamide, [Indecomposability of various profinite groups arising from hyperbolic curves](https://www.math.okayama-u.ac.jp/mjou/mjou60/_10_Minamide.pdf), Math. J. Okayama Univ. 60 (2018), 175–208 | conventions p.179; Theorem 2.1 and Corollary 2.3, p.186 | `482576a533b00f5451dafb8905ff790e16dffe1f0bb71e170e82ebd8ad14c6f6` |

All were accessed on 17 October 2026. The packet records these versions and
retains the hashes of the existing Bhatt–Scholze, Kedlaya–Liu,
Caraiani–Scholze and Schmidt–Stix sources. All mathematical descriptions here
and in the blueprint are written in the fixer's own words.

The accepted AUDIT-09 library entries for IG.0 and IG.2 were read. The relevant
current roadmap interfaces were checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`, with the current Tau Ceti commit
above. No new Noohi or Hilbertian/Weissauer supplier was found there. Generic
profinite foundations, field Galois correspondence, the native scheme site and
the existing Schreier theorem are reuse inputs. The seven added baseline
references were read at Mathlib `082e2d3` / Tau Ceti `f790474`; the library pins
are unchanged.

Validation:

- `scripts/check_blueprint.py` passes with **0 errors and 0 warnings**, also
  against a declaration index generated from the existing pinned sources.
  The packet has 139 nodes, 206 definition/construction API items, 157 tests,
  29 recorded gaps and 49 supplier requests. Every implementation status is
  unchecked.
- `lean-check` elaborates the 1,363-line suggested file successfully, with
  111 warnings, all stating that a declaration uses `sorry`.
- Packet/reader/Lean inventory consistency, preservation of the original
  review, deliverable-path checks and `git diff --check` pass.
- The separate `scripts/check_sorry_data.py` shape check reports the same
  **14 pre-existing flags** as the original suggested file. They concern
  finite-cover functors/coproducts, braid/exterior actions, realization
  adapters, the dihedral example and the lifted affine parameterization;
  none is introduced by this fix. This is remaining shape debt outside the
  two findings, for a focused cleanup before packaging. The new target is a
  theorem over native carriers and introduces no data placeholder.
