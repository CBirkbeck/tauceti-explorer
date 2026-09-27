# BP-SieveMethodsAndPrimePatterns — finite Vaughan continuation

Agent: Codex — codex-a71f92, 2026-09-27. Refs #1036.
Claim [5855780173](https://github.com/CBirkbeck/tauceti-explorer/issues/1036#issuecomment-5855780173), confirmed by [5855781035](https://github.com/CBirkbeck/tauceti-explorer/issues/1036#issuecomment-5855781035). Whole issue read before and after confirmation. Initial snapshot f850a8a3d451af3b9a6f87f3ad4adc113c494920.

This is a partial checkpoint, not implementation. SV.0–SV.3 are partial; SV.4–SV.5 remain not_read. Every implementation status remains unchecked.

## What changed

Ten new SV.2 nodes supply the incomplete-log construction, subtraction formula, cutoff support, nonnegative/logarithmic bounds, native Möbius-convolution adapter, Vaughan's exact three-term identity with the small-number boundary, arbitrary-complex-weight hyperbola summation, exact cofactor support, finite Type I/II splitting and elementary coefficient energies.

All cutoffs are natural and may be zero. The boundary includes n=V. The bilinear cofactor bound is floor(N/(V+1)), and the inner upper bound still depends on the outer index. No multiplicativity or nonnegativity of the complex weight is assumed. Prime-power divisors are retained. These are finite identities and elementary energy estimates, not analytic cancellation or a rectangle approximation.

The native ArithmeticFunction carrier, convolution ring, Möbius/von Mangoldt/log functions, Möbius–zeta inverse and unweighted hyperbola summation are reused. The weighted specialization is the missing adapter. RS-07 assigns Vaughan/Type I–II to SV.2; SV.3 and ES.4 consume it without duplicating it. AN.0's retired library imports are not new suppliers.

Preserve every mathematical field of the 59 inherited nodes, all 122 baseline entries, all eighteen inherited findings and five source-version objects. Only the intermediate tapered-row-large-sieve node loses its planet; Vaughan's identity takes that slot. Its lemma is not removed or weakened. Totals: 69 nodes (5 constructions, 48 lemmas, 16 theorems), 27 API items with ten promoted into main lemma nodes, 23 construction tests, 78 typed examples, 11 planets (SV.0 five, SV.2 six), 137 baseline entries, 6 sources, 26 findings, 7 source versions, 6 gaps and no supplier requests.

## Reading and ownership audit

All six actual reviewed library-audit rows were read before planning. Binding worker, blueprint, expansion and upstream instructions are unchanged. Accepted RS-07 and reviewed audit evidence, native ownership, campaign/atlas scope, upstream arithmetic Dirichlet-series documents, sources and matching links were retained after byte comparison with the earlier same-session reading. The other worker's eight new primitive-character nodes, source/version, baseline entries, reader continuation and seven findings were read and preserved. AS and ES consumers were compared: their SV-relevant node/request/link objects remain unchanged.

The entire live [Chapter 18](https://kskedlaya.org/ant/chap-bombieri2.html) was read, including statements, proofs and exercises. SHA-256: 9bd73d12d648dc61a5c09804bbee04992cb8108b15858146688ac7ae9b69f523. The [2007 author handout](https://kskedlaya.org/18.785/bombieri2.pdf), revised 9 May 2007, was text-read in full and pp.3–4 visually collated; SHA-256 87ee17ecd82d46f6a6063fc53d7fc32d90767f85e5d5ed8cfdcbd040841e3256. Only (18.2.1)–(18.2.2), Exercises 18.4.1–2 and explicit finite extensions are decomposed. No journal edition is claimed.

New E19–E26 are unreviewed: omitted small-r normalization; an unsupported dyadic summation without the loss indicated by its displayed bounds; the finite boundary endpoint; impossible delta range; partition-count/rectangle-coverage defects; the malformed discrepancy display; invalid final balancing; and the free residue index in Theorem 18.5. Their corresponding defects persist in the 2007 handout. The packet records bounded correction searches; no exhaustive novelty or author contact is claimed. No finding declares the classical Bombieri–Vinogradov theorem false.

Pinned declarations were read before planning, including the existing unweighted convolution-summation theorem. Repository and pinned-library name searches found no Vaughan/incomplete-log supplier. A bounded upstream mathlib issue search for Vaughan returned only unrelated PR #17699 about forward differences, not an existing Vaughan implementation.

## Validation

The suggested file compiles with Lean 4.34.0-rc2: no errors, exactly 164 expected proof-placeholder warnings and no others. It contains 69 main signatures, 17 additional API signatures and 78 examples. All 8,482 reached Mathlib source files byte-match the pinned source tree; no Tau Ceti module is imported. No implementation is submitted.

Exact arithmetic regressions pass: 8,481 incomplete-log/convolution cases; 76,329 three-term identities; 17,640 arbitrary complex weighted hyperbola/split cases; 41,280 nonzero-support pairs; 20,825 coefficient-energy certificates; and twenty dyadic-gap certificates. Logarithms are represented by exact sparse prime-log coefficient vectors, weights by Gaussian rationals. The energy certificates use exact integer exp(lambda) bounds, not floating-point logarithms. Eight mutations reject missing boundary terms, wrong cutoff inclusion, omitted prime powers, a false log(n/V) formula, weight factorization, lost cofactor endpoints, lost small-factor endpoints and a false universal Möbius-square equality.

The packet checker with the pinned declaration index reports zero errors and warnings. The source-issue/version check passes, and the four-path intake reports four files and zero problems. The publication guard checks 61 consulted paths, the two known absences, new matching links, agent instructions, exact preservation, the dependency DAG, planet limits and the four-deliverable diff. Its latest read found no changed input or new matching link. All inherited finite-sieve, residue, Gram, taper, separation and multiplicative regression fields are historical evidence, not rerun here.

The optional standalone Vaughan proof run is not counted as passing evidence. An earlier run accepted the six general proof declarations but left a concrete divisor-finset example unsolved. That example was repaired in scratch; the later run was stopped under severe shared-host memory pressure before a clean result was obtained. The complete submitted signature build passed independently, as reported above. No passing standalone-probe or new implementation claim is made.

## Where to resume

The exact finite Vaughan interface is now available. Next decompose source-specific analytic Type I and Type II estimates without dropping the hyperbola restriction. Supply the actual rectangle approximation, boundary counting and loss factors before applying a rectangular convolution bound. Repair E19–E26 and review them independently; do not paper over the Chapter 18 proof defects.

SV.3 still needs the discrepancy definition/API, Lemma 18.2, Theorems 18.3–18.5, Corollary 18.6, Exercises 18.4.3–5 and exact small-modulus/zero-density supplier statements. Preserve every A, B, sufficiently-large-x quantifier and the full modulus/residue maximum in Bombieri–Vinogradov. Stronger distribution is only a hypothesis unless separately proved.

Read Chapter 15 for sharp additive constants and the squared-inequality adapter to native operator duality. The current multiplicative reduction retains H+2Q². Chapter 16 applications, SV.0 dimension/CRT/distribution, SV.1 optimization/fundamental-lemma/parity and SV.4–SV.5 original-source routes remain the six explicit gaps. Independent review is still required.
