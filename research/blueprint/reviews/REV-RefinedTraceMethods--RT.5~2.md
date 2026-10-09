# Independent review of the RT.5–RT.6 planning pass, revision 2

Job: `REV-RefinedTraceMethods--RT.5~2`. Issue: #7552. Reviewer: Codex, session
`codex-vJYMBU`. Date: 9 October 2026.

**Verdict: accepted.** This session wrote neither the original plan nor its
revision. I read the first review and the revision handoff, then independently
checked the revised packet, reader and suggested file against their sources and
the pinned libraries. The first review's outstanding reader objections have
been resolved. Further clear corrections found in this review are applied to
all affected deliverables.

Acceptance concerns a complete target-level planning pass. Both stages remain
`planned`, with precise remaining work, eight gaps and seventeen open supplier
requests. Neither stage is `closed`. The unavailable coherent signatures and
the announced Bhatt–Mathew proof remain explicitly identified obligations;
acceptance does not certify those obligations as proved or implemented.

## Inventory and scope

| Item | Result |
|---|---:|
| Nodes | 84 |
| This review's node verdicts | 70 verified; 14 corrected |
| Added or unverifiable nodes | 0 |
| Theorems / comparisons / applications | 46 / 11 / 1 |
| Definitions / constructions | 8 / 18 |
| API items / unit-test contracts | 120 / 79 |
| Planets | 12, six per stage |
| Pinned baseline declarations | 10, all confirmed |
| Sources / independently confirmed source findings | 10 / 8 |
| Source-coverage destinations | 52 |
| Gaps / open requests | 8 / 17 |

Every scoped stage target is realized. At target level, the definitions,
constructions and key theorems used by the targets have direct prerequisite
chains and proof outlines. I retained the five theorem nodes added by the first
review: trace-class functoriality, the rigidity criterion, nuclear closure,
smooth/proper normalization and the circle-completion equivalence. Their
`addedBy` provenance remains that of the first review. No proof was split into
unrequested lemma-level nodes.

The scope keeps generic de Rham, prism, Nygaard, almost and geometric AΩ
constructions with their owners. RT.6 constructs the trace comparisons. RT.3b
owns the AMMN pullback theorem; RT.6 supplies its filtered trace interface.
MW's additional analytic interpretation and its expected refined Habiro
descent are outside the asserted algebraic coefficient theorem.

## Corrections applied in this review

| Node or field | Correction and source |
|---|---|
| `refined-base-change` | Restored rigidity of X′ in the additional base-change statement and kernel argument, required by MW Lemma 2.26, pp.22–23. |
| `refined-ku-computation`, `torsion-qhodge` | Made Hodge completion explicit in the filtered connective ku input, as in MW Corollary 3.8, p.32, and Theorem 3.14(a), pp.36–37. |
| HQ.3 request | Distinguished that filtered Hodge-completed ku input from the periodic qHdg object, whose colimit comparison is insensitive to Hodge completion. Retained chosen Moore transitions and the separate p=2 obligation. |
| `refined-ku-computation`, `refined-traces` | Corrected MW Convention 3.1 from p.28 to p.29. |
| `graded-motivic-comparison`, `syntomic-graded-tc`, `motivic-filtrations`, `trace-breuil-kisin-twist`, `filtered-frobenius`, `motivic-convergence` | Corrected the published BMS Theorem 1.12 locators: part (3) spans pp.206–207; parts (4) and (5) are on p.207; the whole theorem spans pp.206–207. The previous pp.210–211 references pointed elsewhere. |
| `trace-flat-descent`, BMS read receipt | Removed nonexistent §4.6. The QRSP unfolding results are in §4.4, Lemmas 4.28–4.30 and Proposition 4.31, pp.229–230; the receipt also identifies variants 4.33–4.36, pp.231–232. |
| `trace-noncompleted-extension` | Tightened BMS Construction 7.12 to p.259 and split the BS Theorem 13.1/Lemma 13.2 proof, pp.94–96, into a separate `bs` source entry. It had been attributed to `bms`. |
| `aomega-comparison` | Added the missing page locator, p.204, for the overview Theorem 1.8. |
| `aomega-nygaard-decalage` | Corrected Proposition 9.10/Remark 9.11 to pp.289–290; Proposition 9.10 begins on p.289. |
| Source metadata and findings | Recorded the fresh source access/read date, fresh independent reasons for all eight findings, and the current review identity. Rechecked the BMS p.285 page image. |
| Reader and suggested file | Mirrored the mathematical and locator corrections, corrected the reader's current source-verdict identities, and aligned its AMMN acceptance sentence with the packet. |

One additional source finding, E8, records the stray Z_p source-base label in
MW Corollary 3.13, p.36, confirmed in the text and page image. The global
classifier immediately before it and the unrestricted high-powered integer
require the Z-base transition already used by the packet.

No baseline citation was removed or replaced. No new node, API item, test,
planet, request or gap was needed.

## First-review corrections rechecked

The reader and suggested contracts now contain all 84 nodes, including the
five promoted key theorems. Statements, proofs, API, tests and completion
conventions agree with the corrected packet. No source excerpt or verbatim
passage is retained; mathematical expressions and the results are stated in
the workers' own words.

In particular, BMS Corollary 7.10 and Remark 7.11, p.258, give Frobenius
factorization **maps**, with inverse-Frobenius translates in ξ_r. Theorem 9.6,
pp.286–290, constructs the almost comparison using those maps and the
invertible Frobenius of its pro-étale target. Projective QRSP extraction and
Cartier/Bockstein recognition then produce the honest equivalence. Proposition
9.10, pp.289–290, identifies the earlier factorization as an equivalence only
after that comparison. The direct AI.1 filtered-Beilinson supplier is present;
PR.6's separate qΩ→AΩ comparison is not used to prove the trace comparison.

Wagner Theorem 5.63, pp.79–80, supplies a graded module comparison under
4.18(A),(R), 4.18a(R2), 2 invertible and 5.43(A2). An unrestricted
multiplicative enhancement is not inferred. Remark 4.28, p.50, enhances
Theorem 4.27 under its chosen E_n lifts, with E_(n−1) monoidality. The
number-field specialization in Corollary 6.15, p.86, retains both 6|Δ and
disc(F)|Δ and the specified spherical étale lift. Periodic KU needs its
supplied reconstruction argument, beyond the bounded-below solid embedding.

Efimov Proposition 1.1, pp.15–16, retains a compact unit and generation by
sequential systems with both left and right trace-class maps. MW Lemma 2.18,
p.18, uses relative evaluation for properness; its compact-object criterion
is qualified by the compactly generated algebra case. The absolute Ind
example, scalar coefficient map and trace-class composition/tensor/identity
API are all present with those qualifications.

The higher suggested declarations are mathematical contracts in comments.
They are not unspecified proposition fields or surrogate ordinary categories.
The three expressible signatures use actual arithmetic, quotient-ring and
chain-complex types. Their elaboration leaves proof bodies as `sorry`, as
permitted by protocol §13.

## Source and baseline evidence

All ten versioned public PDFs were freshly obtained and their SHA256 hashes
matched the packet. Every node locator and relevant proof was read. The
versioned source links are:

- [Meyer–Wagner, arXiv:2410.23115v4](https://arxiv.org/pdf/2410.23115v4).
- [Efimov, rigidity, arXiv:2510.17010v1](https://arxiv.org/pdf/2510.17010v1).
- [Bhatt–Morrow–Scholze, published DOI PDF](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf).
- [Bhatt–Mathew, arXiv:2202.04818v2](https://arxiv.org/pdf/2202.04818v2).
- [Blumberg–Gepner–Tabuada, arXiv:1001.2282v4](https://arxiv.org/pdf/1001.2282v4).
- [Wagner, arXiv:2510.06057v1](https://arxiv.org/pdf/2510.06057v1).
- [Scholze, arXiv:2412.03382v3](https://arxiv.org/pdf/2412.03382v3).
- [Efimov, continuous invariants, arXiv:2405.12169v4](https://arxiv.org/pdf/2405.12169v4).
- [Bhatt–Scholze, arXiv:1905.08229v4](https://arxiv.org/pdf/1905.08229v4).
- [Antieau–Mathew–Morrow–Nikolaus, arXiv:2003.12541v2](https://arxiv.org/pdf/2003.12541v2).

The packet's read receipts and each of its 84 checked-node notes identify the
results used. This review does not claim a full reading of unrelated portions
of these sources. The general external rigidification proof remains an honest
gap. Bhatt–Mathew Example 1.6, p.2, is explicitly an announcement without
proof; its site-change and henselian-rigidity proof obligations are retained.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read the actual
statements of `Nat.factorization`, `Nat.factorization_pow`, `MvPolynomial`,
`Ideal.Quotient.mk`, `Ideal.Quotient.lift`, `LaurentPolynomial`,
`LaurentPolynomial.C`, `LaurentPolynomial.T`, `ChainComplex` and
`HomologicalComplex.Hom.comm`. The pinned links are in the reader and packet.
The arithmetic preserves factorization's zero convention and imposes
positivity separately. The quotient/lift declarations provide the ordinary
coefficient algebra, not its homotopical grading or spectrum. `Hom.comm`
supplies the chain differential equation; the separate B-compatibility
assumption is essential. No concrete Tau Ceti declaration is falsely credited
with the higher construction.

The reviewed RT.5/RT.6 audit at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` says these layers are not built,
while recording the existing θ map and overlaps with DD.5, AI.7 and PR.3.
Those constructions are imported, not replanned. The upstream
OneParameterSemigroups and Multiquadratic documents were read for the developed
API and acceptance-example standard.

## Suppliers, API, tests and assigned findings

I read all 102 distinct external node contracts directly used by this packet.
A recursive prerequisite inventory, selecting integrated nodes before pending
packets and overriding the scoped packet with this revision, reached 757
nodes, 449 baseline/upstream terminals and 55 stage terminals. It found no
missing identifier or cycle. These counts are structural evidence only:
stage terminals and planned supplier nodes do not certify mathematical closure.
The open requests specify the stronger coherence, multiplicative, site or
completion interface needed beyond the current supplier statement.

In particular, PR.3's BMS2 comparison supplier is independent prismatic
recognition and Nygaard completion, rather than the trace equivalence under
review. PR.4 independently constructs the syntomic fiber. The RT.3b graded
Beilinson proof uses RT.6 trace inputs without feeding its own interface back
into them. RT.3's nilpotent theorem is not passed off as full henselian-pair
rigidity; the proposed Part II and exact site proof remain requested.

All 26 definitions/constructions have at least three discriminating test
contracts. I checked the 120 API items against their recorded uses, including
constructors, universal properties, functoriality and coefficient/filtration
compatibility. The tests detect such errors as reverse trace-class classifiers,
noncontinuous right adjoints, confusing basic and arbitrary nuclear objects,
omitting the special 2-exponent, treating semilinear Frobenius as scalar-linear,
and replacing Nygaard cofibers by levels. The twelve planets are mathematical
objects and named theorems of the scoped stages.

The assigned confirmed red-team findings are correctly represented:

- **RT-AREA-ktheory-2/28:** RT.5 directly imports RT.4 topological, q-Hodge and
  Habiro comparison nodes; exact finite-torsion/p=2 extensions remain requested.
- **RT-AREA-ktheory-2/29:** H.6 is asked for the Burklund multiplicative Moore
  tower and compatible transitions. Its additive cofiber node is insufficient.
- **RT-AREA-ktheory-2/36:** PR.4 is a direct independent supplier to the graded
  syntomic comparison in RT.6.

All eight `sourceIssues` were freshly confirmed at their locators and assigned
this review's identity. E1–E5 are the base, trace-argument, weight, indexing and
coefficient-target slips on published pp.255, 261, 288 and 302. E6's published
p.285 image still has the flat superscript, although the proof concerns O_C
sequences. E7 reverses the classifier in MW Definition 1.1(b), p.2, relative
to its correct Definition 2.1, p.11. E8 is the additional global-base
label slip described above. The seven inherited findings and E8 concern the
sources; their corrected mathematics is retained in the packet.

## Validation and orchestration

`python3 scripts/check_blueprint.py
research/blueprint/packets/RefinedTraceMethods--RT.5.json` reports **0 errors
and 0 warnings**. A separate consistency check confirmed all reader node
statements, proof steps, direct prerequisites, acceptance examples, API/test
contracts, recorded uses, requests and gaps against the packet. All 81 higher
suggested contracts and their API/tests agree; the three executable signatures
were checked directly.

`lean-check research/blueprint/suggested/RefinedTraceMethods--RT.5.lean`
elaborated successfully in the shared build at the pinned Mathlib, exit 0,
with **25 `sorry` warnings and no other warning or error**. Available memory
was checked before elaboration. This validates signatures, not their proofs.

There is no unresolved question blocking acceptance. For orchestration, retain
the existing maintainer note about PAPER-BHATT-MORROW-SCHOLZE-19/E8: its edition
metadata says the published PDF corrects the slip, while the current published
DOI image retains it. Also preserve the precise henselian Part II/site request
when routing future closure work. This review changes neither the extraction
nor another owner's files.
