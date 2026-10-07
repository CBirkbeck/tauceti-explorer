# BP-ModularityAndLanglandsExtensions — checkpoint 3: pass complete (Claude, claude-okz2gt)

Claude (Claude Code agent), session `claude-okz2gt`, 7 October 2026. Refs #1033; the bot confirmed the claim (comment
6036376673). **Status: complete** — every stage in scope is `planned`, so the packet goes to its independent review.
Checkpoints 1–2 (cc-39fac3) are kept below this section.

## What this checkpoint does

**Breadth first.** ML.1, ML.4 and ML.5 had no nodes; ML.0, ML.2 and ML.3 lacked the maintainer's routed sources. All six
stages are now planned at target level: every target of each stage is a node whose prerequisite chains end in the
pinned libraries, another roadmap's node, a requested stage, or a recorded gap.

| Stage | Nodes | Status | Planets |
|---|---|---|---|
| ML.0 endpoint and normalisation registry | 13 | planned | Endpoint and normalisation register |
| ML.1 weight one and broader modularity | 8 | planned | Strong Artin conjecture; Irregular compatible systems come from weight one; Modularity over imaginary quadratic fields |
| ML.2 potential automorphy assembly | 32 | planned | Change of weight and level; Potential automorphy theorem (BLGGT); Potential automorphy of compatible systems; Meromorphic continuation of compatible-system L-functions; Potentially diagonalizable reps lie in compatible systems; Residual potential automorphy (Qian) |
| ML.3 symmetric powers and Sato–Tate | 48 | planned | Symmetric power functoriality in level one; … for non-CM forms; Sato–Tate over ℚ; Symmetric powers of Hilbert modular forms; Sato–Tate over CM fields; Ramanujan for Bianchi forms |
| ML.4 classical-group classification | 27 | planned | Global Arthur parameter; Local Arthur packets; Arthur's multiplicity formula; Mok's classification; LLC for GSp₄; Arthur's classification for GSp₄ |
| ML.5 known transfers and frontiers | 10 | planned | Cyclic base change for GL_n; Generic transfer from classical groups; GRS descent; Langlands functoriality; Categorical local Langlands |

Totals: 138 nodes (107 new, 17 retired), 134 API items, 95 unit tests, 27 planets, 38 sources, 37 requests, 8 gaps,
14 source issues (8 new).

**Duplicates retired (PROTOCOL §15).** Seventeen checkpoint-1/2 nodes planned exactly what other roadmaps plan; they are
removed and every reference is rewritten to the owner's node (no other packet referenced them):
- ML.2 polarized-galois-representation → AG2.0/polarized-galois-representation; adequate-subgroup, ghtt-adequacy-criterion →
  ArithmeticGaloisRepresentations G7/adequate-subgroup, G7/adequacy-criteria;
- ML.2 iota-ordinary, automorphic-galois-representation, automorphy-twist-and-soluble-base-change, automorphy-descends-from-
  induction → PotentialAutomorphyInfrastructurePartII PL.0 nodes; connects-relation, potentially-diagonalizable,
  potential-diagonalizability-criteria → PL.1; minimal/ordinary-automorphy-lifting → PL.4; dwork-potential-ordinary-
  automorphy, ordinary-lifts-with-local-conditions, preliminary-pd-automorphy-lifting, pd-automorphy-lifting → PL.5;
- ML.3 reducible-deformation-finiteness → PL.7/sum-of-characters-finiteness.
This follows the PL packet's own rescope entry and the Newton–Thorne/Clozel–Thorne extraction reviews ("route 5").

**Routed sources.** Every routed item of the issue is planned (or imported) — the table at the end maps each item to its node.
Sources read (all with excerpts checked against the text layer, NFKC, whitespace stripped): BCGP 2021 (arXiv v3) and 2025,
Calegari–Geraghty 2018 (arXiv v2) and 2020 (Duke copy + arXiv v1), Pilloni 2020 (author copy), Gan–Takeda (arXiv v4),
Gee–Taïbi, Gan–Savin 2023 and G₂ (Forum Pi), AGIKMS (arXiv v3), Arthur's 2011 book manuscript (Wayback copy of the Clay PDF),
Mok (arXiv v5), KMSW (arXiv v3), Gan–Ichino (arXiv v3), Jiang–Zhang (arXiv v4), KSS (arXiv v3), Chenevier–Taïbi (open
access), Ichino–Prasanna (arXiv v2), ACC+ (arXiv v2), Qian (arXiv v1 + Stanford thesis for the published wording), FKP
(arXiv:2008.12593v5 — the issue's arXiv number was wrong), Fresán–Sabbah–Yu (v5), Clozel–Thorne III (Cambridge accepted
manuscript), BCGNT (arXiv v3), Newton–Thorne I, II, 2026, Khare–Wintenberger I (author copy), BCG 2025, CKPSS (Numdam),
Gelbart–Jacquet (Numdam), Kim 2003 (AMS), Kim–Shahidi (arXiv math/0409607), Ramakrishnan (arXiv), Arthur 2003, Buzzard–Gee,
Fargues–Scholze (v4), Caraiani–Newton (v3).
Not available: Khare IMRN 1997 and corrigendum, Langlands 1970/1980 (IAS archive blocks curl), Arthur–Clozel 1989,
Henniart 2009, Kim–Shahidi Duke 2002, Dummigan–Martin–Watkins 2009, Pilloni–Stroh (Astérisque 382), Xu's papers,
Mœglin–Renard, Schmidt 2017/2018, Blasius–Harris–Ramakrishnan — their statements are taken as quoted (recorded in gaps).

## Red-team findings handed to this job

- **RT-AREA-langlands-1/7 (CM-field automorphy lifting).** The ACC+ Theorems 6.1.1/6.1.2 are requested from
  PotentialAutomorphyInfrastructure PA.4 with the exact statements, needed by 7 nodes (Qian, BCGNT, Caraiani–Newton,
  Calegari–Geraghty); the packet's `restructure` proposes the layer PA.6 (or the PA.4 edges) as the finding asks. ML.2 now
  also cites PA.2 and PotentialAutomorphyInfrastructurePartII PL.0/PL.4/PL.5.
- **RT-AREA-langlands-2/8 (ML.1 vs R19.1/R27.6).** ML.1 is narrowed: the Deligne–Serre representation (R19.1/weight-one-
  artin-representation), Langlands–Tunnell (R17.5/solvable-artin), the strong Serre theorem, Khare's weight-one descent and
  KW Corollary 10.2(ii) (R27.6/full-classical-serre-theorem, …/weight-one-descent-from-infinitely-many-primes,
  …/odd-artin-weight-one-modularity) are imported, not constructed. ML.1 keeps KW Theorem 10.1(ii) (no other owner; R27.6
  says so) and the totally real/CM extensions. The finding's links R19.1 → ML.1, R17.5 → ML.1, R27.6 → ML.1 follow from the
  node prerequisites.
- **RT-AREA-langlands-3/1 (Arthur's classification has no constructive owner).** Option (b) is implemented: ML.4 states the
  classification with its conditional status on every node (ML.0/arthur-dependency-gate: after Mœglin–Waldspurger and
  AGIKMS only the twisted weighted fundamental lemma remains), the trace-formula inputs are registered with owners
  (ML.4/trace-formula-inputs-register), the symplectic branch has a named verification task (ML.4/symplectic-branch-status),
  and the proofs are a recorded gap. Option (a) — a Part II of EndoscopicTransferAndUnitaryTraceComparison owning the
  construction — is proposed in `restructure`.

## Structural notes for the maintainer

- The low-degree GL₂ transfers (Gelbart–Jacquet, Kim–Shahidi, Kim/Henniart, Ramakrishnan) routed to ML.5 by the NT26
  extraction are inputs of ML.3's endpoints; since ML.3 does not require ML.5 (and ML.5 → ML.3 would close a cycle), they
  are planned in ML.3 and registered from ML.5 (third `restructure` entry).
- ML.3/steinberg-level-raising (Newton–Thorne I Theorem 7.1) uses Mok's and KMSW's unitary classification, which ML.4
  now states; since the atlas has no edge ML.4 → ML.3, the node cites ET.7a and the dependency is a recorded gap, with
  the (acyclic) stage edge ML.4 → ML.3 proposed in `restructure`.
- Same-roadmap cross-layer edges induced by node prerequisites (promotion does not draw them): ML.0 → ML.1–ML.5,
  ML.1 → ML.5, ML.2 → ML.3, ML.3 → ML.5, ML.4 → ML.5. All follow the atlas's stage order; none goes against it.
- Stage-cycle check (own script: atlas requires and stageEdges plus the induced edges of every packet, Tarjan): the atlas
  already has an 807-stage strongly connected component containing ML.4 (through AG2.6's and MP.0's requests to ML.4).
  With this packet ML.0 joins it, exactly as with the previous packet (ML.0's normalisation register depends on AG2.0/AG2.2,
  which are in the component); this checkpoint adds no stage to it.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularityAndLanglandsExtensions.json --index <pinned
  declarations.tsv>`: 0 errors, 0 warnings.
- Every excerpt was checked by script against the downloaded text layers.
- `research/blueprint/intake.py check-files` on the four changed paths: 0 problems.
- Suggested file `research/blueprint/suggested/ModularityAndLanglandsExtensions.lean` (7,557 lines) rewritten in
  Suggested.lean form: the standard note; an explicit supplier interface `TauCeti.Langlands.Context` and per-layer
  context structures whose fields name their owner stages; every definition, API item and unit test of the packet as a
  named declaration (341/341 names, checked by script), the named theorems with their hypotheses, conjectures as
  `def … : Prop` never asserted, Arthur-dependent theorems taking the twisted weighted fundamental lemma as an explicit
  hypothesis, and the nine checked combinatorial examples of checkpoints 1–2. It imports 35 individual Mathlib modules
  and **elaborates against Mathlib 082e2d3 with `lean-check` (lake env lean in the shared build): 0 errors, and the only
  warnings are 254 `declaration uses 'sorry'`.** No `True` placeholder and no `def … : Prop := sorry`.

## Corrections found by prototyping the Lean file (applied to the packet)

The Lean agents reported statements that were false or ill-posed as written; each is corrected in the packet, reader and
file:
- `ML.3/symmetric-power-lifting` test `cm_not_cuspidal` (checkpoint 2) and `ML.3/functorial-lift`: Sym²(AI θ) =
  AI(θ²) ⊞ θ|_{𝔸^×}; the η_K factor belongs to Ad(π), not Sym²π.
- `ML.5/cyclic-base-change-gln`: cuspidal unless π ≅ π ⊗ η for a *non-trivial* η; `ML.5/ckpss-generic-transfer`: SO_{2n}
  needs n ≥ 2; Kim and Kim–Shahidi's local compatibility above 2 and 3 is stated as in the sources.
- `ML.0/gsp4-galois-l-packet`: the twist uses q^{3/2} (q the residue cardinality), and "exactly one generic member" needs a
  tempered parameter; `ML.0/expected-crystallinity-newton-above-hodge`: (k, r) = (2, 1) is cohomological and k ≥ 0 is
  needed; `ML.0/nt26-automorphy-predicate`: comparison with BLGGT needs ρ irreducible.
- `ML.1/irregular-systems-weight-one`: finite image only after twisting to Hodge–Tate weights (0, 0);
  `ML.1/imaginary-quadratic-elliptic-modularity`: the CM case is an isobaric sum ψ ⊞ ψ^c.
- `ML.4/extended-langlands-parameter` (SO₂ up to the outer automorphism), `ML.4/self-dual-cuspidal-type` (CM curves
  too), `ML.4/arthur-multiplicity-formula` (ψ_v ∈ Ψ⁺_unit; m_ψ = 2 exactly when N is even, Ĝ = SO(N) and every N_i is even).
- `ML.2/twisted-modular-curve` test `not_X0` (the curves agree for q = 3, 5); `ML.3/bianchi-ramanujan` normalisation made
  explicit; a test name clash renamed (`SatoTateGroup.eq_SU2_of_elliptic`); `ML.2/potential-ordinary-automorphy` now
  introduces ı_i; `SymPowerLift.lFunction` restricted to the finite L-function and n ≥ 2.
Unstated inputs that the sources only cite (the parity list of Qian's Proposition 4.1, BCGNT's hypotheses (1)–(8),
Clozel–Thorne 7.1/7.4/7.6, Mœglin–Renard's case (I), the integer d_i of BLGGT §4) are supplier fields in the file, marked
`-- NOTE:`.

## What a follow-up (the review, then the Part II design) should do

1. Review: check the retirements against PotentialAutomorphyInfrastructurePartII and the routed-item table below.
2. Read the unavailable sources listed above and replace the quoted statements by first-hand excerpts (Pilloni–Stroh,
   Khare 1997, DMW09, Arthur–Clozel, Xu, Mœglin–Renard, Schmidt, BHR, Henniart).
3. The proposed Part IIs (Dwork motives, open image theorems, Conjecture B, the Newton–Thorne methods, Endoscopic
   classification) are where the recorded gaps go.

## Routed items → nodes

| Routed item | Planned in |
|---|---|
| PAPER-ALLEN-ETAL-23/15 | ML.0/archimedean-langlands-conventions |
| PAPER-ALLEN-ETAL-23/309 | ML.0/compatible-system-archimedean-factors |
| PAPER-ALLEN-ETAL-23/314 | ML.0/compatible-system-automorphic-l-function-comparison |
| PAPER-ALLEN-ETAL-23/317 | ML.3/acc-purity-rank-two |
| PAPER-ALLEN-ETAL-23/325 | ML.2/acc-symplectic-potential-automorphy |
| PAPER-ALLEN-ETAL-23/326 | ML.3/acc-elliptic-symmetric-powers |
| PAPER-ALLEN-ETAL-23/327 | ML.2/acc-auxiliary-primes |
| PAPER-BOXER-CALEGARI-GEE-25/ckpss-descent | ML.5/ckpss-generic-transfer |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/1 | ML.3/bianchi-ramanujan |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/106 | ML.2/potential-weak-automorphy-symmetric-powers (step of the proof) |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/107 | ML.5/cyclic-base-change-gln |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/108 | ML.3/sato-tate-group |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/109 | ML.3/serre-equidistribution-criterion |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/135 | imported: AL.3/strong-multiplicity-one, AL.3/rs-boundary-nonvanishing |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/136 | request to PotentialAutomorphyInfrastructure PA.4 (ACC+ Theorems 6.1.1–6.1.2), used by ML.3/bcgnt-potential-automorphy-det-cyclotomic |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/137 | ML.3/serre-equidistribution-criterion |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/138 | imported: Tau Ceti Chebotarev layer 10 |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/2 | ML.3/bianchi-sato-tate |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/3 | ML.3/bcgnt-symmetric-powers-purity |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/4 | ML.3/bcgnt-potential-automorphy-det-cyclotomic |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/5 | ML.3/parallel-weight-and-clozel-purity |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/6 | ML.3/bianchi-modular-forms |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/7 | ML.3/bianchi-fourier-ramanujan |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/8 | ML.3/bianchi-parabolic-cohomology-ramanujan |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/9 | ML.3/bianchi-mass-equidistribution |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/92 | ML.3/purity-from-symmetric-powers |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/93 | ML.3/purity-from-symmetric-powers (bound imported from AL.2/jacquet-shalika-satake-bound) |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/98 | ML.2/p-r-switch |
| PAPER-BOXER-CALEGARI-GEE-ETAL-25/99 | ML.2/potential-weak-automorphy-symmetric-powers |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/14 | ML.4/gan-takeda-llc-gsp4 |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/161 | ML.0/gsp4-galois-l-packet |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/186 | ML.4/shahidi-exterior-square |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/200 | ML.1/totally-real-odd-artin, ML.1/non-solvable-residual-modularity |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/206 | ML.4/gsp4-discrete-spectrum-types |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/207 | ML.4/non-general-type-reducible |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/32 | ML.4/gl4-symplectic-descent |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/33 | ML.0/arthur-dependency-gate |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21/336 | ML.3/kim-sym4 |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-25/1.6-arthur-gate | ML.0/arthur-dependency-gate |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-25/10.4.1 | ML.0/regular-weight-serre-implies-abelian-surface-modularity |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-25/10.4.2-large-primes | ML.0/regular-weight-serre-implies-abelian-surface-modularity |
| PAPER-CALEGARI-GERAGHTY-18/blght-thm-6-4 | ML.2/cg18-odd-symmetric-powers |
| PAPER-CALEGARI-GERAGHTY-18/buzzard-taylor-hypotheses-lem-4-14 | ML.1/buzzard-taylor-hypotheses |
| PAPER-CALEGARI-GERAGHTY-18/dwork-family | ML.2/cg18-odd-symmetric-powers (Dwork family cited; gap) |
| PAPER-CALEGARI-GERAGHTY-18/sec10-auxiliary-curve-lemma | ML.2/cg18-odd-symmetric-powers |
| PAPER-CALEGARI-GERAGHTY-18/sec10-dwork-point | ML.2/cg18-odd-symmetric-powers |
| PAPER-CALEGARI-GERAGHTY-18/sec10-general-case | ML.2/cg18-odd-symmetric-powers |
| PAPER-CALEGARI-GERAGHTY-18/sec10-special-case | ML.2/cg18-odd-symmetric-powers |
| PAPER-CALEGARI-GERAGHTY-18/thm-1-1-part-1 | ML.2/cg18-conditional-potential-modularity |
| PAPER-CALEGARI-GERAGHTY-18/thm-1-1-part-2 | ML.3/cg18-conditional-sato-tate |
| PAPER-CALEGARI-GERAGHTY-18/twisted-modular-curve-XEq | ML.2/twisted-modular-curve |
| PAPER-CALEGARI-GERAGHTY-20/archimedean-transfer-gsp4-gl4 | ML.4/gsp4-gl4-archimedean-transfer |
| PAPER-CALEGARI-GERAGHTY-20/conj-weight-22-abelian-varieties | ML.0/weight-22-abelian-variety-conjecture |
| PAPER-CALEGARI-GERAGHTY-20/ext-arthur-gsp4-classification | ML.4/gsp4-arthur-classification |
| PAPER-CALEGARI-GERAGHTY-20/ext-artin-conjecture-odd-2dim | ML.1/odd-artin-modularity-over-q |
| PAPER-CALEGARI-GERAGHTY-20/ext-mok-archimedean-packet | ML.4/gsp4-archimedean-limit-packets |
| PAPER-CALEGARI-GERAGHTY-20/ext-sorensen-transfer-infinitesimal-character | ML.4/gsp4-gl4-archimedean-transfer |
| PAPER-CALEGARI-GERAGHTY-20/unitary-descent-of-gl4-transfer | ML.4/unitary-descent-of-gl4-transfer |
| PAPER-CHENEVIER-TAIBI-20/amr18-adams-johnson | ML.4/adams-johnson-packets |
| PAPER-CHENEVIER-TAIBI-20/moeglin-renard | ML.4/moeglin-renard-packets |
| PAPER-CLOZEL-THORNE-17/001 | ML.3/symmetric-power-lift-over-number-fields |
| PAPER-CLOZEL-THORNE-17/050 | ML.3/sym6-sym8 |
| PAPER-CLOZEL-THORNE-17/051 | ML.3/clozel-thorne-reductions |
| PAPER-CLOZEL-THORNE-17/052 | ML.3/symmetric-powers-up-to-eight |
| PAPER-CLOZEL-THORNE-17/053 | ML.3/clozel-thorne-reductions |
| PAPER-CLOZEL-THORNE-17/054 | ML.3/large-residual-image-density-one |
| PAPER-CLOZEL-THORNE-17/055 | ML.3/large-residual-image-density-one |
| PAPER-CLOZEL-THORNE-17/056 | ML.3/clozel-thorne-reductions |
| PAPER-CLOZEL-THORNE-17/076 | ML.3/sym6-sym8 |
| PAPER-CLOZEL-THORNE-17/080 | ML.3/clozel-thorne-reductions |
| PAPER-CLOZEL-THORNE-17/081 | ML.3/clozel-thorne-reductions |
| PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22/68 | ML.2/potential-automorphy-with-steinberg-place |
| PAPER-FAKHRUDDIN-KHARE-PATRIKIS-22/69 | ML.2/compatible-system-from-potential-automorphy |
| PAPER-FRESAN-SABBAH-YU-22/58 | ML.2/patrikis-taylor-potential-automorphy |
| PAPER-FRESAN-SABBAH-YU-22/59 | ML.2/patrikis-taylor-l-function-consequences |
| PAPER-GAN-ICHINO-18/amf-nonsplit | ML.4/amf-nonsplit-so-v |
| PAPER-GAN-ICHINO-18/ckpss-lift | ML.5/ckpss-generic-transfer |
| PAPER-GAN-ICHINO-18/lemma-5-1 | ML.4/packet-member-irreducibility |
| PAPER-GAN-ICHINO-18/lemma-5-5 | ML.4/packet-member-irreducibility |
| PAPER-GAN-ICHINO-18/llc-so-inner | ML.4/vogan-packets-so-v |
| PAPER-GAN-ICHINO-18/local-descent | ML.5/local-descent-mp2n |
| PAPER-GAN-ICHINO-18/selfdual-types | ML.4/self-dual-cuspidal-type |
| PAPER-GAN-SAVIN-23/gsp4-llc | ML.4/gan-takeda-llc-gsp4 |
| PAPER-GAN-SAVIN-23-B/67 | ML.4/xu-gsp2n-packets |
| PAPER-GAN-SAVIN-23-B/68 | ML.4/xu-gsp2n-packets |
| PAPER-GAN-SAVIN-23-B/69 | ML.4/xu-gsp2n-packets |
| PAPER-GAN-SAVIN-23-B/70 | ML.4/xu-gsp2n-packets |
| PAPER-GAN-SAVIN-23-B/71 | ML.4/xu-gsp2n-packets |
| PAPER-GAN-SAVIN-23-B/72 | ML.4/xu-multiplicity-formula |
| PAPER-ICHINO-PRASANNA-23/101 | ML.4/adams-johnson-packets |
| PAPER-JIANG-ZHANG-20/grs-descent | ML.5/grs-descent |
| PAPER-JIANG-ZHANG-20/prop-b-1 | ML.4/generic-packets-standard-modules |
| PAPER-KHARE-WINTENBERGER-09-I/56 | ML.1/irregular-systems-weight-one |
| PAPER-KHARE-WINTENBERGER-09-I/59 | imported: ClassicalSerreModularity R27.6/weight-one-descent-from-infinitely-many-primes |
| PAPER-KHARE-WINTENBERGER-09-I/62 | ML.1/strong-artin-conjecture |
| PAPER-KHARE-WINTENBERGER-09-I/65 | ML.1/odd-artin-modularity-over-q (registers R27.6/odd-artin-weight-one-modularity) |
| PAPER-KURINCZUK-SKODLERACK-STEVENS-21/406 | ML.4/extended-langlands-parameter |
| PAPER-NEWTON-THORNE-21/1 | ML.3/level-one-symmetric-powers |
| PAPER-NEWTON-THORNE-21/2 | ML.3/non-supercuspidal-symmetric-powers |
| PAPER-NEWTON-THORNE-21/3 | ML.3/nt21-semistable-l-functions |
| PAPER-NEWTON-THORNE-21-B/1 | ML.3/non-cm-symmetric-powers |
| PAPER-NEWTON-THORNE-21-B/2 | ML.3/non-cm-symmetric-powers (Corollary B) |
| PAPER-NEWTON-THORNE-21-B/3 | ML.3/cm-and-weight-one-symmetric-powers |
| PAPER-NEWTON-THORNE-21-B/38 | ML.3/symmetric-power-lifting |
| PAPER-NEWTON-THORNE-21-B/45 | ML.3/completed-symmetric-power-l-function |
| PAPER-NEWTON-THORNE-21-B/46 | ML.3/gelbart-jacquet, ML.3/kim-shahidi-sym3, ML.3/kim-sym4, ML.3/ramakrishnan-tensor-product |
| PAPER-NEWTON-THORNE-26/automorphic-galois-predicate | ML.0/nt26-automorphy-predicate |
| PAPER-NEWTON-THORNE-26/base-change-and-soluble-descent | ML.5/cyclic-base-change-gln |
| PAPER-NEWTON-THORNE-26/cm-field-conjugate-self-dual-endpoint | ML.3/cm-field-symmetric-powers |
| PAPER-NEWTON-THORNE-26/ct14-ct17-reductions | ML.3/clozel-thorne-reductions |
| PAPER-NEWTON-THORNE-26/hilbert-symmetric-power-endpoint | ML.3/hilbert-symmetric-powers |
| PAPER-NEWTON-THORNE-26/low-rank-symmetric-powers | ML.3/low-rank-symmetric-powers (placed in ML.3 for the stage order) |
| PAPER-NEWTON-THORNE-26/normalisation-bridge | ML.0/nt26-normalisation-bridge |
| PAPER-NEWTON-THORNE-26/one-prime-transfer-criterion | ML.3/one-prime-criterion |
| PAPER-NEWTON-THORNE-26/sp-induction | ML.3/all-regular-symmetric-powers |
| PAPER-NEWTON-THORNE-26/sp-statement | ML.3/sp-statement |
| PAPER-PILLONI-20/arthur-classification-nongeneral-type-reducible | ML.4/non-general-type-reducible |
| PAPER-PILLONI-20/ext-arthur-classification-gsp4 | ML.4/gsp4-arthur-classification |
| PAPER-PILLONI-20/ext-bhr-archimedean-L-packet | ML.4/gsp4-archimedean-limit-packets |
| PAPER-PILLONI-20/ext-schmidt-packet-types-with-limit-of-discrete-series | ML.4/limit-discrete-series-packet-types |
| PAPER-PILLONI-20/remark-5-3-2-expected-newton-above-hodge | ML.0/expected-crystallinity-newton-above-hodge |
| PAPER-QIAN-23/009 | ML.2/qian-residual-potential-automorphy |
| PAPER-QIAN-23/010 | ML.2/qian-ordinary-potential-automorphy |
| PAPER-QIAN-23/073 | ML.2/qian-auxiliary-prime |
| PAPER-QIAN-23/074 | ML.2/qian-auxiliary-prime |
| PAPER-QIAN-23/075 | ML.2/elliptic-symmetric-power-seed |
| PAPER-QIAN-23/082 | ML.2/dwork-fibre-automorphy-transport |
| PAPER-QIAN-23/083 | ML.2/dwork-fibre-automorphy-transport |
| PAPER-QIAN-23/086 | ML.2/steinberg-ordinarity-lemma |
| PAPER-QIAN-23/087 | ML.2/steinberg-ordinarity-lemma |
| PAPER-QIAN-23/088 | ML.2/steinberg-ordinarity-lemma |
| PAPER-QIAN-23/090 | ML.2/galois-ordinarity-from-automorphic |

---

# BP-ModularityAndLanglandsExtensions — checkpoint 2 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #1033; the bot confirmed the claim (comment 5884987608). **Status: partial.**

## Checkpoint 2: ML.3 (symmetric powers and Sato–Tate)

**Sources.**
- Newton–Thorne I, arXiv:1912.11261v3 (sha 6d50b55…): the introduction and the theorem statements.
- Newton–Thorne II, arXiv:2009.07180v2 (sha 0f08214…): the introduction, Theorem 2.1 with its reductions, Theorem 3.1 and Theorem A.1.
- Kedlaya's notes, Chapter 24: text layer, and page images of pp. 134–135.

**Nodes (16).**
- `symmetric-power-lifting` (definition).
- `accessible-regular-refinement` (definition).
- NT I Theorem 2.33 (planet), Buzzard–Kilford, Theorem 3.1 (planet), Theorem 5.2, the level-raising package (Theorems 4.1, 6.1, 7.1), Theorems 7.6, 7.7 (planet), Proposition 8.3 and Theorem 8.1.
- NT II Theorem 2.1 (planet), Theorem A (planet) and Theorem A.1.
- The equidistribution criterion, and Sato–Tate for elliptic curves over ℚ (planet).

**Requests.**
- New: PadicFamilies L2 and AG2.3 (eigenvarieties), GL2AutomorphicRepresentationsAndTransfer R17.5 (weight one and CM), AnalyticNumberTheory AN.2 (the Tauberian theorem).
- Extended: AL.2 (entireness), AL.3 (Jacquet–Shalika nonvanishing), AG2.2.

**Gaps.** The Newton–Thorne proofs are recorded at statement level. ML.4's classification inputs are not planned.

**Findings (Kedlaya Chapter 24).**
- E4: the complex-multiplication definition is reversed.
- E5: Theorem 24.6 claims holomorphic continuation (only meromorphic was known before Newton–Thorne) and a wrong abscissa.
- E6: Conjecture 24.3's multiplicity condition is misprinted.

**Lean.** Three new checked examples:
- 577 is prime and ≡ 1 (mod 48·3!);
- ∫₀^π sin²θ dθ = π/2 (the Sato–Tate density has mass one);
- 2- versus 3-regularity for α/β = −1.

The suggested file compiles with 0 errors and 0 warnings.

**Checks.** `check_blueprint.py`: 0 errors, 0 warnings (48 nodes, 12 planets). `intake.py check-files`: 0 problems. Unit tests pass.

**Continue with:**
1. ML.4 (Arthur, Mok, KMSW), which unblocks ML.3's residual automorphy.
2. ML.1 (weight one).
3. Decompose NT I §2 (the infinitesimal R = T).

# BP-ModularityAndLanglandsExtensions — checkpoint 1 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #1033; the bot confirmed the claim (comment 5884639939). **Status: partial.** There was no earlier packet.

## What this checkpoint does

**Source.** BLGGT arXiv:1010.2561v4 (sha c953df6…, 93 pp.), read on the text layer:
- §1.4, §§2.1–2.4, the statements of §3, and the proofs of Propositions 3.1.1 and 3.2.1;
- Proposition 4.1.1 with its proof;
- §§4.2–4.5 and §§5.4–5.5.

It was compared with arXiv v1, which PM R24.3 cites. v4 renumbers §§2 and 5 and renames RAECSDC to "polarized"; `blggt-version-register` records the correspondence.

**Nodes (32).**
- ML.0 (2): the normalisation register and the version register.
- ML.2 (30):
  - 6 definitions with API and tests: polarized, adequate, ı-ordinary, connects, potentially diagonalizable, automorphic;
  - GHTT adequacy;
  - Lemma 1.4.3;
  - Lemmas 2.2.1–2.2.4;
  - Theorems 2.3.1 and 2.4.1;
  - Propositions 3.1.1, 3.2.1, 3.3.1, Theorem 3.1.2;
  - Proposition 4.1.1, Theorems 4.2.1, 4.3.1, 4.4.1, 4.5.1 and Corollaries 4.5.2–4.5.3;
  - Theorem 5.4.1 with Corollaries 5.4.2–5.4.4, Proposition 5.4.6, Theorems 5.5.1–5.5.3.

**Planets (ML.2, 6).**
- PD automorphy lifting;
- change of weight and level;
- the potential automorphy theorem;
- potential automorphy of compatible systems;
- meromorphic continuation of their L-functions;
- PD representations lie in compatible systems.

**Reused, not re-planned.**
- PM R24.5 (systems, predicates, L-functions, Grothendieck ring, residual irreducibility, constituents lemma) and PM R23.1 (Moret-Bailly).
- LGD R08.1 and R08.3 (lifting rings).
- GGD G7 (polarized deformation problems).
- FF R07.3 (Fontaine–Laffaille).

**Requests (5).**
- AG2.0 and AG2.2: polarized automorphic representations and r_{l,ı}(π).
- ET.7a: Arthur–Clozel base change and automorphic induction.
- AL.2: Godement–Jacquet.
- AL.3: the Rankin–Selberg pole.

**Gaps (4).**
- The Thorne 2012 lifting theorems.
- GHTT Theorem 9.
- The BLGHT11 Dwork family.
- Clozel, HSBT, Taylor and Caraiani citations.

**Source findings.** Checked against v1 as well; all misprints, affecting nothing:
- E1: µ for χ in the polarized-automorphic parity condition.
- E2: index and reference slips in §4.5.
- E3: Theorem 4.4.1 names π before it exists.

**Lean.** `suggested/ModularityAndLanglandsExtensions.lean` (new) imports Mathlib only. It contains signature sketches in a comment and 6 checked examples:
- the partial-sum condition of Corollary 5.4.4 for {1, 2, 4}, and its failure for {1, 2, 3};
- the n² regularity condition of Proposition 4.1.1, with a non-example;
- scalars in sl_3 over F₃;
- the non-polarizable Hodge–Tate set {0, 1, 5}.

It elaborates against Mathlib 082e2d3 with 0 errors and 0 warnings.

**Checks.** `check_blueprint.py`: 0 errors, 0 warnings. `intake.py check-files`: 0 problems. Unit tests pass.

## What a continuation should do

1. **ML.3.** Newton–Thorne, *Symmetric power functoriality for holomorphic modular forms* I and II (arXiv:1912.11261, 2009.07180) and the Hilbert case (2212.03595), using ML.2's potential automorphy and AL.2/AL.3.
2. **ML.1.** Deligne–Serre and weight one, importing GL2AutomorphicRepresentationsAndTransfer R17.5 per RS-21.
3. **ML.2.** Read BLGGT Appendix A and the ACC+ route (Allen–Calegari–Caraiani–Gee–Helm–Le Hung–Newton–Scholze–Taylor–Thorne §7).
4. **PM R24.5.** Pick up BLGGT v4 §5.2 (rational compatible systems), which is new relative to v1.
