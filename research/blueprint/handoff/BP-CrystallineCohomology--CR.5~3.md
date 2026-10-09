# Handoff: crystalline blueprint revision 3

Completed target-level revision for issue **#7557**, job
**BP-CrystallineCohomology--CR.5~3**, by **Codex — codex-P0tL2J**,
9 October 2026. This is a complete planning pass, with implementation status
**unchecked**. All four stages are **planned**; none is closed.

The deliverables are the [packet](../packets/CrystallineCohomology--CR.5.json),
[reader](../readmes/CrystallineCohomology--CR.5.md) and
[suggested signatures](../suggested/CrystallineCohomology--CR.5.lean).
The full [revision-2 review](../reviews/REV-CrystallineCohomology--CR.5~2.md)
and its 88 checked rows were read. Its entire packet review object, verdict,
author and date remain unchanged. Earlier review history and the prior
revision audit are retained as provenance. A fresh independent review must
assess these repairs; this author has assigned no acceptance verdict.

## Inventory and repairs

All **88 node IDs** and **19 planets** are retained: **22 definitions,
33 constructions, 27 theorems and 6 comparisons**. The 55 definitions and
constructions have **165 API items and 167 tests**. Two tests were added;
the suggested file also retains five supplementary examples. There are
**32 baseline declarations**, **18 source versions**, **four inherited gaps**
and **nine owner requests**. The four independently confirmed source issues
E7051–E7054 are unchanged.

- **R1 checked and retained:** fine integralized base change and fs
  Kummer-étale base change remain separate. The latter retains both Kummerness
  and log étaleness, with the fs product. Kato §§2.7–2.8, p.199, §3.3, p.201,
  §4.6, p.209 and Temkin §1.2.7, p.100 / Theorem 4.2.1, Step 10, p.123
  were checked.
- **R2 repaired:** the full crystalline site has no affine-ambient condition.
  Its module-sheaf crystal evaluation uses the actual ambient small étale
  site; the cartesian map is the native adjoint of the restricted sheaf map.
  PD-diagonal stratification uses the seven geometric sheaf pullback functors.
  Connections and de Rham terms use sheafified module tensors. Quasi-nilpotence
  is stalkwise: the Taylor bound depends on the coordinate frame and section
  germ. The stalk operators contract the connection against the dual
  differential basis; ordinary powers and logarithmic falling factorials are
  explicit. The equivalence and Poincaré complex consume the same crystal
  evaluation. The new P1/F_p Cartier-connection test on O(p) distinguishes the
  zero tensor of sections from nonzero sections of O(p−2). Affine coordinate
  calculations and global finite projectivity retain their explicit scope.
- **R3 checked and retained:** the excluded support-factorization functor must
  preserve bounded-below objects. Support is still imposed on the analytic
  tube before derived specialization, and its comparison remains a natural
  map. Disegni–Liu Appendix B.1, Definition B.1 and Remark B.2, PDF p.113
  were reread.
- **R4 repaired:** the admissible degree-zero lift has its actual W[t] map,
  W-smoothness, W[t]-flatness, and smoothness over Frac(W[t]). Its actual t=0
  fibre is identified over the ambient scheme with a relative SNC closed
  divisor over W, and its log structure with exactly that divisor log.
  The actual k-log fibre and embedding are identified. Higher levels are
  coherently identified with the Grosse-Klönne system induced from this lift.
  The q+1 ordinary-to-log form cokernel, analytic realization, specialization
  and supported residue comparison all use that same system. R09.7a retains
  ordinary boundary ownership; RD Part II retains analytic machinery.
- **R5 repaired:** geometric rational coefficients are CR.5/CR.7-owned.
  They are compatible completed finite locally free crystals, with K0⊗_W Hom
  and bilinear composition for explicit p-inversion. Their actual model PD
  evaluations use M/p inside M/p^(n+1), including ramified O-models, over
  trivial-log Witt PD bases. Reduction and morphism squares are coherent.
  Frobenius and model pullback are levelwise crystalline operations.
  Generic algebraic de Rham realization requires specified compatible
  algebraization data; arbitrary formal data on a nonproper model are not
  asserted to algebraize. Filtrations are native submodule sheaves with local
  complements and sheafwise Griffiths transversality. Model pullback has the
  crystal, Frobenius, monodromy, de Rham, horizontal and filtration squares.
  The Euler-sequence test on P1 distinguishes local splitting from a global
  complement. Nφ=pφN, φ on a twist by r scaled by p^(−r), and the i+r
  filtration shift remain unchanged. R06.2 supplies these period conventions.

Twelve existing cards changed; no new roadmap node was introduced. The reader
and packet agree on every statement, API and named test. De Jong's locator
3.2.1 is corrected to **Proposition**, rather than Theorem; it supplies the
nilpotent-PD deformation framework, not arbitrary algebraization.

## Remaining acceptance work

| Stage | Status | Required work |
| --- | --- | --- |
| CrystallineCohomology:CR.5:log-algebra | planned | Obtain the full fs Abhyankar descent and local log-smooth/log-regular proof, nonnoetherian boundary approximation chain, and SNC/tame supplier exports. |
| CrystallineCohomology:CR.5 | planned | Supply CR.0 PD-envelope/canonical-base exports, DD.1 enhanced countable derived limits and the complete O_C/A_cris lift proof chain; apply the proposed quasi-coherent substage through restructuring. |
| CrystallineCohomology:CR.6 | planned | Supply CR.4 log Witt/Sato objects, RD Part II analytic/topological exports and the geometric Tate valuation/sign calculation. |
| CrystallineCohomology:CR.7 | planned | Supply R07.2 crystalline Dieudonné/Messing maps and CR.3 degreewise projectivity/base-change criteria, then construct the proposed geometric coefficient adapters. |

The four inherited gaps are unchanged:

1. The complete logarithmic Abhyankar/fs descent proof and the local
   log-smooth/log-regular completed-ring proof. Thompson Theorem 3.14, p.32,
   refers to Kato, Toric singularities, Theorem 8.2; that proof remains
   unobtained.
2. A public geometric Tate-curve monodromy proof identifying the coefficient
   v_K(q) in the chosen oriented basis. The rank-two matrix test is a
   normalization check and does not close the geometric proof.
3. The complete non-fine O_C formal-boundary and period-base approximation
   chain beyond the read finite-model statements, including the cited
   Koshikawa/Ogus inputs. Arbitrary non-fine log regularity is not asserted.
4. DD.1's generic coherent countable derived-limit export, with projections,
   Roos/Milnor comparison and transition-surjective resolutions. Its existing
   derived-completion localization is not that general functor.

The nine requests remain with their sole owners: **R09.7a** for ordinary SNC
boundary charts and the actual relative closed divisor; **LPV.5** for tame
Abhyankar input; **AI.0:integral** for tilt/sharp/Teichmüller;
**R06.1** for arithmetic coefficients, unit logarithm and Galois action;
**RD.4 Part II** for log tube/support/weak-formal foundations and realization
of the same residue embedding system; **RD.5 Part II** for continuous limits,
completed tensors and semilinear transport; **R07.2** for Dieudonné/Messing;
**R06.2** for filtered (φ,N) period normalization; and **DD.1** for generic
derived limits. R09.7a and RD.4 now also list the residue-variant consumer.
Exact exports and consumers are in the packet.

RT-AREA-padic-2/14 remains represented by the Beilinson integral
quasi-coherent branch, proposed **CR.5:qc-crystalline**, and required **AI.6**
dependency. Common A_cris remains CR.0-owned. The proposed RD Part II builds
on the existing AdicSpaces / AdicSpacesPartII objects. No supplier packet,
atlas data, upstream roadmap or links were edited. RS-01 has an accepted
older review but its latest review dated 7 October is pending; this revision
uses the currently integrated scope.

## Sources and validation

This run reacquired **eight public versions**, all matching their inherited
SHA-256 values. Focused reading is recorded separately in revision3ReadSections:
Kato §§6.1–6.9, pp.218–221 (with PD-diagonal/Taylor proof pages visually read);
Beilinson §1.7, pp.8–11 and Theorem 1.8, pp.11–12; Disegni–Liu Appendix
B.1–B.2, PDF pp.113–118; Grosse-Klönne §§5.1–5.2, pp.26–27; Sato Definition
8.3 and Propositions 8.4/8.6, pp.211–213; de Jong §§2.2.1–2.3.4, pp.18–22
and Proposition 3.2.1, pp.32–34; the R1 Temkin locators above; and Hyodo–Kato
§§5.1–5.2, pp.262–263 for comparison context. DL's higher residue-embedding
reference is Grosse-Klönne, not the Hyodo–Kato comparison passage.
The other ten source versions retain their prior reading/hash provenance
without a new verification claim. Public URLs and exact hashes are in the
reader ledger and packet. All repository source descriptions are in the
plan's own words; no source files, passages or section summaries were added.
No restricted source was used.

The pinned baseline remains Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174**
and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. This run read seven
additional native declarations: module sheaves, pullback, sheafification,
scalar restriction, submodule sheaves, Proj and the polynomial graded algebra.
The prior 25 baseline audits are preserved. The reviewed coverage file has no
CR stage entries; this is not treated as an absence proof. The integrated
four-stage contracts, all 88 inherited targets/direct inputs and exact EDS E1
suppliers were checked. Upstream AdicSpaces and SemisimpleAlgebras were read
for interface and document style.

Validation:

- Packet checker: **0 errors, 0 warnings**; four planned stages, none closed.
- Final suggested-file check: **lean-check exited 0**, with only placeholder-proof warnings, in the existing pinned Mathlib build. This certifies elaboration only. The Tau Ceti nilpotent exponential wrapper is unbuilt in that environment; its underlying native Mathlib operation is used, as in revision 2.
- Inventory/preservation audit: all 88 primary names and 165 APIs occur in the
  suggested file; all 167 named tests occur once, plus five supplementary
  examples. All 88 reader statements, 165 APIs and 167 tests agree with the
  packet. Node IDs, planets, review/history, four confirmed source issues and
  the four inherited gaps are unchanged.
- Only the four authorized deliverables changed; JSON and **git diff --check**
  pass. No build/update/cache command or Lean language server was used.
  Each sequential compile began with more than 20 GB available memory.

The next step is independent review of the R2/R4/R5 repairs and retained
R1/R3 corrections. Subsequent implementation work follows the precise
coverage, gap and request endpoints above. No scratch file is required to
resume.
