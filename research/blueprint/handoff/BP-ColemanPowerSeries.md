# BP-ColemanPowerSeries — the fixed-space Frobenius sequence

Codex — codex-7e92bd. Refs #699. Follow-up to own merged PR3187 under the
WORKERS correction provision; claim5852872635 was confirmed by bot5852873632.
The entire issue was reread after that confirmation. No second claim or
independent review is asserted. All 84 preceding node objects, 95 baseline
records, eleven source findings, eight preceding planets and stage statuses
are preserved. All five stages remain incomplete.

Totals: **98 nodes** (2 definitions, 10 constructions, 69 lemmas,
10 theorems, 7 comparisons); **60 API items**; **82 packet tests**, including
42 definition/construction tests; **84 typed examples**; **9 planets**;
**109 baseline references**; **6 gaps**, **12 requests**, **12 source findings**.
Every implementation status remains unchecked.

## Supplied mathematics

Fourteen L3 declarations decompose RJW Lemma12.15 on the actual native
power-series carrier and PMIA bounded psi operator. With B=Z_p[[T]],
phi(F)=F((1+T)^p−1), W=ker(psi−id) and U=ker psi, the maps in

0 → Z_p → W → U → Z_p → 0

are constant inclusion, 1−phi and native coefficient-zero evaluation. The
boundary kernel is the constant series and its range is the zero-evaluation
submodule of U. The final evaluation is surjective through c(1+T).
Continuous compact-to-Hausdorff maps give the asserted closed image and
quotient topologies. The constant inclusion is a closed embedding.

The substantial input is coefficientwise convergence. The parameter
(1+T)^(p^n)−1 tends to zero by continuity of p-adic binomial coefficients at
p^n→0. A finite substitution-coefficient formula proves phi^n(F)→0 whenever
F(0)=0. Complete nonarchimedean coefficient groups give summability. The
native Frobenius-iterate sum S(F) satisfies (1−phi)S(F)=F, and psi(S(F))=S(F)
when psi(F)=0. Its domain restriction is essential.

The all-prime integral argument includes p=2. For F=Y−Y³ over Z_2, the sum
has first coefficient 2 and second coefficient 1/3. The linear coefficient
of phi^n(T) is nonzero p^n, so T-adic convergence would be false. The topology
is the coefficientwise p-adic topology, not the coefficient supremum norm.

This is the fixed-series sequence, not the complete Coleman sequence.
The preceding norm/logarithmic derivative map and its constant-root kernel
are unchanged. Its image-surjectivity argument remains required.

## Sources, ownership and finding E12

Fresh reading on 27 September2026:

- [Published RJW](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), full
  PDF83–85 / printed182–184, including Lemmas12.12–12.15 and the beginning
  of Theorem12.17. Published p.184 was also checked as a rendered page.
  SHA256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.
- [arXiv v2](https://arxiv.org/pdf/2309.15692v2), full p.62 / PDF62,
  collating the end of the proof with the published formula.
  SHA256 `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.

The published proof prints p times the leading nonconstant coefficient;
the correct factor at degree r is p^r. Finding ColemanPowerSeries/E12
records this proof misprint, also present in v2. The test F=T² gives p²,
not p. The fixed-constants conclusion is unchanged because 1−p^r is a unit.
The publisher article and issue pages were fetched and showed no erratum
link, latest arXiv v2 retained the error, and title/author/lemma correction
searches and the atlas registry found no identified correction. The author
publications URL returned404 and was not read. The “new” token is bounded
search evidence, not a priority claim or independent-review verdict.

The reviewed AUDIT24 and accepted RS16 assign this exact sequence to Coleman
L3. Its native carriers and generic topology are in Mathlib. Exact PMIA
psi-series, psi-series-phi, psi-series-continuous, series-unit-restriction and
phi-psi-series-continuous interfaces were read and reused. Generic substitution
coefficient/continuity arguments remain proof-local baseline specializations.
The packet inventory and pinned libraries yielded no exact fixed-space
sequence supplier. The fourteen added baseline statements were read at the
pin; generated additive infinite-sum statements are cited through their
literal indexed multiplicative generators, with the additive forms checked.

Earlier whole-issue, protocol, owner, model, audit and source reading belongs
to this continuous session; byte checks show the captured inputs unchanged.
No new whole-paper or Coates–Sujatha reading is claimed. Twelve requests and six stage gaps remain. The L3 fixed-space subtask is
supplied. After reading the fifteen newly merged PMIA topology interfaces,
the L0 request is narrowed to integral-lattice/field-valued operator-norm
comparison; weak and field-valued strong identifications are now supplied.
All 142 preceding supplier nodes and our 98 node objects are unchanged.

## Validation

The actual full suggested file compiles with **0 errors and 212 expected
placeholder warnings only**. Its actual PMIA supplier compiles with **339
placeholder warnings only**. All **2,759 Mathlib modules** reached by the
supplier and Coleman seed match the pin; no Tau Ceti module is reached.
The seed retains all preceding bytes and adds two imports and the new
signatures/API/examples. It remains a suggested declaration file.

Nine separate complete Lean lemmas verify the convergence chain, including
actual iterate substitution, the finite coefficient bound, parameter decay,
summability and continuity of zero-constant substitution. They compile with
**0 errors, 0 warnings and 0 placeholders**, reaching **2,036 pinned Mathlib
modules**. These scratch calculations are validation, not implementation
claims for the roadmap.

**1,216,524 exact assertions** pass for p=2,3,5 and precisions p²,p³,p⁴.
Truncated convolution checks substitution and telescoping. Sparse Y-polynomial
psi is applied before taking T coefficients, so the harness does not assume
psi descends to T-adic truncations. Exhaustive degree-three fixed-kernel checks
modulo p² run in each precision batch. Tests cover dyadic coefficients,
constant/evaluation obstructions, the corrected leading factor and failure of
T-adic decay. Finite arithmetic does not prove the infinite sequence or topology.

Indexed blueprint validation: **0 errors, 0 warnings**. Exact four-file intake:
**0 problems**. The twelve-finding errata wrapper passes. Preservation,
reader/signature/API/test parity and authorized scope checks pass. The acyclic
cross-packet graph reaches **150 nodes**, **160 baseline leaves**, through
**594 edges**, with no undeclared or stage-request leaves. The stage gaps are
still explicit and are not eliminated by this graph check.

Suggested-file SHA256: `b2e7da057e2f0ac82ed4eb27ad3e450d72d038cbdf82049c7d76db7df4c76054`.
Complete convergence-proof SHA256: `6db17a3f2eb2b1bfbbea025d44e18cadc849b7bdc82333b1f144a0ff6983e1f0`.

The refreshed module audit contains 2,760 entries: 2,759 Mathlib sources and
one actual research supplier. The earlier compiler's 2,757 total comprised
2,756 Mathlib modules plus its research supplier; the earlier description
counting all entries as Mathlib is corrected. Every reached Mathlib source
passes the pinned byte comparison.

Final guard: all **52 captured inputs** and **four predecessor outputs**
match main `1df817b2abcf3c588c127f3d6433fd8399e29d21`. Issue699 remains available,
the last winning bot confirmation is unchanged, and review374 is unclaimed.
Only the four authorized deliverables are published via Git Data REST.

## Where to resume

Prove the logarithmic-derivative image-surjectivity argument of published
Lemmas12.11–12.14 on the actual norm-fixed subgroup, obtaining Theorem12.9.
Then combine it with this fixed-series exact sequence and the existing
unit-supported inverse derivative. Construct the actual cyclotomic tower,
interpolation and action identifications before deriving Theorem12.17,
its Tate-module kernel and cyclotomic-moment cokernel. Distinguish the kernel
on all units, the constant-root kernel on norm-fixed units, and the full
Coleman-map kernel.

L0 retains tower fields and genuine unit modules. L1 retains determinant/root
product, arithmetic norm/evaluation compatibility and interpolation. L2
retains the full Coleman composite and arithmetic action comparison. L4
retains the local cyclotomic-unit quotient. Coefficient extensions and
completed-tensor topology remain supplier work. The precise remaining lists
in the packet are authoritative; no stage is closed.

Preceding handoff: [PR3187](https://github.com/CBirkbeck/tauceti-explorer/pull/3187).

Supplier refresh before publication: the current PMIA seed and 157-node packet
were fetched after the guard detected their merge. All fifteen new interfaces
and the complete seed diff were read. The weak clopen/unit homeomorphisms,
integral Amice homeomorphism and field-valued strong maps are supplied; the
remaining request is only the integral-lattice norm-model comparison.
