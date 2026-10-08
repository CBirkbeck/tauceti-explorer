# PKG-SmallRamificationAndAbelianVarietyBaseCases

Issue: #7496. Agent: Codex, session `codex-22M5Qc`.

## Result and authoritative inputs

The package presentation is complete and ready for its independent package
review. Lean elaboration remains unverified because the existing shared build
lacks a required compiled Tau Ceti import; the precise receipt is below.

The deliverables are:

- `research/blueprint/packages/SmallRamificationAndAbelianVarietyBaseCases/README.md`;
- `research/blueprint/packages/SmallRamificationAndAbelianVarietyBaseCases/Suggested.lean`;
- `research/blueprint/packages/SmallRamificationAndAbelianVarietyBaseCases/metadata.toml`.

The README follows the six mathematical layers, from normalised local differents
to the terminal base-case table. It includes all 59 accepted targets, 45 API
items and 34 tests, their hypotheses, source locators and prerequisites. It is
about 113 KB, below the 200 KB ceiling. Metadata is `topic = "math.NT"`.
The full upstream EllipticCurves and ClassFieldTheory roadmaps were read as
examples of organisation and density. WORKERS, both protocols, UPSTREAM_GUIDE,
the reviewed library audit and the relevant supplier descriptions were read.

The definitive input is
`research/blueprint/packets/SmallRamificationAndAbelianVarietyBaseCases.json`,
accepted by `independent-review-REV-SmallRamificationAndAbelianVarietyBaseCases`
on 1 October 2026. Its six layer entries are closed, with zero gaps and 31
supplier requests. The independent review corrected 51 of the original 55
targets and added four. The older reader predates those corrections, so its
mathematical claims were not carried over indiscriminately. In particular:

- The packet's top-level `status: partial` is inconsistent with its accepted
  review and six closed layer entries. No input file was changed by this job.
- Its summary says the primary Fontaine source was inaccessible. The
  author-hosted publisher scan is now readable and was consulted here.
- The exception at characteristic eleven and weight fourteen, the corrected
  degree certificates and the direct units argument for Schoof's prime-seven
  case are retained.

## Mathematical points for review

The reader distinguishes the normalised different `d/e` from both the integer
different exponent and the discriminant exponent. The unramified-quadratic
base-change and local twelfth-root-of-unity tests separate the ramification
index from the extension degree. The sharp characteristic-two bound is not
attributed to Tate's original, weaker estimate. The characteristic-three proof
uses the Borel action, the two possible tame signs and equivariant reciprocity;
the general weaker bound does not replace that argument.

The analytic lower bounds have unconditional critical-strip positivity. The
positive-definiteness of the hyperbolic-cosine ratio, the explicit formula, and
the rational integral certificates are separate inputs. Degree monotonicity
has `b > 0` and positive degree. The three weakened degree rows from the
accepted review are used. For the principal ideal calculation in
`ℚ(ζ₁₂)`, the discriminant criterion has threshold `(4π²/3)²`, which exceeds
144; a root-discriminant estimate alone is not asserted to prove class number
one.

Fontaine's strict torsion-field bound is for group schemes killed by the prime,
with `v_p(p)=1`; it is not asserted for arbitrary prime-power torsion. Simple
finite flat two-group schemes must be nonzero. The Ext argument identifies the
exact kernel, rather than treating an injection as an equality. The point-count
contradiction uses torsion of growing rank and isogeny-invariant finite-field
point counts.

For Schoof's prime-seven case, the argument does not infer solvability of a
smaller field from an abelian compositum. The units calculation over the
specified auxiliary field is stated directly. The semistable category is not
closed under arbitrary extensions, and its negative tests preserve that
distinction. The boundary at eleven is exhibited by `J₀(11)`.

GL₂-type is defined over a number field, with a degree-equals-dimension
endomorphism field; it does not require geometric simplicity. Realisation uses
odd coefficient characteristic and Snowden's (A1) hypothesis. The reduction
comparison retains its local hypotheses, including an unramified semisimple
part for the Steinberg twist. Ordinary terminal cases require the local–global
compatibility that proves the modular form has level one, in addition to
ordinarity and modularity lifting.

At `(p,k)=(11,14)`, the four inertia cases include a non-split extension with
subcharacter `ω` and quotient `ω²` whose twists have weights 22 and 10, rather
than two. The theorem and table therefore exclude eleven from the
weight-fourteen assertion. The published Khare–Wintenberger theorem, rather
than the erroneous universal weight-fourteen assertion in the first preprint,
is the reference. Neither the table nor its proof uses R26 or R33 as an input.

## Sources and baseline

The 13 source versions listed in the accepted packet were obtained from their
public arXiv, author or journal URLs, and every downloaded SHA-256 matched the
packet's receipt. Their permanent version and hash records remain in the
unchanged packet. The additional version of record is:

- Khare–Wintenberger, *On Serre's conjecture for 2-dimensional mod p
  representations of Gal(ℚ̄/ℚ)*, Annals of Mathematics 169 (2009), 229–253;
  [published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf),
  Theorem 5.4, p. 247.
  SHA-256: `154c0c2a2245e50cb2be3c82705f9176fe0e9b597424236ddca11299d38cdb22`.

The primary-source checks included Schoof §§1–6, pp. 847–858;
Fesenko–Vostokov, second edition, I(5.7)–(5.8), pp. 14–16, and
IV(3.4)(1)–(3.5), pp. 135–136; Moon–Taguchi, Lemmas 1–3, pp. 2–5;
Fontaine, the statements on p. 516 and §3.4.5–3.4.6, pp. 536–537;
Snowden §9.4, pp. 29–30, with the conventions in §1.2 and §3.1;
Khare, Lemmas 5.1–5.2, pp. 20–21; and the Dieulefait–Pacetti terminal
argument, §2, pp. 14–15. The Jones, Ghitza–Yamauchi and Odlyzko
different/discriminant formulas and the earlier Khare–Wintenberger version
were checked at the locators recorded in the reader. These are source-reading
receipts, not a claim to re-prove or formalise the results.

The library index was read. No restricted book was needed. No source file or
source passage is included in the deliverables; prose is in the worker's own
words. A long-phrase comparison found only the full Odlyzko bibliographic
title in common with source texts.

All 80 baseline declaration heads and hypotheses were inspected at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reader names them and
distinguishes what they actually supply from the extra interfaces requested of
other roadmaps. In particular, finite locally free group schemes and a
base-change functor do not by themselves give exactness, integral abelian
models, Tate modules or a reduction criterion. Those remain supplier results.

## Suggested Lean file

The file has one import block, one introductory header and the consistent
namespace `TauCeti.SmallRamification`. It contains unproved signature
prototypes and typed tests. It is not a formalisation of the roadmap.

The accepted Suggested file already omits twelve declarations and the
Tate-module half of the GL₂-type base-change API where the supplier conditions
cannot be expressed at the pinned baseline. The header retains their full
intended mathematical signatures. These include semistable torsion and
nonexistence, rational and λ-adic Tate modules and realisation/descent,
crystalline terminal cases and the compatible-system application. The reader
contains every corresponding target. No missing condition is replaced by
`def _ : Prop := sorry` or by an unspecified hypothesis field. The table theorem
in the code is explicitly the conjunction of the six expressible rows, rather
than a claimed Lean theorem for all nine rows.

Local ramification data and the Serre-weight function retain the explicit,
supplier-owned data placeholders from the accepted prototype. Other adapters
are written on the existing Galois, matrix, group-scheme and abelian-variety
objects. Their replacement by the owners' final interfaces is stated in the
header. The prototypes must not be mistaken for those completed interfaces.

Three local corrections were made in the package copy:

1. `localRootDiscrExp_eq_sum_upper` uses the supremum of the groups at `v > u`
   for `G^{u+}`. The inherited infimum would intersect arbitrarily late,
   trivial groups and give the wrong different formula.
2. The three unit-filtration power lemmas assume continuity of the algebra map
   from `ℚ₂` or `ℚ₃`. Together with the nonarchimedean local-field topology,
   this ties the given valuation to the intended finite extension, instead of
   allowing an unrelated valuative structure.
3. The header's reduction comparison specifies the unramified semisimple part
   of the Steinberg twist. The reader makes the same local qualification.

The original accepted inputs were not edited.

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/SmallRamificationAndAbelianVarietyBaseCases.json`:
  **0 errors, 0 warnings**, 59 targets, 45 API items, 34 tests, 18 planets,
  80 baseline declarations, zero gaps, 31 requests and six closed layers.
- Content checks found all target, API, test and baseline names; balanced math
  delimiters and table rows; a resolving Suggested-file link; valid TOML;
  one import block and one main Lean header; no private filesystem paths,
  reader Lean code blocks, process statuses or fake proposition placeholders.
- The submission's `intake.py check-files` check reports **4 files, 0 problems**.
- `lean-check research/blueprint/packages/SmallRamificationAndAbelianVarietyBaseCases/Suggested.lean`:
  **exit 1 before elaboration**, both initially and after the prototype edits.
  The diagnostic is that the object file for
  `TauCeti.Analysis.PositiveDefinite.AddGroup` does not exist. The file's body
  was not elaborated, so no claim of compilation or of only-sorry warnings is
  made.
- The existing shared build has the exact pinned Mathlib commit. Its Tau Ceti
  checkout is `cf386627e9`, ahead of the required pin, and lacks the needed
  compiled analysis module. Declaration verification used the required pinned
  source trees. No library build, cache retrieval or update was run.
- Available memory was 111 GB before the final serial Lean check. No language
  server or background compilation was started. Scratch stayed below 1 GB.

No written package deliverable remains unfinished. The independent reviewer
should compare the six layers and prototype distinctions with the accepted
plan, then repeat `lean-check` when the required compiled Tau Ceti modules at
the pinned baseline are available. Compilation errors in the body, if any,
remain unmeasured by the import failure. The complete package, accepted inputs
and this note contain the information needed to resume; no scratch artifact is
required.
