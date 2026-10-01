# RT-PAPER-LUST-STEVENS-20: fixes

Fixer: Claude Code, session `cc-c2c06b`, 1 October 2026 (issue #5540, job FIX-RT-PAPER-LUST-STEVENS-20).
- **Findings:** `RT-PAPER-LUST-STEVENS-20.result.json`, five findings, all confirmed in
  `RT-PAPER-LUST-STEVENS-20.review.json`. All five are applied, in the form the verifier gave.
- **Files changed:**
  - `papers/PAPER-LUST-STEVENS-20.result.json`;
  - `papers/PAPER-LUST-STEVENS-20.md`, which has a new closing section.
- **Result:** 158 items, two routes and 40 sourceIssues. `check_paper.py` reports ok and `intake.py check-files` reports
  0 problems.
- **Independence.** I wrote none of the following:
  - the extraction (`cc-f805bf`, PR #4609);
  - its review (`cc-fb70e5`, PR #4633);
  - the red team (Codex `codex-rtOQ9t`, PR #5306);
  - the verification (`codex-5ebb6f`, PR #5316).
- **Sources read:**
  - the version of record (<https://ueaeprints.uea.ac.uk/id/eprint/74421/7/Published_Version.pdf>, SHA-256
    `bd8295cf…4c55`), §7.3 pp. 1100–1102;
  - arXiv v1 (SHA-256 `c1c8bd2f…d489`), §7.3 pp. 17 and 19.

## /1 (high): the Weyl representative: fixed

- **s7-7.6-weyl-representative-action** now takes w(e_i^−) = e_i^+ and w(e_i^+) = ε e_i^− on the exchanged pairs.
  - It states that w preserves the form and has determinant (−ε)^n, so w lies in Sp for ε = −1 and in SO for ε = 1 when
    n is even.
  - The induced action (7.6), numbered (7.7) in print, and the later parameter table are unchanged, as the finding asks.
- **New sourceIssue E39** records the printed w(e_i^±) = ε e_i^∓.
  - It is in arXiv v1 p. 19 and in print p. 1102.
  - It includes the rank-one test: the matrix [[0, −1], [−1, 0]] has determinant −1 and sends J to −J.
  - It records the correction search.
- **Route 2's brief** names the corrected representative.

## /2 (high): the Levi of the §7.3 reduction: fixed

- **s7-7.3-eigenspace-levi** is replaced by the published construction (pp. 1100–1101).
  - ℒ* is the minimal F-stable Levi containing the centralizer of s, the Levi of a possibly non-F-stable parabolic. It
    equals 𝒢*_s when s|_{V_0} = ±1 for V_0 = ker(s² − 1).
  - Its connected centre has the same F_q-rank as that of 𝒢*, which gives the twisted Deligne–Lusztig bijection of
    cuspidals.
  - ℒ̃ is a product of general linear groups with twisted Frobenius and one classical group 𝒢̃_0 with connected centre.
  - The item says explicitly that ℒ* is not the stabilizer of the rational primary decomposition.
- **The locator** cites published §7.3, pp. 1100–1101.
- **New sourceIssue E40** records the arXiv v1 statement (p. 17), with the verifier's SO_5 example at q = 3. Its `known`
  field names the published correction.
- **Route 2's brief** names the published construction.

## /3 (high): J/J¹ in the ramified unitary case: fixed

- **s2-reductive-quotient-J** now branches by ramification:
  - the determinant condition applies when F = F_o or F/F_o is unramified quadratic;
  - if F/F_o is ramified quadratic, 𝒢 = U(V̄_(1)) × U(V̄_(2)) with no determinant condition;
  - the connected-component description holds in every case.
- **E5** is kept as the source record; no duplicate erratum was added.
- **Route 1's brief** states the branch.

## /4 (high): the maximality criterion: fixed

- **The maximality clause of s2-parahoric-Jo-properties** now cites the criterion of s2-maximal-parahoric-exceptions:
  maximality fails only for a split SO(1,1,k_F) residual factor when G is not itself two-dimensional special orthogonal.
  It also says that anisotropic SO(2,0,k_F) factors do not obstruct.
- **The explicit case list** in s2-maximal-parahoric-exceptions is preserved, and that item's note points to the
  agreement.
- **E6** is kept, and route 1's brief states the criterion.

## /5 (high): split SO(1,1): fixed

- **The hypothesis "G is not the split SO(1,1) ≅ GL_1"** is added to:
  - the normalizer clause of s2-parahoric-Jo-properties;
  - s2-maximal-compact-lattice-stabilizers;
  - the subgroup-label part of s2-standard-lattices-conjugacy;
  - s3-depth-zero-classical-classification;
  - s3-depth-zero-uniqueness.
- **The lattice-orbit statement** ("every almost self-dual lattice is gL_{N_1,N_2} for a unique standard lattice") is
  kept for every G. Only the injectivity of labels on subgroups is restricted, since J_{1,0} = J_{0,1} = 𝔬_F^× for split
  SO(1,1).
- **Propagation** to the later local-data constructions:
  - s8-setup-local-data and main results (ii) and (iii) carry the hypothesis;
  - s1-main-thm-i and s5-cover-existence carry a scope note.
- **The split SO(1,1) case is deferred,** as the finding allows. Its depth-zero cuspidals are characters of F^× trivial
  on 1 + 𝔭_F, and they are not compactly induced from 𝔬_F^×. This is stated in s3-depth-zero-classical-classification
  and in route 1's brief.
- **E7** is kept.
