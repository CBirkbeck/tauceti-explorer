# BP-ColemanIntegration — handoff

Blueprint for **Coleman integration and noncritical Dirichlet L-values** (`ColemanIntegration`),
layers L0–L3. There was no earlier packet, decomposition or draft for this roadmap, and none of
the supplier packets (LocallyAnalyticDistributions, DirichletPadicLFunctions) exists yet, so every
cross-roadmap input is a `requests` entry.

- Packet: `research/blueprint/packets/ColemanIntegration.json` — **112 nodes** (L0 23, L1 33,
  L2 26, L3 30; 18 definitions, 9 constructions, 45 lemmas, 30 theorems, 10 comparisons)
- Document: `research/blueprint/readmes/ColemanIntegration.md`
- Suggested Lean: `research/blueprint/suggested/ColemanIntegration.lean` (2580 lines)

229 API items, 117 unit tests, 22 planets (5, 6, 6, 5), 89 baseline declarations, 5 gaps,
19 requests, 15 restructuring proposals, 24 source issues, 14 sources.

## Checks run

- `scripts/check_blueprint.py --index <baseline declarations index>`: **0 errors, 0 warnings**.
- `scripts/check_errata.py` on the packet's `sourceIssues` and `sourceVersions`: ok.
- `research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- Own checks: no dangling prerequisite, no prerequisite on a later layer, no dependency cycle,
  every excerpt at most 300 characters, every test has a kind, planets only on definitions,
  constructions and theorems.
- **Lean: compiled.** `lean` v4.34.0-rc2 against Mathlib 082e2d3. Exit code 0, and the only
  messages are 270 `declaration uses 'sorry'` warnings. The file imports one Tau Ceti module,
  `TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic`, for `NormedSpace.logOneAdd`. The prebuilt
  Tau Ceti oleans I had are from another commit and lack that module, so I compiled that single
  file from the f790474 source (it imports only Mathlib) and put it on `LEAN_PATH`. Nothing else
  was built, and Mathlib was not rebuilt.
- Every definition, API item and unit test of the packet occurs in the Lean file under its packet
  name: as a declaration, an `example` with docstring "Test `name`", or a `-- name: not stated;
  needs …` comment. The seventeen nodes with no declaration of their own are listed at the end of
  the file with the reason.

## Main findings

1. **RJW Theorem 6.7(ii) is false as printed** (`ColemanIntegration/E15`), in both the arXiv
   version and the version of record (Ess. Number Th. 4 (2025), p. 154). The notes' own
   Definition 5.18 gives $L_p(\theta,s)=\int\chi\omega^{s-1}(x)x^{-s}\,d\mu_\eta$. The Coleman
   sum computes $\int\chi(x)x^{-k}\,d\mu_\eta$, which is $L_p(\theta\omega^{1-k},k)$ and not
   $L_p(\theta,k)$.
   - **Parity.** For even $k$ and odd $\theta$, $L_p(\theta,\cdot)\equiv0$. The printed right side
     does not vanish, because the inversion relation pairs $c$ with $-c$ without cancellation.
   - **Numerics.** $p=5$, $\theta=\chi_{-3}$, $k=2$: the left side is 0 and the right side is a
     unit.
   - **What was proved.** L3 proves the corrected form for every nontrivial primitive $\theta$ and
     every $k\ge1$, and `ColemanIntegration:L3/coleman-formula-rjw-normalisation` gives the form
     for $L_p(\theta,k)$ itself.
   - **Rescoping.** The L3 stage text copies the printed statement, and restructuring proposal
     14 asks to correct it.
2. **Gap in RJW §6.2 for pure $p$-power conductor** (`E17`). For $D=1$ the measure $\mu_\theta$ is
   not defined, and $F_\theta$ has poles inside the open disc, so the proof of Lemma 6.4 fails
   even at $k=1$. Theorem 6.1(ii) remains true; the fix is RJW's own smoothed measure $\mu_b$
   of §7, twisted by $\chi$. This matters for DirichletPadicLFunctions:L3, which owns
   Theorem 6.1 (restructuring proposal 12).
3. **No public source proves Coleman's formula for $N$ a power of $p$ and $k\ge2$.**
   Bannai–Hagihara–Yamada–Yamamoto treat $N$ not a power of $p$. The smoothed-measure argument
   of L3 covers the missing case, checked numerically at $p=3$, $N=9$.
4. **L1 is built directly, with no Tannakian input.** It uses successive extensions of a
   unipotent word algebra continued along Frobenius by Dwork's principle.
   - It is complete for $U_N=\mathbb P^1\smallsetminus(\{0,\infty\}\cup\mu_N)$, $p\nmid N$,
     where $H^1$ and the Frobenius are explicit.
   - For general good-reduction curves it is stated with its hypotheses and imports rigid
     geometry.
   - The uniqueness principle is proved from the datum alone. Besser only sketches independence
     of the Frobenius lift (`E5`); `L1/taylor-homotopy` supplies it.
5. **Coleman's 1982 paper has no public copy and is never cited as read.** The results the
   sources attribute to it are proved from L0/L1: the distribution, inversion and Frobenius
   relations, the local form at 1, and the limit at 1. The L2 coverage entry records the
   comparison to make when a copy is available.

The other source issues (`E1`–`E14`, `E16`, `E18`–`E24`) are misprints or local gaps in BBK,
Besser's two papers and his Heidelberg lectures, Besser–de Jeu, BBdJR, Wojtkowiak and RJW. Each
records the versions compared.

## How the packet was produced

Three authoring passes ran in parallel:
- **A:** L0/L1;
- **B:** L2;
- **C:** L3.

B and C cited placeholder ids for the lower layers, and I merged the three passes. At the merge:

- **Placeholder ids renamed.** Every placeholder became the node id that states the property.
  - B's branch, disc-primitive, annulus, Coleman-function, integration and lift-independence
    placeholders → `L0/log-branch`, `L0/disc-primitive-unique`,
    `L0/annulus-log-transcendence` + `L0/annulus-log-primitive`, `L1/coleman-functions` +
    `L1/coleman-pullback`, `L1/punctured-line-coleman-functions`,
    `L1/punctured-line-based-primitive` + `L1/coleman-integral` and
    `L1/frobenius-lift-independence`.
  - C's placeholders → `L2/p-adic-polylogarithm`, `L2/differential-recursion`,
    `L2/polylogarithms-on-the-punctured-residue-discs`, `L2/value-at-one`,
    `L2/values-at-tame-roots-of-unity`, `L2/branch-dependence`, `L2/galois-equivariance` and
    others, node by node.
  - I compared each placeholder's required properties with the statement of the node that
    replaced it.
- **Galois equivariance re-proved.** `L2/galois-equivariance` had cited a transport of Coleman
  functions by automorphisms of $\mathbb C_p$, which no L1 node states. I rewrote its proof
  through `L2/elementary-characterisation`: σ maps the characterising class for $a$ onto the one
  for σ(a), so uniqueness applies. This needs no Coleman theory.
- **One gap closed.** C's gap (the conductor-$p$ numerical check used the Li₂ reflection formula)
  is closed by `L2/dilogarithm-identities` (a).
- **One gap dropped.** B's gap "Coleman 1982 not public" was a sourcing note, not missing
  mathematics. It moved to the L2 coverage entry.
- **Duplicate source issues merged.** B's EB5 and EB6 duplicate C's issues, now `E17` and `E19`.
  C's EC10 and EC12 duplicate B's issues, now `E10` and `E12`. The remaining issues are
  renumbered `E1`–`E24`.
- **Besser–de Jeu split into two sources.** B read the version of record and C read arXiv v2, so
  they are `besser-dejeu-syntomic` and `besser-dejeu-syntomic-arxiv`.
- **Lean parts joined.** L2 was prototyped against the interface `IsLogBranch`, and L3 against
  four predicates on parameters `Li` and `plog`. The section `Links` joins them:
  - `isLogBranch_padicLogBranch`;
  - `colemanPolylog p a`, which is B's polylogarithm with A's branch;
  - the four L3 predicates for `colemanPolylog`, stated for $K=\mathbb C_p$.

  Mathlib has no `Algebra ℤ_[p] ℂ_[p]`. I added one as the completion of the $\mathbb Z_p$-algebra
  `PadicAlgCl p`, whose scalar action is Mathlib's existing one. Its `UniformContinuousConstSMul`
  and `ContinuousSMul` instances are proved, not assumed.

Checks I ran myself beyond the passes' own:
- the E15 counterexample from RJW Definition 5.18, together with the parity argument above;
- the BBK sign misprint (`E1`) and the Wojtkowiak sign (`E14`);
- the log-ownership decision against `research/blueprint/restructure/RS-14.result.json`.

## What remains

- **L0** is `source_decomposed`.
- **L1** is `partial`, with two gaps (general curves only):
  - the algebraic de Rham comparison for good-reduction affine curves;
  - lift independence and pullback when Ω⁺ is not free.
- **L2** is `partial`, with one gap: the five-term relation in maximally degenerate
  configurations. A two-variable lemma is sketched; the alternative is an L1 rescoping to
  semistable reduction (restructuring proposal 11).
- **L3** is `partial`, with two gaps:
  - the proof of Besser–de Jeu Theorem 1.10(2) is not decomposed;
  - complex Artin L-functions with coefficients have no owner.
- **Requests:**
  - LocallyAnalyticDistributions L1 (2);
  - AdicSpacesPartII F1, R2;
  - PadicHodgeTheory P7 annulus foundations;
  - PadicDifferentialEquationsAndRigidCohomology RD.0, RD.4, RD.5, RD.6;
  - DirichletPadicLFunctions L0–L3;
  - PadicMeasuresIwasawaAlgebras L2, L3;
  - PadicHodgeRegulators D.2;
  - Polylogarithms P.4;
  - BorelRegulators R.7;
  - AutomorphicPadicLFunctions L3.

  Each names the exact statement needed and the nodes that need it.
- **Restructuring proposals (15), main points:**
  - log ownership stays with L0, as RS-14 decided;
  - move the DirichletPadicLFunctions L0 → ColemanIntegration edge to L3;
  - import dagger algebras, annuli, Frobenius lifts and rigid cohomology instead of planning them;
  - divide L1 into L1a (general) and L1b (punctured line);
  - Coleman vs abelian integrals go to EffectiveDiophantineMethods ED.4;
  - GSWZ Lemma 2.1 is planned twice (with HabiroNumberFields HB.7);
  - correct the L3 target statement;
  - move the complex polylogarithm on the unit circle to Polylogarithms P.1.
- **Overlaps inside the packet, left as they are and cross-referenced:**
  - `L3/polylog-primitive-on-residue-disc` generalises part (a) of
    `L2/polylogarithm-expansion-at-a-root-of-unity` from roots of unity to every $w$ with
    $|w|\le1$, $|w-1|=1$, and cites it.
  - The character-sum lemmas of L3 (`L3/euler-factor-from-p-power-map`,
    `L3/gauss-sum-root-of-unity-independence`) are the general forms of parts (b) and (d) of
    `L2/twisted-sums-for-primitive-characters`. A reviewer may prefer to move them to
    DirichletPadicLFunctions.

## Numerical checks

PARI/GP 2.17.4.
- **L0/L1:**
  - PARI's log is the Iwasawa branch.
  - At depth two, the direct construction agrees with Besser's measure formula for
    $p\,\mathrm{Li}_2^{(p)}$ at $p=3,5,7$, to the depth of the Riemann sums.
- **L2:**
  - tame values and Besser's congruence;
  - special values, and the distribution, inversion and Frobenius relations, including inside
    the residue disc of 1;
  - overconvergence radius $p^{1/(p-1)}$;
  - growth of the expansion at a root of unity;
  - the five-term relation for two branches.
- **L3:**
  - complex formula to about $10^{-76}$;
  - $p$-adic formula for tame, mixed, pure $p$-power and conductor-$p$ characters, at $k=1$ to 4,
    to $O(p^{19})$–$O(p^{39})$.

## Sources

| id | edition | SHA-256 |
| --- | --- | --- |
| rjw | arXiv:2309.15692v2 | `efa1e101…` |
| rjw-ent | Ess. Number Th. 4 (2025) 101–216, version of record | `78d0479b…` |
| furusho-pmzv1 | arXiv:math/0304085v2 | `fd2391bd…` |
| besser-tannakian | arXiv:math/0011269v1 | `35d1b109…` |
| besser-heidelberg | Heidelberg lectures, author copy (7 Nov 2010) | `cbb50a05…` |
| bbk-explicit | arXiv:1004.4936v2 (v1 compared) | `319f92f3…` |
| mccallum-poonen | author preprint | `fb8d1a58…` |
| besser-finite-polylog | arXiv:math/0006051v1 | `10483e75…` |
| besser-dejeu-syntomic | Ann. Sci. ENS 36 (2003), version of record (arXiv v1, v2 compared) | `c269f455…` |
| besser-dejeu-syntomic-arxiv | arXiv:math/0110334v2 | `67b19d01…` |
| bbdjr-beilinson | arXiv:0707.3682v2 (v1 compared) | `609a6f67…` |
| bhyy-polylog | arXiv:2003.08157v2 | `e7d1204c…` |
| gswz | arXiv:2412.04241v2 | `308d1dd1…` |
| wojtkowiak-functional | Bull. SMF 119 (1991) 343–370, version of record | `3c29dd4f…` |

All were read from public copies on 25 September 2026. The packet has the URLs, the full hashes
and the sections read.
