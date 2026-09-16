# EXT-08 handoff — Classical and analytic number theory

Job: EXT-08 in `research/expansion/EXTERNAL_AGENTS.md`.
Roadmaps: AdditiveCombinatorics, AnalyticNumberTheory, ArithmeticStatistics,
ClassicalArithmeticCompletion, ComputationalNumberTheory,
DiophantineApproximationAndTranscendence, ExponentialSumsAndCircleMethod,
FiniteFieldsAndCharacterSums — 8 roadmaps, 54 stages.

Status: all eight packets written and validated. Every packet is `partial`; every
node is `implementationStatus: unchecked`. No Lean work, no tickets, nothing
committed, nothing published.

## Note on one orchestrator instruction

The orchestrator constraints told this worker to write
`research/expansion/external/EXT-15/HANDOFF.md`. EXT-15 is another job's directory
and the same constraints forbid editing other jobs' directories, so the handoff was
written here instead. Nothing outside `research/expansion/external/EXT-08/` was
touched (confirmed with `git status`).

## Files written

| File | nodes | links | stage coverage | gaps |
| --- | --- | --- | --- | --- |
| `FiniteFieldsAndCharacterSums.json` | 13 | 7 | 6 (3 partial, 3 not_read) | 6 |
| `AnalyticNumberTheory.json` | 10 | 4 | 10 (4 partial, 6 not_read) | 5 |
| `AdditiveCombinatorics.json` | 9 | 7 | 6 (3 partial, 3 not_read) | 5 |
| `ArithmeticStatistics.json` | 8 | 6 | 6 (5 partial, 1 not_read) | 5 |
| `DiophantineApproximationAndTranscendence.json` | 7 | 4 | 6 (5 partial, 1 not_read) | 5 |
| `ExponentialSumsAndCircleMethod.json` | 6 | 6 | 6 (2 partial, 4 not_read) | 5 |
| `ComputationalNumberTheory.json` | 4 | 3 | 6 (2 partial, 4 not_read) | 4 |
| `ClassicalArithmeticCompletion.json` | 3 | 1 | 8 (2 partial, 6 not_read) | 3 |
| **totals** | **60** | **38** | **54 stages, all present** | **38** |

Validated with `python3`: JSON well-formed; every `parentStageId` exists in
`data/atlas.json` and every node id is prefixed by its parent; every `sourceId`
resolves; every link endpoint and every `neededBy` resolves to an atlas stage or a
packet node; coverage lists exactly the stages of the owning roadmap; the union of
`stageEdges` with the stage-level projection of the new links is **acyclic**.

Of the 19 stage-level edges implied by the new links, 13 already exist in the atlas
(recorded at node level with the exact output supplied), 5 are transitive shortcuts
inside chains the atlas already connects, and exactly one is genuinely new:
`AnalyticNumberTheory:AN.2 -> AdditiveCombinatorics:AC.4`.

## Sources actually read

**From the supplied library**
(the `TauCeti_Roadmaps_Revised_2026-09-15/revised_campaign/references/` tree):

- **SGA 4½, `Cohomologie étale`, LNM 569 (1977)**, exposé *Applications de la formule
  des traces aux sommes trigonométriques*. sha256
  `fb2939521f4c0ea0cdd55a90bec2e618e32fb433c78b194e705c6d989f4e42a6`.
  Read §§0–1 (exposé pp. 1–16), 2.1\*–2.3\* (pp. 16–17), §3 in full (pp. 22–28),
  §4.1–4.6 (pp. 29–32). Page mapping in this scan: exposé page *n* = volume page
  *n*+167 = PDF page *n*+206; the volume number is printed at the **foot** of the page.
- **Tate, *Fourier Analysis in Number Fields and Hecke's Zeta-Functions*** (1950
  Princeton thesis). sha256
  `0c40f263e8ab7924d1f0a8c7e40d81d464aec6620b8ec14101f21f7b07e6f0c8`.
  Read §2.4–2.5 and §4.4–4.5. **The OCR text layer of this typescript scan is
  unreliable**; the sections used were read by rendering scan pages 19, 21, 26,
  49–53, 57–59 as images.
- Deligne, *La conjecture de Weil II* — locator check only (title page and running
  heads); no proof of that paper was read.

**Authorized public copies obtained for this job**, kept in this worker's scratch
directory outside the repository and deliberately **not** copied into it:

- **Shoup, *A Computational Introduction to Number Theory and Algebra*, Version 2**,
  from the author's own free distribution page <https://www.shoup.net/ntb/>.
  sha256 `8e1abc54f4510c3f274dfbed07ea602a6a439ee24b2c916e61abe829b402ec06`.
  Read: Ch. 19 in full; §2.6, §2.8, §3.1–3.2, §3.3.4, §10.2–10.3, §12.1, §20.3–20.5,
  Ch. 21; table of contents.
- **Green–Tao, arXiv:math/0404188v6** (23 Sep 2007). sha256
  `d03dd6156165fc92e488b3fec35a574c8f7c9df55125cec0f3eebdf95d7256e1`.
  Read §§1, 2, 3, 5 (through Prop. 5.3), 8 (Prop. 8.1 and the deduction of Thm 3.5),
  9 (through the statements of Props 9.8/9.10), Lemma A.1.
- **Bourgain–Demeter–Guth, arXiv:1512.01565v3** (1 Apr 2016). sha256
  `5a6b7f66580d3f7db123f4e715aed5ef373cb0c96ee28b226be823cb68759abe`.
  Read §§1–6 through Theorem 6.6 and the reference list.
- **Bhargava–Shankar, arXiv:1006.1002v3** (24 Dec 2013). sha256
  `7670970aca5df135af4ab4da926d3b2e3acc937dd5a6c918f802552c528712cf`.
  Read §1.1–1.2, §2 opening, §2.2–2.3, §2.5–2.7 (statements), §3.1, §3.6.
- **Kedlaya, *Notes on analytic number theory*** (last modified 21 Dec 2025,
  CC BY-SA 4.0), <https://kskedlaya.org/papers/ant-ptx.pdf>. sha256
  `7a934fce8272cedd36ad609f79bbe79af0056320bb1e0bc690c87af990f305be`.
  Read front matter, contents, §5.1–5.2, §6.1–6.2, §7.1–7.2, §8.3, Ch. 22 in full.
  This is the work the atlas alias `KED-ANT` names; identity confirmed by title,
  date and contents.
- **Evertse, *Diophantine Approximation* lecture notes**, chapters 1, 4, 5, 6, 7,
  from <http://pub.math.leidenuniv.nl/~evertsejh/>. Per-chapter sha256 recorded in
  the packet. Chapter 8 (p-adic Subspace Theorem) was downloaded but not read.

Sources named by the roadmaps that could **not** be obtained: TAO-VU
(Tao–Vu, *Additive Combinatorics*, CUP), VAUGHAN (*The Hardy–Littlewood Method*),
SCHMIDT (LNM 785), COHEN-LENSTRA. All are copyrighted monographs with no authorized
free copy located; each is recorded as a gap in the relevant packet.

## Corrections to existing statements

1. **Printed misstatement in SGA 4½ [Sommes trig.], Exemple 3.5, volume p. 190.**
   The 1977 Springer printing reads `ψ(a^p − a) = 0` and "Cette somme est nulle pour
   f de la forme g^p−g". Verified by rendering the page as an image, not merely from
   the OCR layer. Since ψ is a character into p-th roots of unity and
   Tr(a^p − a) = 0, the value is 1 — which is also what the argument requires, because
   the invariance `S_f = S_{f+g^p−g}` asserted on the next page holds iff ψ kills the
   image of the Artin–Schreier operator. The packet relies on neither printed sentence.
2. **`FiniteFieldsAndCharacterSums:FF.1 -> AnalyticNumberTheory:AN.1` is under-scoped.**
   AN.1 needs Gauss sums `τ(χ) = Σ_{l=1}^{N} χ(l) e^{2πil/N}` of a *primitive*
   Dirichlet character of an arbitrary, generally **composite**, level N (Kedlaya §6.1,
   printed p. 40). FF.1's declared scope is characters of a *finite field*. The
   finite-ring material is FF.4's scope, but FF.4 sits downstream of FF.2 and FF.3.
3. **The AdditiveCombinatorics chain over-constrains AC.4.** Green–Tao state their
   argument "requires no Fourier analysis, additive combinatorics, or number theory"
   (printed p. 10); reading §§3, 5, 8, 9 confirms no sumset/energy/Plünnecke–Ruzsa/
   Balog–Szemerédi–Gowers/Freiman input. Along the selected route AC.4 consumes AC.2
   and the Gowers-norm part of AC.3, not AC.0 or AC.1. No edge was deleted.
4. **`SieveMethodsAndPrimePatterns:SV.3 -> AdditiveCombinatorics:AC.4` does not match
   the source.** SV.3 is Bombieri–Vinogradov, which the Green–Tao majorant does not
   use; it uses the Goldston–Yıldırım truncated divisor-sum asymptotics, the classical
   zero-free region, PNT and Dirichlet's theorem.
5. **`ArithmeticStatistics:ST.0` points at the wrong geometry-of-numbers supplier.**
   Bhargava–Shankar's lattice-point input is **Davenport's** estimate for bounded
   semialgebraic multisets with error = largest projection volume (their Prop. 2.6),
   not Minkowski's convex-body theorem, which is what GN.1 supplies. (By contrast the
   edge `GN.1 -> DT.0` *is* correctly scoped: Evertse's Theorem 1.3 is exactly
   Minkowski's first convex body theorem and is used to derive Dirichlet's theorem.)
6. **Degree scope of BDG.** ES.2's acceptance condition warns against citing a
   "degree-greater-than-three source" for low degrees. BDG's Theorem 1.1 is in fact
   stated and proved for all n ≥ 2; the title's phrase refers to novelty. The n = 2
   and n = 3 attributions (divisor estimates; Wooley) must still be carried.

## Shared-supplier requests

1. **Grothendieck–Ogg–Shafarevich Euler–Poincaré formula for a lisse sheaf on a
   curve, with Swan conductors** (SGA 4½ [Sommes trig.] (3.2.1)). Searched all 1604
   atlas stage descriptions for `Swan`, `Ogg-Shafarevich`, `Euler-Poincaré`: the only
   hits are `ArithmeticGaloisRepresentations:R01.3` (Artin/Swan conductors of Galois
   *representations* — a local ramification-filtration statement) and
   `HigherLocalFieldsAndHigherClassFieldTheory:HL.2/HL.4`. **No stage owns it.** Needed
   by FF.1 and FF.2 and by any later ℓ-adic exponential-sum work. In this packet the
   node is parked under FF.1 (its earliest consumer) with an explicit placement note.
   Suggested owner: a new node under `DeligneWeightsAndPurity` or `WeilConjectures`.
2. **Swan conductor of an Artin–Schreier sheaf**, `Sw_x(𝓛(ψf)) = v*_x(f)` (Serre,
   Bull. SMF 89 (1961), n° 4.4). Candidate owner `R01.3`, whose current scope is
   representation conductors, not sheaf conductors on curves.
3. **Goldston–Yıldırım truncated divisor-sum asymptotics** (Green–Tao Props 9.5, 9.6).
   No owner found; `SV.3` owns Bombieri–Vinogradov, which the proof does not use.
4. **Davenport's lattice-point estimate for bounded semialgebraic multisets.** No owner;
   `GN.4` ("lattice-point estimates and equidistribution") is the closest but is aimed
   at homogeneous dynamics and is not a prerequisite of `ST.0` or `ST.2`.
5. **Gauss sums for composite moduli** (characters of Z/N). Needed by AN.1 and CA.1;
   FF.1 covers only finite fields.

## Unresolved cross-job dependencies

- `DeligneWeightsAndPurity:DWP.7` and `WeilConjectures:WC.3` (EXT-02/EXT-03 territory):
  node-level edges into FF.2 are proposed with the exact output used. DWP.7's stated
  purity conclusion is a usable substitute for the weight input Deligne cites from Weil,
  **but** the residual step — identifying `H¹(X̄, j_*𝓛)` with the image of `H¹_c → H¹`
  on a curve — is recorded as a gap, not assumed.
- `UPSTREAM:CohomologicalPointCounting:TraceFormula` (owner `SchemeAndStackFoundations:SF.2`,
  consumed via `WeilConjectures:WC.1`): the trace formula for `E_λ`-sheaves is consumed
  by FF.1/FF.2 but its atlas status is `requires_declaration_and_proof_verification`.
  **No edge proposed** until SGA 4½ [Rapport] §§3–4 are read.
- `HeightsRationalPointsAndObstructions:RP.1` (EXT-07): scope-checked against
  Bhargava–Shankar's use — the consumer needs only exactness of
  `0 → E(Q)/2E(Q) → S₂(E) → Ш_E[2] → 0` and finiteness of `S₂(E)`, not finite
  generation of `E(Q)`.
- `ClassFieldTheory` owner (whoever holds it): both the Artin L-function continuation
  (AN.4) and CA.1's higher reciprocity need Artin reciprocity for ray class groups.
  Kedlaya's CFT notes (<https://kskedlaya.org/papers/cft-ptx.pdf>) were located but
  not acquired; one reading serves both.

## Largest unproved inputs (not disguised as input packages)

Szemerédi's theorem (assumed by Green–Tao); Roth's theorem and Schmidt's Subspace
Theorem (stated, not proved, in Evertse); Baker's quantitative bound and Matveev's
constant; the interior of the BDG decoupling proof; the Birch–Swinnerton-Dyer/Cremona
binary-quartic parametrization; the Euler–Poincaré formula and Serre's Swan
computation; Tate's Theorem 3.3.1; the Goldston–Yıldırım contour estimates. Each is
recorded in the owning packet's `gaps` with what was verified, what was not, and the
next source action.

## Next actions

1. Read SGA 4½ [Rapport] §§3–4 (volume pp. 76–153) to close the trace-formula boundary,
   and [Dualité] 1.3 (pp. 154–167) for the curve-level duality step.
2. Read the remainder of Green–Tao §§6–7 and BDG pp. 10–38 — both already downloaded,
   no acquisition needed.
3. Read Shoup Ch. 15 (integer factoring) and Chs 16–17 (CA.3 material) — already
   downloaded.
4. Acquire Bhargava, *The density of discriminants of quartic rings and fields*,
   Annals 162 (2005), Prop. 23 (uniformity estimate) — also the natural owner of the
   quartic-ring parametrization ST.1 needs.
5. Acquire Wooley arXiv:1508.05329 §7 for the ε-removal inputs and an independent
   efficient-congruencing route to ES.2.
6. Acquire Kedlaya's CFT notes; read Evertse Ch. 3 (heights) and Ch. 8 (p-adic Subspace).
7. Decide the FF.1/FF.4/AN.1 ownership of composite-modulus Gauss sums, and the owner
   of the Euler–Poincaré formula and Davenport's lattice-point lemma.
