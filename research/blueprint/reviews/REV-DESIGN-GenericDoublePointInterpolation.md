# REV-DESIGN-GenericDoublePointInterpolation — accepted independent target-level review

Codex, session codex-a71f92, issue #1724, 2026-10-04. Claim5985560935 was confirmed by bot5985562080 and the whole issue reread. The original design was by Codex session codex-J6LwjP, not this reviewer. Original inputs were read at cff58e4d55934675d5effc5774d639c5da6732e9. Final validation and publication base are 6577b1b0fcc41bf5bcf3878bcd22fc33c78702ee; the reviewed files, binding instructions, actual supplier stages and library audit did not change between those bases.

## Verdict and counts

Accepted as a finished **target-level planning pass**, not formalization or proof closure. All77 nodes are checked:56 verified,21 corrected,0 added,0 unverifiable. There are46 lemmas,12 constructions,5 comparisons,11 theorems,2 definitions and1 application,42 API items,42 unit tests and21 planets. All14 definitions/constructions have at least three discriminating tests. All24 actual pinned baseline statements are confirmed; none removed or replaced. All six layers GI.0–GI.5 are planned and none closed. The10 gaps and4 precise supplier requests remain open; every implementation status remains unchecked.

Target-level granularity is required by the issue and the detail policy. The key source-level targets and definitions are present, and the native geometric/arithmetic refinement gaps are not relabelled as proved prerequisites. No proof was split merely to imitate lemma-level density. All21 planet names describe mathematical objects or named results, rather than source locators.

## Corrections made

The recoverable corrections.json records every one of the34 node-field changes with its old value, new value and reason. The affected21 nodes are:

- GI.0/bounded-finrank and GI.1/point-comaximal: their existing locators referred to Couveignes but sourceId incorrectly named BO; corrected to COU. GI.0/coefficient-gram now quotes the coefficient-orthonormality phrase actually present on printed p493.
- GI.3/terracini-span, terracini-contact, plane-numerics and plane-sextic-base: corrected printed page locations to pp3–4, pp5–6, p6 and p6 respectively.
- GI.4/numerical-trace-bound, numerical-residual-bound and numerical-quartic-bound: corrected Lemma6.3 locations to pp15–16 and an excerpt present there.
- GI.2/curvilinear-limits and GI.4/moving-supports: removed references to a nonexistent printed Step4. Their arguments occur in the two cases following Step3.
- GI.4/univariate-hermite: made the source scope explicit. The reviewer read the opening paragraph of §7.1 p19 only, in addition to §§1–6; no historical Waring or Sylvester classification is an imported premise.
- GI.3/two-cubic-bases and one-cubic-bases: state existence of suitably chosen distinct configurations, followed by generic rank openness, instead of an unqualified assertion for arbitrary tuples. GI.3/one-cubic-recursion explicitly restores the general distinct support hypotheses from Proposition5.4.
- GI.4/transverse-limit-rank: conditional on an independent **selected partial trace**. Removed the underfilled-only trace prerequisite; added subset independence and the successful Step2 residual setup. Local transverse trace/residual lengths alone do not assert rank independence.
- GI.4/tangent-moving-rank: explicitly requires the Step2 independent residual system. The mixed-parameter proper-family argument remains a gap, not an arbitrary-fibre semicontinuity shortcut.
- GI.4/underfilled-contradiction: explicitly carries all three AH induction hypotheses and imports its full-remainder trace-independence lemma.
- GI.4/overfilled-partial-scheme: explicitly carries those induction/setup assumptions, selects only ν remainder supports for the filled trace, fixes the split restriction notation, and adds the direct Step2/subscheme/rank-open inputs. Its ν<0 branch now states both ordinary-Horace rank obligations.
- GI.4/overfilled-contradiction: applies the shared conditional transverse lemma to that selected ν-support trace, never to the generally nonindependent full Γ trace.

The acceptance statements and exactTarget omission ledger are synchronized with the revised statements. Baseline checked fields now record this independent actual-statement reading. Packet/roadmap review objects record acceptance. Source-version scope and both source-issue verdicts are updated. The suggested Lean change is a boundary comment only: its geometric targets remain explicitly unrepresented, rather than being replaced by proof-shaped assumptions. Its executable declarations and examples are unchanged.

## Sources and source findings

The [Brambilla–Ottaviani arXiv v2](https://arxiv.org/pdf/math/0701409v2), dated10 September2007, was freshly downloaded and §§1–6 printed pp1–19 read in full; only the opening univariate paragraph of §7.1 p19 was additionally used. PDF358544 bytes, SHA2567d3dd9e6268431f4be53740bbf57ebf46d9a76b13c3472d6911d7f6deb530aa7. [Couveignes’s published Annals paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v192-n2-p04-s.pdf) §3 printed pp491–493 was read in full. PDF304335 bytes, SHA2568d63bd3a14f0d61f421695f1d93559d18fb674240c6dee872c23bf5902e1a104. Each node’s locator/excerpt and source hypotheses were compared with these passages. Algebraic reformulations retain weaker hypotheses where their explicit proofs permit them; generic projective arguments retain algebraic closure and characteristic zero.

The official [Ottaviani publication page](https://people.dimai.unifi.it/ottaviani/public.html) supplies a [journal-layout PDF](https://people.dimai.unifi.it/ottaviani/pubblic/ahfinale.pdf),434512 bytes, SHA256a458098b6f01b2670fab7ee16ad04f93ca92e6e81239ce38d7845904ad6ca05e. The reviewer read its first page and §§5.2–5.4 on printed pp1236–1237, not its entire text. It identifies JPAA212(2008),1229–1251 and retains both findings below. The FLORE PDF endpoint still returned403. The DOI resolved to an HTML landing page only; that endpoint did not serve the paper. These distinct acquisitions and reading scopes are recorded, not conflated with an unread publisher endpoint. ArXiv history lists v1/v2 and no later revision; checked primary listings/search found no separate correction. Novelty is not asserted.

E1 is confirmed at arXiv p10 and journal p1237: the r=7 base’s last ambient projective-space designation is an obvious carry-over from the preceding r=5 calculation. Correcting it changes no intended mathematics.

E2 is a newly recorded **literal-statement missing-hypothesis issue**, confirmed at arXiv p10 and journal p1236. Proposition5.3 needs a general pair of codimension-three spaces. If L=M=P²⊂P⁵, the cubic part of I_L² has dimension28, is singular along L, and three ambient singularities impose at most18 derivative conditions. Hence nonzero cubics remain even with six distinct general supports on L. The proof’s containing-form dimension also presupposes a generic pair. This does not refute the intended generic result or Alexander–Hirschowitz; the packet already had the correct general-pair recursion. No communication to the authors is authorized or made.

## Actual pinned baseline and audit

Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 are unchanged. Every citation here is Mathlib. Its actual declaration body/signature, namespace and surrounding typeclass assumptions were read at the pin, not merely found in an index. These are the24 confirmed declarations:

- mathlib:MvPolynomial.restrictTotalDegree — Mathlib/RingTheory/MvPolynomial/Basic.lean
- mathlib:MvPolynomial.basisRestrictSupport — Mathlib/RingTheory/MvPolynomial/Basic.lean
- mathlib:MvPolynomial.mem_restrictTotalDegree — Mathlib/RingTheory/MvPolynomial/Basic.lean
- mathlib:MvPolynomial.monomial_mem_restrictSupport — Mathlib/RingTheory/MvPolynomial/Basic.lean
- mathlib:MvPolynomial.pderiv — Mathlib/Algebra/MvPolynomial/PDeriv.lean
- mathlib:MvPolynomial.pderiv_monomial — Mathlib/Algebra/MvPolynomial/PDeriv.lean
- mathlib:MvPolynomial.pderiv_X — Mathlib/Algebra/MvPolynomial/PDeriv.lean
- mathlib:MvPolynomial.pderiv_mul — Mathlib/Algebra/MvPolynomial/PDeriv.lean
- mathlib:MvPolynomial.eval — Mathlib/Algebra/MvPolynomial/Eval.lean
- mathlib:MvPolynomial.aeval — Mathlib/Algebra/MvPolynomial/Eval.lean
- mathlib:MvPolynomial.eval_monomial — Mathlib/Algebra/MvPolynomial/Eval.lean
- mathlib:MvPolynomial.aeval_monomial — Mathlib/Algebra/MvPolynomial/Eval.lean
- mathlib:MvPolynomial.homogeneousSubmodule — Mathlib/RingTheory/MvPolynomial/Homogeneous.lean
- mathlib:MvPolynomial.lcoeff — Mathlib/Algebra/MvPolynomial/Basic.lean
- mathlib:Sym.equivNatSum — Mathlib/Data/Finsupp/Multiset.lean
- mathlib:Sym.card_sym_eq_choose — Mathlib/Data/Sym/Card.lean
- mathlib:TrivSqZeroExt — Mathlib/Algebra/TrivSqZeroExt/Basic.lean
- mathlib:TrivSqZeroExt.inr_mul_inr — Mathlib/Algebra/TrivSqZeroExt/Basic.lean
- mathlib:Ideal.quotientInfRingEquivPiQuotient — Mathlib/RingTheory/Ideal/Quotient/Operations.lean
- mathlib:Matrix.rank_eq_finrank_range_toLin — Mathlib/LinearAlgebra/Matrix/Rank.lean
- mathlib:MvPolynomial.eq_zero_of_eval_zero_at_prod_finset — Mathlib/Combinatorics/Nullstellensatz.lean
- mathlib:MvPolynomial.degreeOf_le_totalDegree — Mathlib/Algebra/MvPolynomial/Degrees.lean
- mathlib:PrimeSpectrum.basicOpen — Mathlib/RingTheory/Spectrum/Prime/Topology.lean
- mathlib:PrimeSpectrum.mem_basicOpen — Mathlib/RingTheory/Spectrum/Prime/Topology.lean

Finite CRT includes a finite index type and pairwise coprime ideals. Matrix rank-to-linear-map comparison includes the finite column basis and the native basis orientation. Monomial/bounded-coordinate work uses the native restricted basis rather than planning a duplicate. The Nullstellensatz grid lemma requires an integral domain, finite variables and enough distinct values. PrimeSpectrum.basicOpen is only the native open carrier, not the missing k-valued jet-kernel comparison.

The actual data/library-coverage.json was read at both immutable bases. It has no reviewed GenericDoublePointInterpolation layer. Its actual four relevant supplier records mark R09.1/SF.0/SF.5 partly built and R09.2 not built. In particular native Spec, schemes, O-modules, affine tilde, gluing, morphism properties and basic Proj are not planned anew. Twisting sections, universal Hilbert families and the selected intersection/contact interfaces are not claimed already available.

## Suppliers, closure and scope

All external mathematical references are the four stage requests; there is no unexamined foreign node promise. The actual supplier stage statements were read, not just the original author’s snapshots. R09.1 owns projective parameter spaces and universal sheaves; R09.2 owns projective finite-presentation Hilbert/Quot representability, base change and universal-family flatness. Its statement correctly distinguishes universal-family flatness from flatness of its parameter morphism. SF.0 owns scheme/sheaf foundations; SF.5 owns intersection theory. Their current descriptions do not supply the exact consumer signatures. The SF packet was searched for those interfaces and its actual coverage read: its residual/trace/contact/finite-Hilbert interfaces are not supplied by its current nodes. Reading that packet here checks compatibility only, not an independent certification of any supplier work by this reviewer.

The4 requests remain precise: native P^r/O(d)/section/chart comparison; native ideal-sheaf residual/trace and finite section/k-point comparisons with a general contact-incidence continuation; plane Cartier/Bézout/incidence inputs; and actual finite-flat moving/Hilbert/curvilinear proper families with residue/base-change/mixed-parameter control. General contact foundations belong to the supplier’s Part II, not a duplicate local theory. EffectiveBoundsCompactModels owns its arithmetic parametrization and proof that the chosen minor pulls back nonzero.

Every stage target is represented at the requested level. The10 remaining gaps precisely cover native affine adapter closure, projective section interfaces, plane contact proof refinements, formal finite-certificate replay, codimension-three/remainder families, proper curvilinear limits, Horace mixed ranks, unbounded arithmetic/scheduler proof, transported coefficient metric/lattice, and actual maximal-minor/scheme/parameter specialization completion. None is silently declared proof-closed. The arbitrary-distinct univariate assertion, generic degree≥5 endpoint and low-degree exception boundaries agree with the sources. Integer specialization requires a proved nonzero pullback; the seven-point collinear counterexample prevents an all-tuples endpoint.

## Independent validation and resource use

- Actual scripts/check_blueprint.py, with the full pinned declaration index, ran on the corrected packet against a read-only immutable repository tree:0 errors,0 warnings. Actual source_issues.check_issues and check_errata.versions_checked also passed. The index SHA256 is86649a7d5f35d1178a45fe7aa4713741d03d43ff3b37bb8c91a1da1c794c8ce1.
- Actual scripts/build.py assemble ran before and after a temporary in-memory candidate overlay at 6577b1b0fcc41bf5bcf3878bcd22fc33c78702ee. Stage vertices2971→2998; edges8663→8697;34 edges added,0 removed;77 own nodes and173 own prerequisite edges. No defined-stage cycle, own-node cycle, skipped link or new orphan. The76 inherited orphan edges remain reported, not certified valid. No promotion or canonical-data write was performed.
- The original39 recoverable artifacts were authenticated by byte count and SHA256. The archived verifier was rerun without importing its generator, reconstructing all22 matrices modulo101 and checking rank, distinctness and incidence conditions. Exact Fraction elimination additionally checked429 subspace incidences over Q, so integer coordinates were not silently replaced by modular incidences. Full-column necessary-condition ranks rule out the intended cubics; sampled containment rows are not certified bases of the complete containing-form ideals. The collinear affine counterexample reproduces rank11/21.
- Exact integer arithmetic reproduces2585 critical pairs in3≤r≤60,5≤d≤40 plus the four quartic r6/8/9 cases. This is finite evidence only, not the unbounded inequalities or scheduler proof.
- The **whole revised suggested Lean file elaborated** against the existing pinned Mathlib build: exit0,0 errors,94 intentional admission warnings,0 other warnings,36 examples. Source SHA2569384a928726206f1e67c4883620906b193755b1ed84c17f63cde757a46a251aa; normalized log SHA2561c1e1b1ecaebfd00164dc63511e009c536c5cd4a502bb32ce3801438b8e697a0. Lean4.34.0-rc2 revision6a10ac8c22beadecabdbb0919c2b50214762f91d. No Tau Ceti imports; no axiom audit or admission-free claim. Every proposed declaration remains admitted. The exact ledger remains17 native signatures,4 partial-native boundaries and56 unrepresented targets.

Fresh available RAM was35GiB before the final compile. It used one Lean thread,8192MiB ceiling and1200-second timeout, completed in2.16 seconds and had measured peak RSS2,954,908KiB (about2.82GiB). No Lake project, dependency build/cache retrieval or LSP was started. Scratch remained under4MiB before this report. The Python resource receipts retain their observed process high-water values; they must not be interpreted as isolated certificate-verifier memory measurements. All validation processes have exited.

## Questions and follow-up for the orchestrator

Refresh the non-authorized reader from the corrected packet: its generic cubic/Horace contracts, source pages, additional source-version acquisition and E2 must stay synchronized. The reader was not among this review’s allowed edits. Preserve the10 gaps and4 requests in promotion and future follow-up jobs. Route the general contact/Hilbert-family refinements to their owners, never duplicate foundational carriers. Preserve source-issue scope and the distinction between a literal omitted hypothesis and the intended generic theorem. Do not read acceptance, planned stages or compiled admitted signatures as implemented or closed mathematics.

## Recoverable independent evidence

The original certificate artifacts remain recoverable from research/blueprint/handoff/DESIGN-GenericDoublePointInterpolation.md at the original-input commit; the independent evidence below does not duplicate those large matrices or any paper text/PDF. Recover its artifacts using its documented manifest and retain them with the author- prefix. The Lean source is the authorized suggested deliverable, not duplicated in this report.

The archive below includes all corrected-field values, independent receipts/logs, exact acquisition outcomes, and portable versions of the same read-only checker/assembler and certificate/rational-incidence helpers. The portable helper adaptations only replace machine-specific repository/index locations with TAUCETI_REPO and TAUCETI_INDEX environment variables. Set those to an existing clone and the pinned declaration index. The recorded commits must already exist in that clone. Use one owned extraction directory containing this review’s packet as GenericDoublePointInterpolation.json, roadmap as Roadmap.json and suggested file as Suggested.lean; run validate_review.py and replay_certificates.py there. common.py writes only that directory via apply_patch. It never copies or modifies the repository. Use an already installed pinned Lean build and one serial bounded compile to reproduce the Lean receipt; do not install or build dependencies. Changing atlas base changes integration counts; publication-base.txt records the tested base.

Recover each artifact by finding its ARTIFACT block, decoding base64, decompressing gzip and asserting both the manifest byte count and SHA256 before use. Timing and memory snapshots are machine-dependent; compare source/index hashes, exit statuses, errors/warnings, matrix ranks, incidences and graph deltas.

<!-- MANIFEST -->
```json
{
  "protocol": "recoverable-independent-review-v1",
  "job": "REV-DESIGN-GenericDoublePointInterpolation",
  "issue": 1724,
  "session": "codex-a71f92",
  "originalInputCommit": "cff58e4d55934675d5effc5774d639c5da6732e9",
  "publicationBase": "6577b1b0fcc41bf5bcf3878bcd22fc33c78702ee",
  "suggestedSourceSha256": "9384a928726206f1e67c4883620906b193755b1ed84c17f63cde757a46a251aa",
  "artifacts": {
    "check-packet.json": {
      "bytes": 960,
      "sha256": "85d9727c13ec4a19456abd08984037f7323d30f437e37f7d72805b8120282128"
    },
    "atlas-receipt.json": {
      "bytes": 606,
      "sha256": "23bc94e2ae8020fe1f6f99a08abc4e92a3680dcb6d9f0b4e5cce459a738d589c"
    },
    "Suggested.log": {
      "bytes": 7365,
      "sha256": "1c1e1b1ecaebfd00164dc63511e009c536c5cd4a502bb32ce3801438b8e697a0"
    },
    "Suggested.receipt.json": {
      "bytes": 505,
      "sha256": "1ebcf5359ce72fe159db626c445a6f0aabf5823b5d146b05680f6b71098d26d6"
    },
    "certificate-verification.json": {
      "bytes": 3070,
      "sha256": "1922ef477553fc0d5a58cf1f56d6f7b9bce5899a9882c8d6026bd0a90d475792"
    },
    "arithmetic-receipt.json": {
      "bytes": 739,
      "sha256": "c001de5beda1d695099540e08f4abc2f4d4a064f8bc89693c88b934bed5fcbcd"
    },
    "independent-certificates.receipt.json": {
      "bytes": 454,
      "sha256": "bd5eadb8b2026949d2c2054e9bb376179e0f2740a108ad93cc23d1f7baf56304"
    },
    "source-access.receipt.json": {
      "bytes": 1049,
      "sha256": "8d82be9f1a465838c176d752809308bfc85ea51f00cf2dd81175f99959031c0f"
    },
    "corrections.json": {
      "bytes": 31366,
      "sha256": "5fe1a63b6a9f829542ce5f58f498d01fbd6052186424c0c1c8fa6b9ea91bc2a4"
    },
    "replay_certificates.py": {
      "bytes": 2831,
      "sha256": "1420f476d61bfa195ffd1656d669aa746a107667b67173b20b53a0056dcb5e21"
    },
    "immutable.py": {
      "bytes": 4195,
      "sha256": "2c288e7f7c9b1a7c4a453bdc2547e4b967db7b1ace4bbce813e919a0e347f032"
    },
    "base.txt": {
      "bytes": 41,
      "sha256": "80dd69d73d560e32600cafe58b6f7d34ab894ed62de89836097a2d21c559acce"
    },
    "publication-base.txt": {
      "bytes": 41,
      "sha256": "c1f10c6b3b1c0fdc5d1c8e369c0c283f30e04985c15b4a953ad7dcd4635b893f"
    },
    "common.py": {
      "bytes": 1017,
      "sha256": "b5bbf251962502b9e7385e611fc40b4d2f7d9256fe52247f689ecaec464d4af6"
    },
    "validate_review.py": {
      "bytes": 3788,
      "sha256": "07041f4c1fec30702eefff493ce19a2a80ab53b702c03c8289ab02908a496646"
    }
  }
}
```

<!-- ARTIFACT check-packet.json gzip-base64 -->
```text
H4sIAAAAAAAC/4WSwW7bMAyG73mKwKcNKFbLsi2nt2EdhpxWoLsNO1AUnWi1JU2SsRVF332SYyfNLjvyI/nzJ6WXzXZbhGkcwT8Xd9uXFCbgAJ8oprjwFAg8Hm/lMJHz2sTbUzLcfiFDXuO9neRADzal9iaSd3aAqK358DNYU9ycBL0FNYLLiv9pWztChDiF3IB2dANFWjPGKsoJIRbwpI0KZ/MJDJT2SaBub1aE1oToJ5xH3G1Z9SYzOvA6zLw543gk62nMtewMFfXa6EXjIgHODRph1Z7x62IOnN5HGrO/eukopqTxjUK8gm4AQzOqloGFhECDNnRPOICf9ed8vbZ48vRr0kFHujrA2pgYv7jPh9u+i0cdtqc3fJ/dCn4uSDc/0GzgaoUDuKzOyvUx08zV/eW1DhT25hGtywrtFf802EAq4fIKP6SNzczbzTKtIO+tz8rff8zxb/BGm8MbEuzkkfYhTPT5n2JPoL6a4fnjpNKBPWUnRdsIIZkse8Sayb6R2PNOdBJVVfXIOYpOlBWdvleBR0qX8Y9HqJo2t/eEO8awazHJALVlpVpZY6lUpXhdJeWuBah4W8pG7BpSmCKqmKoaUI3cnWSdzpvujaI/F+mubesdCNX0vFGMiQ7qpicBUAvGRc1UyVXN+55LLqTskg9gChiKXY0dEis2r5u/thC0JMADAAA=
```

<!-- ARTIFACT atlas-receipt.json gzip-base64 -->
```text
H4sIAAAAAAAC/2WQz0/DIBSA7/srlp0XQ6EF6k2NpxmXOOPFeADeYyNraQOdczH+7/aHi+12/T7eB7zv2Xy+CKhg7YvT4nbehAMuO6ZMc1DFXYxY6gLDRB3ANa8BsYULngmhE02sMWmibaaNZVJIbYBSaxgzQgpC27PD6Lm32Sma8S6AiQYlExC5Rk2RKZJxozIQVHLKWIqWKaDAM0NyC5Dm7WXaplymhplEiiGsVcRNo7b4hqFxBmObprlIemmdV8W1zeV09BG2vZGcs4u5f5WL4SMACBPF0uWwy7L6vFCkN4Bt7888nEzRq/eP3lVH/1zB+HlCjMW5lAg2xpeZuHd1jfDk/H5End9hcA3COtQ75c8twXvr8Tjlw2vrUJUuIqzwNEphoeoWbtBUHjqe3gxLLNXXS4wrd99tllKSETL7mf0CcLe7xV4CAAA=
```

<!-- ARTIFACT Suggested.log gzip-base64 -->
```text
H4sIAAAAAAAC/6WZb2/bNhDGX9uf4mBgQALErkj914oCWdC1Bdotq9e+GYaVkmibiUSpJBU7G/bdR9rZCixdMOB5Y1vk6cfjPXekaP2xGI3cdGq7c4uKFlYaJTqSB2Wd0lsaldaypXpSXbu4oIW4E6oTdSdfqe+8fZz6tlE0t2Irrb/+ZTF2YrLKGwTrt1LotRSm2V11SmoX2lQ/Dsa9MmLchcvRDMNmr9qtdPY4gLTDGH789Dl81sI575KH/+qvhl75y/Y4kCdWpAdqhn5UnfexU7UR5p5aZWTjBnP/re92pDRJ5XbSULOTza03PHngb9TySO28lx+lsWrQIQTBaTq7OzVQsoqTVbQ0Db+gQ5H9liXLSd/qYa+XndLTYbnV00VwwrtGmWCRaIqG81qKVjaibus6KlnZ8DqNOEvyjG9K1l7Qe+lHtfJ88ef8+frq/eXPV69fPFtPWx9GP8FVcKlKoorHFe2F0V6KijywE0a44NZkpaVPdjDm/tMTBF4VGKCoGEZIGehCmqCAAgRkrIowQIwCUhCQR6iOeQxGMUdlKFAPigKMYslRAKoji2AhWYTGkUUZTChRAkNrijFYDJajBI7LydE1nvEUJqCVxeIIJsAJEeewGH7LRglwdSY5SkjRdY6lcG2lJUrIEljODA5lDicEvPGyPENDmcNiFAwmZLCcBbzrlLAYJZpSPEJDyaMUJqA7H2cclZMzdN/iDH0m5TyGCXAoOVqdPIZTKoYjCW+dHD7t8gTOKPzAzFN4Gin6fM4zWAz4yMozuDAyuDByWIscTin44Mz95puABHiZK+CchHdvDp/feZnAhAwmoPkQRzG6SMXwXwAxi2ACeuKLWQYT0CUm5vCDUAwf4GOO1lYcJzAB/RMhThhMgFMqgasz/Z9qzq6Gvhe6pVqGNzVO9bKtaBG+h8kR41FEz9++vPzhBS1viNHyHRWs5PRfIy/msw9WmiOIzqxsBt3a84rYKi/ms/W9N+wfdUarmM1n19I0UjsaNnR1/YHcTlm6GWraDq6isvxmPnvZidHKls72ouuo6Ybm9vwBtqv6vrKWBkPhO0CriK9YNJ9d3kkjtpLsThh/s5MHR1b97m+6re+dPNp+sZr0g10rnHjCzjrR3D7R7wYnuq/0vxMH1U89GWlVG6Zr5SN3eJkmZVR8gT1lfGTe+HmfGfl5UibI+ObZj+c0hjs3YuqcPVkpfbLyqaD6YCZoY0Qv/2Was5Ll89nHoZu0C+/CvEynoO2Va3bSm/hnfS/YG333hE3ph1zvvWDHwb9XnY/ZSX6lx8k9bvb59k/72kvrp9pLa8NLQT9v7b7a4Wcj1V3I2dCptlp01md759vMQ+v1Ua5j0P6OWRKVmU+ng3JBRzcdB/0LC5LzSMUcAAA=
```

<!-- ARTIFACT Suggested.receipt.json gzip-base64 -->
```text
H4sIAAAAAAAC/2WQvY7bMBCEez8FoSoBbIP/ItOdmysulQ0kZbAkVz4iEhmQ0p2CIO8e6lS4SDkzu98u5s+BkK7mpXi8vQJXuvtCOiuMBMtNzzWnemCoey+NEU1Zqh2zolfKMQxGetYPWviAvepB6kZgAN1xo475/kAyz5C1FQ/ohkAp0zJ4LRRjSKn1SmivfJCgKHdOcI/CUCaFcQa17YHuSHiDOIIb8TleLjjkgo0t1EeGI/yqGG7ocwq1+fzM9EcywXqt9SVeNtMqaanZN9Y432aYl22a7lYpuTzkO5QU030zrNw/CFOsNeb0/f9ojXl6WkKcH4CaS/n9tF5xwILJ4yMZEdI3LBtq6+drk+TT224QeRbyTE/F8yNZjf6h5WlJP1N+T6cxpmU93dNyJD5PU5yJBkbBG8+5QwitYReco5ZZz12rk8le88GycCRXbFcrfu4Ofw//AOAQIMP5AQAA
```

<!-- ARTIFACT certificate-verification.json gzip-base64 -->
```text
H4sIAAAAAAAC/8WWMW/bMBCFd/+Kg6YGsNJQEmWniYYEWTt2adGBoc42U5k0jlRctOh/70m227qQgg5lNAgQwUd8795RFD/NAL7zA5CsTIPJO0jChhBT3z76ndLoU5JpnV8+eWeT+UFJyn5hpSxPY9TO+kCtDljzBL/hccpYbWq0Gu9s/WB84HGw6P1RxaIf83+wUI5YWBavZmExYkFkV9E87N3EfTg3MEEEzv5uwhQJnPMnCOAJg0+FnI6diT73YphdRmWXKRUjZedxq16+QJZRyUVK2WjcsdMeJcvYaecj5DxuzeLqBXTcokXe77FBdCmjnydj6EXcD+u632TlEDlbRG/1KHoZFS37TTZ4mkQ+vfO+5kHy9SscY8N/rP9esnatDUj4VW13Bw9UZfO6knNbLUC7pjEWFf3tQxzHQdEaw4PZovWG7XJXTlN6o0ixPeo86I9I7sNuh3TPwM5x8qyaFt8GZddoA5Dbe1ix3hHwBdK16w201jwrMiog1LjmSyXcVhLe1CdaeXED1tFWNYflp3W/xMUfYsni4IJqbishLuG9q9tGETRujwSPnSkhYOWIr2twbj39xt6hq5wXJl1+s8+zn6Z1U5n+CwAA
```

<!-- ARTIFACT arithmetic-receipt.json gzip-base64 -->
```text
H4sIAAAAAAAC/42SzU4CMRDH7/sUk56RyLJF8EaiD2D0ZjyUdoCJu+3SDyIhvLvtuqw0RsKlmf98/TqZORYATG5Rfjr2CCWf81HyWKE3GB3HKJKM5ntnAkxHvTG774yPH83URQ4/51R9TnxPXWPSHjdol5b8tkFPMlZ5G7ALthYVSnTOWLfcG1LPXxJbT0a7y7RdEDZWPgkvBuaxB3ZfnZ3xbBfV9H6QIc04GWSa8Ddo0ZEKon4JQlmSCbnoYqfRX8Q8Q3CeIaocUV5DTMp/GYuM8TDJGLzKGNVVxvRWRpkzeMbgt8xR9BfBnDRtqmKvoW1rbFB7UcOaNHkEMewfcE8KtUQwuj6M4W2L4A7NytQxRhrjsmvyhA6EVhD0ygStUAGeT+NOpEsRqUNrjVmDxUaQhkjXY1acim+ki+wW4wIAAA==
```

<!-- ARTIFACT independent-certificates.receipt.json gzip-base64 -->
```text
H4sIAAAAAAAC/0VR0UoDMRB871csfS7lelio+qQPgihYrT+wTbbe4t0mbJJaEf/dvRyHEJYwszsz2fwsAJYDZmVHaXkDbbuqSPClR90rD2ToptlUWDFzEOwfxbEnmUau2utKBjmUY4ro6J9+OZO+Wk/WQrUJlXM3UGa3R9bquN1tK5VCUUcHF+JoubwruSOxRszkAdV1fLaLCfKJSQFlRGc16KiPhrJ4imRFcv8NSlrkFubYxs7BAL3nCbU+15H7NPEvkwO6oMvwoFaNB+p5YKkKK5AAHyRkgsG8hhjUwq3hveMEdlwYYsmzG50ns3EswzOhQNQQTmCz9jYocgzFonpIFsAWTrpe1lVQjzGRP5AL4sclNet2N30MXt5SeuL7+ldts22axe/iD2SgzEfGAQAA
```

<!-- ARTIFACT source-access.receipt.json gzip-base64 -->
```text
H4sIAAAAAAAC/62SS2/UMBCA7/0V0Z67zvht7x3EASQkyglxmNjjxiWbRI63FBD/nXTbbUFVhXgcLNkee77xN/5w1jTf1tE0m0MZNrtm09c6L7u2TcNUiB3GnDLLtS1US6Zrakl6F6R1Wx+k2XLrcUug5VZa0IkAVUipxYFucIxU+lyW0E+fc/3K5pg253csKmUqt7RXFxdvXxwX95FIFfNwCjXHWKNA7pqXU+lyjDRu1pPfz58tPE6ZTeWy5cA4cNNesasZkQkAy8Az4OrEWirWw7LeXWP3WymPOLz/NeGQx095vOwPHaNhoetMhYVp/6hkzrl9ByCEAuXBrjOpHiDdl0pHhtHuxO1RaHOLAMe5oYBCgAAVDfdGa9lJnbjSQSryKQCiU9J4YUmh450IXIAxShO5E2StL945e/P6vBmn2izToQTazjhTaSrd1N9Ym2maB2Ix7zE/dn2qFa8zjrmdD92QA+vrfvhDfX+R+eRMCuHhiTQuhV6FJBOCNSapzhpuycvAuQTrhFVpNUTJrF0QwSeZfBTRGAdIJAn/3cRtwS32x9fSz//6/yl5FnFyo6TSXDyRg0o78K4zCdavYiwk7CwRNxhBpVUSekGGHBfSB5IuWqe0B4XRBARNRzlnH89+AMT9TgIZBAAA
```

<!-- ARTIFACT corrections.json gzip-base64 -->
```text
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
```

<!-- ARTIFACT replay_certificates.py gzip-base64 -->
```text
H4sIAAAAAAAC/8VW3W/bNhB/11/BBRgoxbITu8AeHOihA9JhWLGmdfekCgYtUTETidSOVGKn6P++O0ryV5Y2DwMGBI54vI/f8X53ZAmmZrmpa6OZqhsDjp0HJQlLELlTRttB/q4XBP3aqVrGIK1pIZeBdQJcQrIJ+jLOaJWHUdDtJuHigovWrQ2MHySocrvMJThVqlw4aSfNlkcTkKJYOrlxe7PuH+40lchleEZuDgzHtdCqlNZN7qzRPDqLzw4CfU8x2vsshBOET2oH25SXqpI869GstoguJL+DVjh456NjgxOLV6fgj4M+8WR7dJNHUE52R0GSSdHWjQ3xqNvK2VjpAkMns2jEv3zpsm5adxf+wG3c2xM2YS3qMn4QiTMsGlOadYCZ0MVu3yd1ohDIjcxDZE6D+YedLOaErZEe4NinvB2bcnxYeSWBx5yMeRR/5cslnd9yyefWAZ1NZ/WcHjGnJPmcfr9FQSFL9jcIfR/WwoHaRPOAiSRNB5KGm4iVBtiGEIN5zPwKP2jdmWRXkFwGXn7ntYS+lWEldSjSSywoemQq0VSFUHk1tVeD2CtGEVMlE6nK0rssiv80WkZkVpKuZbSe50Y7pVuJcpFCFpN2Qj8xLVF66no0HZwThIMAfsnypF9ekD3+v/Ie0804P992ScdbcvekmnAXJ6JIMEqmHTxIki7GfIW8vQ8YSNcCQgiUzhXWL5cWT6cR+b10iWdhZURhQ6rRB1C3Sovqxu8OrD3o3yggGL5BCEjnJT0k6PVDF4RnKR+ak1OC+UmwHzVcHxBrmacceHZldPKGMsTlPdKRZ0nC3RqkHNt2ZREKUVlWVjIYz54pPppnaiGchzCeRhcXv/iT+/nNT8ls2BpNI9qd0W7UkUnFK0pa6raWgKmGGKB3mPmK9t3X0XcVJQna9zTwdEV94oxQusaUrx9E1fo+vjFKO3SCJR2hTmHaVSX3wnOj56EiQEZ3VDkKlCL5R+kG+dL1wl3cd8Me6CrKdmjYngc70qgkufSOyf5pgNrCg6qUlgJ4z9B/ifuU8oaQ8uzVAF5wUyiQvsVf52rqXR0n8/xSEjjn1rV0Kl/ma5nfv/5GuhFuHQ5TLJo0ArBm6HfnEOdgLlXjvj/cTeteHuwvOYvR6v8b53tU/8VA7xNLvnI/nalb5rNZzGtTtJWAG8CXBZ9PL6cxB98Novp9V1Q+3xc45kYv+hbea3zAy+cjn3+GFtPaI78RCtD6ZL69XLzDkYPUJ6pg78W8O7BFbhoEyd/iAeGR+WQLJiBfqwf8GO4/X4x9DLaWVYPSg8OutjiPodVXbMj1gMFMFIXqpKjnMaDzR3TH5AZvv91DDWeUqnFO03eM5Wa3UlNz0IzyTzhZTNjnNd5T+Eelb90QTfbjOfYseS8FDnEwpmRoi7mxVq9Mi1ALZhEAVkjChFhQicbKYiFxfhV4rkBK4emjcOzfivEMKVCLzSdr/1C/om7/kpzcSgetFXQTDqJPfy3e/na9XFy/f4c1aJdoBtZ+C7r2OGTpEc2Om6VfRVcN4CA6fll1O1HwD4btgloPCwAA
```

<!-- ARTIFACT immutable.py gzip-base64 -->
```text
H4sIAAAAAAAC/81X3W/bNhB/919B5IVSZyvb2xDAD26abMG6tEizvgSGQEvnmKgsCiTVxBj6v++OHxLlpBmQbcD0IJHUHe93H7w7npyc3IComd0Bk/t9b8WmASb6WlpmNQB7kHanessqDcLK9p4JpqFTRlqlD8y0ojM7ZYuTk5OZ3HdKW7Zt98JWuzj1n0ZuCrGpni72VjbDqppttdqzTtgd/gtU7CNOI4npN51WFRgzrBzMLI6Vmd1cfPzAlo4nU6aA9qvUqi3uwWb8dvXH+cXtVUk0fM6M1RnRFdVDneX4zN6uPl0g8zHf9Xn5efX+6t3q9qIkEuR1jFlZbmUDZZkXGoxqvkKWF53Q0Fp2ynjXbxpZodVUu9gIA4V9tJxIRV1aeLRIjBBkh7Jntzer898u3qFwgxJHLYtqB9WXEj3Q9Ta74/fSonTemAV5h4YL7d6LVuxhodrmgFMCuZ4z1GtJus4ZiVve6h5QZNdItHwLhuSer85/JZX//IaWW737FADksw83V79cXa/e0z/a+oyhKYQNJpszWsvZVmk3YrJlGR80I0RusjlYMDSDR2msG0njjBaGtXTw7xu1cUxxoDpo6fugpYVhTz/zm+bfZrMathiNDZoYTU9Rk5/NGD5WH/yAHg22163zNpEkroqspVUZ2Wn8hZYhVnisoLPss2h6uNBa6Se7XqsWPI4NIs++wCFAkFuGE9YqS7YJ7k3YhTTALtEQ18peqr6t3f5uA0fkvFGIuh6Xpls6z40buukd/l+TC/8ufvDMPoQ4YT8wfsbxTbxjzHiRQctx82jzGMKdCwZoK1VjcliSOXBKqhg3CdYg3MsjV6U6SeMs+cS8MQrvkthaHwuNg0Gw/0w0GLxT1IDUkGW8t9vFz5wQxA1cFHsVeKMqgVGaM2jQUZEijzIYBj6n01vhkU6M4mIzDcXvav68hj62vYr5kXU8lEETLzUcp9eJjGfxJXluYYjgQSge3FfLpEP/kkjRHjKDuVFoa6j+kLqF9rmSn6JPMGTpQ9nHJOBy8opDsmS84B6rzzyvwxqy1ktYJ/Yn+altPALKaSFm8W1Bt3MUVfXaoPjlpcBtXntMDhKamrmimQSSS6LEM0jxWH2aXU+x5Ednzk07DVv5iFg4j7K9TYeYeOoPx0guqURby1pYVxUM1mWos+ihETpuS5lsIE797cUnxPRUqsUGpIdh0QrZIMRhh7sG2oF1nQoKLUkRvhlxjgbAeKtZNtqKjvYpj3mWaI+QeKu7TuN0FO+dTYWrJAMHK+8x2Sw5FblNv92CpoS1+OmllIm1FR6oQP+7CdRV1HWCKkE0wolIBhCDFGKJNsmcQlxveH5c0j6C3ktjsOfxBY0nvSSCpCTnu5TJkZOqeEuZ7+pDNuS3fJBKoYeywoFTxSdLoFPa/yKrh9M7diDBdm+Evkf7vHnz5YFGY72feoe0JXMdueUfGGn0ZdIVrb+DKgU/FqX/Efq00j0Hv2qEMey9EjXobHKJKPxigE5qlqVspS3LzECznbOxC6OH1gp/fvA98LgLDZQYYD2mb89oOqjy53u8yAaPUE2Z/CRh8wtFvBxQP4a9Z0gXEc2YdmnHrFL7jsqIi+iBZn68l+ukoeLpnxqjFa8g0WKXsn1qsd+xd6e+3f9MLLfFhZLUDsps+6ahht5lx13IR5iYsflP09GYkripsAxYc0otZOSmglB0B57mYCoeIX0MZJR4p/3FNNHG7DC5LRYEt6SaVzY+OkbQIVxc+gitSot1pWmyADxeWEjTtqKrGQm/m95dhjGaOZteZMaJ+zdca/zArY0XnDCKq/6u4wduLVx26OMlhYVG7De1YJMyffZsG+GudI43XJiG8uMWJ7encZL8i3ols3ydnp3jO99oOB/BeP0u9kjlhBZobdA2+3EewxDd8BcLcb8wYxAAAA==
```

<!-- ARTIFACT base.txt gzip-base64 -->
```text
H4sIAAAAAAAC/wXBwRHAMAgDsH/GKRiHcXoY7z9CpLFxNwV0ZBHC2gMyVdED/cX4ts8DUO7klikAAAA=
```

<!-- ARTIFACT publication-base.txt gzip-base64 -->
```text
H4sIAAAAAAAC/wXBSQEAIAwDsD9qdgCdnpbNvwSSewA6baTtnENNFop6EaNMoWDRvT7XQQ8iKQAAAA==
```

<!-- ARTIFACT common.py gzip-base64 -->
```text
H4sIAAAAAAAC/4VT0U7bMBR9z1f4zQlJg4Q2HjpZAtaAOiGoKPDCUOTGt8Rdalu+DpS/33VaoGib9mZf33OO7zn20ts1czK0nV4wvXbWBzajbbJbY79w3jaAWKzQmqKVGFsLD8VCIhx/KSwmcxEhaV0vdQd1nZUe0HbPkGalkx5MSG6q2fW2yWIJ5ll7ax747end9+p2WsdT/rgHS85O55VI54c8ipRhE3g8laoOsAlEi8FrR30304ngF2DA62Zi+0UHM6tNmJoA3tlOBm0NT35cnwl+U92PJtV8enE1+i9AwZIp/QQY0kU29hB6b9hu9BJbefT1mA7KFja7rmyAYGtf0mjm4I2IQ7yjP4wsmxaaX7Xtg+tD+sCfdOAFj1g+4HI+5nlkeSyaFyWiOVv6aMDqX/wxnbKzUmH6+RrZFhy1jFxDEbJxwpyYH8bdN4kIFLMrNdYe4vzPUAebzjNpFAuUlcIXTbnxn4ZnCdPEVMJGY8A0EjHbKeH2s6EaNcWyCLvLUakV/ODggN05JQOwc3onY8ZzijF1WU7cJyfEn3NeriiOlI94vollvrSebZg2kbBE1+nQaQOkTTrQIYx3xKdK/YWVJ/FtN7ueM3giolksRLH2Qy7/Qy58FssHgooseYMn+4n63lCQ0rnutR4E+WOhDVkuhl0RnRG3vodiyH67xKDoDYg9mkl1f3V3eUmjvceyZyz5+ZbkahulzcbvsQ75q37tMLUFGOw91BIbrcW5JJ/oOoo+ojja+pIlvwHXCrGN+QMAAA==
```

<!-- ARTIFACT validate_review.py gzip-base64 -->
```text
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
```
